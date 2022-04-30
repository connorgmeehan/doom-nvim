(field
  value: (table_constructor
    (field
      value: (string) @branch.char_field) ; "D"
    (field
      name: (identifier) @branch.name_key ; "name"
      value: (string) @branch.name_value ; "+Doom"
    (field
      value: (table_constructor) @branch.maps_table) ; { ... }
))
