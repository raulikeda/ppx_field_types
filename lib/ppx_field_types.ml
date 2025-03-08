open Ppxlib

let field_types_struct_item ~loc ~path:_ (_rec_flag, type_decls) =
  (* We’ll process only the first type declaration for simplicity *)
  match List.hd type_decls with
  | { ptype_kind = Ptype_record fields; _ } ->
      let field_info =
        List.map
          (fun field ->
            let field_name = field.pld_name.txt in
            let type_name =
              match field.pld_type.ptyp_desc with
              | Ptyp_constr ({ txt = Lident s; _ }, _) -> s
              | _ -> "unknown" (* Handle complex types as needed *)
            in
            (* Create a tuple expression of (field_name, type_name) *)
            Ast_helper.Exp.tuple ~loc [
              Ast_builder.Default.estring ~loc field_name;
              Ast_builder.Default.estring ~loc type_name
            ])
          fields
      in
      let list_expr = Ast_builder.Default.elist ~loc field_info in
      let binding =
        Ast_builder.Default.value_binding ~loc
          ~pat:(Ast_builder.Default.ppat_var ~loc { txt = "field_types"; loc })
          ~expr:list_expr
      in
      [Ast_builder.Default.pstr_value ~loc Nonrecursive [binding]]
  | _ -> failwith "This deriver only works on record types"

let deriver = Deriving.add "field_types"
  ~str_type_decl:(Deriving.Generator.make_noarg field_types_struct_item)

let () = Deriving.ignore (deriver)