(lang dune 3.17)

(name ppx_field_types)

(generate_opam_files true)

(source
 (github raulikeda/ppx_field_types))

(authors "Raul Ikeda <author@example.com>")

(maintainers "Raul Ikeda <maintainer@example.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name ppx_field_types)
 (synopsis "Extract the field types of a record type in a string list")
 (description "If you ever needed the string list of the types of the fields of a record type and you didn't want to write it by hand, this ppx deriver is for you.

  This ppx deriver generates a list of tuples with the field name and the type name of a record type. For example, given the following record type:
  
  ``` ocaml
  type t = { x : int; y : string } [@@deriving field_types]
  ```   

  The generated code would be:
  
  ``` ocaml
  let field_types = [ ('x', 'int'); ('y', 'string') ]
  ```

  This project benefited from assistance provided by Grok, an AI developed by xAI. Grok helped with code suggestions and debugging. For more information about Grok, visit [xAI's website](https://xai.ai).
 ")
 
 (depends ocaml)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
