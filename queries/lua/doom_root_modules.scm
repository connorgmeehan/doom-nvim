(return_statement
  (expression_list
    (table_constructor
      (field name: (identifier) @module-categories
             value:
	 (table_constructor
		       (comment) @module-disabled ; @module-disabled: match comment to `-- "string",`
			(field) @module-enabled
         )
      )
    )
  )
)
