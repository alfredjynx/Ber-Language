# Ber-Language: Implementação de Linguagem de Programação Baixo Nível

## Autores
- [João Alfredo Cardoso Lamy](https://github.com/alfredjynx)
- [Thomas Chiari Ciocchetti de Souza](https://github.com/thomaschiari)

## Introdução

A Ber-Language é uma linguagem de programação desenhada com foco no ensino e manipulação de conceitos relacionados a bits e conversões numéricas. Ela oferece uma sintaxe intuitiva, inspirada em C, para facilitar a aprendizagem e a aplicação de conceitos computacionais, especialmente tipos numéricos de bases não decimais (como hexadecimais e binários). Tomamos a liberdade de utilizar alguns conceitos de baixo nível, além de alguns comandos inspirados no ambiente de sala de aula, para gerarmos os nomes dos comandos da linguagem. Ao final da execução de um programa Ber, é gerado o código intermediário do que foi interpretado. Você pode visualizar a estrutura da linguagem em [ber-language.ipynb](notebooks/ber-language.ipynb), e pode testar a linguagem com seus próprios programas em [ber-language.ipynb](notebooks/ber-test.ipynb).

## Estrutura do Programa

### Programa

Todo programa Ber é composto por uma série de declarações de variáveis, seguidas por uma série de comandos. Todo programa começa com a palavra-chave `disas` e termina com a palavra-chave `.leo`. A estrutura de um programa Ber é a seguinte:

```
disas
	<var-decls>
	<statements>
.leo
```

### Declaração de Variáveis

As declarações de variáveis são feitas listando-se cada variável com seu tipo e identificador. Cada identificador é considerado um registrador, sendo chamado de `REGISTER` na sintaxe do programa. Também é possível inicializar variáveis com funções lambda. Os tipos disponíveis na linguagem são `int`, `hex` e `bin`, seguindo a lógica de utilização de conceitos de números não decimais. A estrutura da declaração de variáveis é a seguinte:

```
<var-decls> ::= <var-decl> | <var-decl> <var-decls>

<var-decl> ::= <type> REGISTER | 
			   <type> REGISTER = LAMBDA REGISTER DOT <expression> ;
```

A declaração de uma função lambda segue o seguinte exemplo, atribuindo o valor 0x0F ao registrador `R1`:

```
hex R1 = LAMBDA R1 . 0x0F ;
```

### Comandos

Os comandos disponíveis na linguagem são atribuições e comandos condicionais. Atribuições são feitas utilizando o operador `=`. Comandos condicionais são feitos utilizando a palavra-chave `se-o-ber` seguida de uma expressão booleana entre parênteses, seguida de um bloco de comandos. É possível utilizar a palavra-chave `senao-o-ber` para definir um bloco de comandos a ser executado caso a expressão booleana seja falsa. A estrutura dos comandos é a seguinte:

```
<statements> ::= <open_statement> | <open_statement> <statements>

<statement> ::= <atrib> | <if-else>

<atrib> ::= REGISTER = <expression> ;

<open_statement> ::= <atrib> | 
					se-o-ber ( <expression> <comp> <expression> ){ <open_statement> } | 
					se-o-ber ( <expression> <comp> <expression> ){ <closed_statement> } senao-o-ber { <open_statement> }

<closed_statement> ::= <atrib> |
					se-o-ber ( <expression> <comp> <expression> ){ <closed_statement> } senao-o-ber { <closed_statement> }
```

Também é possível utilizar estruturas de repetição utilizando a palavra-chave `enquanto-o-ber`. A estrutura de um comando de repetição é a seguinte:

```
enquanto-o-ber ( <expression> <comp> <expression> ){ <open_statement> }
```

### Expressões

As expressões disponíveis na linguagem são registradores, números e operações aritméticas. Os registradores são identificados pela palavra-chave `REGISTER`. Os números podem ser decimais, hexadecimais ou binários, dependendo do tipo da variável. A estrutura das expressões é a seguinte:

```
<expression> ::= REGISTER |
				number |
				<expression> + <expression> |
				<expression> - <expression> |
				<expression> * <expression> |
				<expression> / <expression> |
				( <expression> )
```

Para a realização de expressões, utilizamos os operadores aritméticos padrão: `+`, `-`, `*` e `/`.


### Operadores

Os operadores disponíveis na linguagem são os operadores de comparação `leo`, `ber`, `lucca`, `enzo`, `lucca-leo` e `enzo-leo`. Eles representam, respectivamente, os operadores `=`, `!=`, `<`, `>`, `<=` e `>=`. A estrutura dos operadores é a seguinte:

```
<comp> ::= leo | ber | lucca | enzo | lucca-leo | enzo-leo
```

## Gramática Completa

A seguir, temos a estrutura completa da gramática da linguagem Ber:

```
	<program>			::= DISAS <var-decls> <statements> .leo

	<var-decls>			::= <var-decl> |
						<var-decl> <var-decls>

	<var-decl>			::= <type> REGISTER |
						<type> REGISTER = LAMBDA REGISTER DOT <expression> ;

				
	<type> 				::= int | hex | bin | ;

	<statements>		::= <open_statement> |
						<open_statement> <statements>

	<statement>			::= <atrib> |
						<if-else>

	<atrib>				::= REGISTER = <expression> ;

	<expression>		::= REGISTER |
						number |
						<expression> + <expression> |
						<expression> - <expression> |
						<expression> * <expression> |
						<expression> / <expression> |
						( <expression> )

	<open_statement>	::= <atrib> |
						se-o-ber ( <expression> <comp> <expression> ){ <open_statement> } |
						se-o-ber ( <expression> <comp> <expression> ){ <closed_statement> } senao-o-ber { <open_statement> } |
						enquanto-o-ber ( <expression> <comp> <expression> ){ <open_statement> }

	<closed_statement>	::= <atrib> |
						se-o-ber ( <expression> <comp> <expression> ){ <closed_statement> } senao-o-ber { <closed_statement> } |
						enquanto-o-ber ( <expression> <comp> <expression> ){ <closed_statement> }

	<comp>			::= leo | ber | lucca | enzo | lucca-leo | enzo-leo
``` 

## Exemplos de Programas:

A seguir, vamos apresentar alguns programas de exemplo para a linguagem Ber.

### Exemplo 1

```
disas
    bin REGISTER1;

    REGISTER1 = 0b101010;
.leo
```

### Exemplo 2

```
disas
    int REGISTER1;
    bin REGISTER2;
    hex REGISTER3;

    se-o-ber (REGISTER1 leo 10) {
        REGISTER1 = 20;
    } senao-o-ber {
        REGISTER2 = 0b101010;
    }
    
    enquanto-o-ber (REGISTER2 lucca 0b111111) {
        REGISTER2 = REGISTER2 + 0b1;
    }

    REGISTER3 = 0x1af;
    
.leo
```

### Exemplo 3

```
disas

    int R;

    int REGISTER4 = lambda x. x+1;

    R = REGISTER4(3);
    
.leo
```
