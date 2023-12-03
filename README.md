# Ber-Language
Luciano

	<program>		::= DISAS <var-decls> <statements> .leo

	<var-decls>		::= <var-decl> |
					<var-decl> <var-decls>

	<var-decl>		::= <type> REGISTER ;

				
	<type> 			::= long | int | hex | bin | ;

	<statements>		::= <open_statement> |
					<open_statement> <statements>

	<statement>		::= <atrib> |
					<if-else>

	<atrib>			::= REGISTER = <expression> ;

	<expression>		::= REGISTER |
					number |
					addw <expression>, <expression> |
					subw <expression>, <expression> |
					mul <expression>, <expression> |
					div <expression>, <expression> |
					( <expression> )





	<open_statement>	::= <atrib> |
				se-o-ber ( <expression> <comp> <expression> ){ <open_statement> } |
				se-o-ber ( <expression> <comp> <expression> ){ <closed_statement> } senao-o-ber { <open_statement> }



	<closed_statement>	::= <atrib> |
				se-o-ber ( <expression> <comp> <expression> ){ <closed_statement> } senao-o-ber { <closed_statement> }



					== |  != |   <   |   >  |     <=    |    >=
	<comp>			::= leo | ber | lucca | enzo | lucca-leo | enzo-leo

