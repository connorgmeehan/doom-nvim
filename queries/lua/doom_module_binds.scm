(assignment_statement
  (variable_list
    name: (dot_index_expression field: (identifier))) ; #eq "binds"
  (expression_list
    value: (table_constructor
      (field)*; each regular bind comes first
      (field ; this is the leader field. how can we caputure these?
	value: (table_constructor
	  (field value: (string)) (field name: (identifier) value: (string))
          (field value: (table_constructor
	    [(field)(field
	     (field value: (string)) (field name: (identifier) value: (string))
	     (field value: (table_constructor
	          [(field)(field
	           (field value: (string)) (field name: (identifier) value: (string))
	           (field value: (table_constructor
	                [(field)(field
	                 (field value: (string)) (field name: (identifier) value: (string))
	                 (field value: (table_constructor
			      [(field)(field

	            	  	)
	            	      ]*)))
	                ]*)))
	          ]*)))
           ]*))))
  ))
)

