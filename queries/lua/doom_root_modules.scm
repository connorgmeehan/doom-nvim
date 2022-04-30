(return_statement
  (expression_list
    (table_constructor
      (field name: (identifier) @modules.category
        value: (table_constructor [
		(comment) @modules.disabled ; (#lua-match? @modules.disabled "%-%-%s\"[%w%-_]+\",")
		(field) @modules.enabled
]
 	))
  )
)
)

; (return_statement
;   (expression_list
;     (table_constructor
;       (field name: (identifier)
;         value: (table_constructor
;
;  	))
;   )
; )
; )
