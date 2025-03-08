# ppx_field_types

If you ever needed the string list of the types of the fields of a record type and you didn't want to write it by hand, this ppx deriver is for you.

This ppx deriver generates a list of tuples with the field name and the type name of a record type. For example, given the following record type:
  
  ``` ocaml
  type t = { x : int; y : string } [@@deriving field_types]
  ```   

The generated code would be:
  
  ``` ocaml
  let field_types = [ ('x', 'int'); ('y', 'string') ]
  ```

This project benefited from assistance provided by Grok, an AI developed by xAI. Grok helped with code suggestions and debugging. For more information about Grok, visit [xAI's website](https://xai.ai).
