<!DOCTYPE html>
<html>
<head>
	<title>RQL 2 SQL</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width"/>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="sources/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="sources/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="sources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="page-wrap">
		<?php
		require_once("header.php");
		?>

		<span class="clear"></span>
		
		<a id="back-to-top" href="#">^</a>
		<div id="page" class="content-page">
			<h1>Apresentação e tutorial da RQL</h1><br>
			<p>A Relational Query Language (POVOA, 2011) é uma linguagem de consulta a banco de dados relacionais embasada na matemática e livre de uma língua regional como a maioria das suas semelhantes. Ela foi criada por Lucas Venezian Povoa e teve seu tradutor (RANGEL, 2016) desenvolvido por Dérick Welman Brock Rangel.</p>
			<h2>Sumário</h2>
			<ul style="list-style:none;font-size:18px;">
				<li><a href="#termos">Termos utilizados</a></li>
				<li><a href="#operacoes">Operações</a>
					<ul style="margin-left:20px;">
						<li><a href="#relacao">Relação</a></li>
						<li><a href="#projecao">Projeção</a></li>
						<li><a href="#selecao">Seleção</a></li>
						<li><a href="#renomeacao">Renomeação</a></li>
						<li><a href="#uniao">União</a></li>
						<li><a href="#interseccao">Intersecção</a></li>
						<li><a href="#diferenca">Diferença</a></li>
						<li><a href="#juncao">Junção</a></li>
						<li><a href="#produto">Produto cartesiano</a></li>
						<li><a href="#fecho">Fecho transitivo</a></li>
						<li><a href="#divisao">Divisão</a></li>
					</ul>
				</li>
			</ul>
			<h1 id="termos">Termos utilizados</h1>
			<p>Para um melhor entendimento do documento a seguir, é importante introduzir alguns termos utilizados no modelo e banco de dados relacional. Um banco de dados relacional é formado por <i><b>relações</b></i> (também chamadas de <i><b>RelVar</i></b> ou <i><b>variável de relação</i></b>) que são conjuntos de <i><b>atributos</b></i> e que por sua vez pertencem a um <i><b>domínio</i></b> (restrição do tipo de dados comportados pelo atributo, como por exemplo, valores numéricos, texto, entre outros).</p>
			<p>RelVars são conhecidas informalmente como tabelas do banco de dados, uma vez que apresentam a estrutura de linhas e colunas. Cada "coluna" de uma RelVar representa um atributo e cada "linha" é chamada de <i><b>tupla</i></b>, i.e., uma instância dessa relação.</p>
			<p>RelVars podem possuir relacionamentos entre si por meio de atributos que identifiquem relações externas, chamados de chaves estrangeiras. Esse relacionamento possui <i><b>cardinalidade</b></i>, que corresponde à quantidade de elementos que podem ser relacionado entre as RelVars. As cardinalidades podem ser representadas da seguinte maneira:</p>
			<ul style="margin-left:20px;">
				<li>(1 : n) ou (n : 1) : A RelVar que se localiza ao lado do 1 pode se relacionar com várias RelVars que se localizam no lado oposto, porém a RelVar que se localiza do lado do n pode se relacionar com somente uma RelVar oposta (1 para muitos).</li>
				<li>(1 : 1) ou (1 : 1) : A RelVar pode se relacionar com somente 1 RelVar que se localiza no lado oposto (1 para 1).</li>
				<li>Para um melhor entendimento veja o exemplo que será mostrado abaixo.</li>
			</ul>
			<p> A seguir serão apresentadas as funções abordadas inicialmente pela nova linguagem de modo comparativo com a SQL, assim como exemplos de seu uso baseados no banco abaixo.</p>
			<div id="example-db">
				<table style="">
					<thead>
						<tr>
							<td colspan="2">Venda</td>
						</tr>
						<tr>
							<td>idVenda</td>
							<td>data</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>11/05/1968</td>
						</tr>
						<tr>
							<td>2</td>
							<td>25/02/2000</td>
						</tr>
						<tr>
							<td>3</td>
							<td>09/09/1999</td>
						</tr>
					</tbody>
				</table>

				<div class="relationship">(1:n)</div>

				<table style="margin-left:20px;">
					<thead>
						<tr>
							<td colspan="3">ItemVenda</td>
						</tr>
						<tr>
							<td>idVenda</td>
							<td>idProduto</td>
							<td>quantidade</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>2</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>3</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>2</td>
							<td>3</td>
							<td>1</td>
						</tr>
						<tr>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>2</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>
				</table>

				<div class="relationship">(n:1)</div>

				<table style="margin-left:20px;">
					<thead>
						<tr>
							<td colspan="3">Produto</td>
						</tr>
						<tr>
							<td>idProduto</td>
							<td>nome</td>
							<td>valor</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>Teclado</td>
							<td>25,00</td>
						</tr>
						<tr>
							<td>2</td>
							<td>Mouse</td>
							<td>10,00</td>
						</tr>
						<tr>
							<td>3</td>
							<td>Monitor</td>
							<td>300,00</td>
						</tr>
						<tr>
							<td>4</td>
							<td>Fone</td>
							<td>8,50</td>
						</tr>
					</tbody>
				</table>
			</div>
			<span class="clear"></span>
			<p style="margin-top:20px;">Nesse caso uma Venda pode se relacionar com vários ItemVenda, mas um ItemVenda pode pertencer a somente uma Venda. O mesmo acontece com o produto com relação ao ItemVenda.</p>
			<h1 id="operacoes">Operações</h1>

			<ul id="compare-operations">

				<hr>

				<!---------------------------------- RELAÇÃO ---------------------------------->
				<li>
					<h2 id="relacao">Relação</h2>
					<p>Na RQL quando uma consulta é formada somente pelo nome de uma RelVar, ela retorna todos os atributos e tuplas da mesma.</p>
					<p>Exemplo: Serão selecionados todos os dados da RelVar Venda.</p>
					<ul>
						<li class="rql-example">Venda;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Venda;</li>
					</ul>
					<table style="margin:0 auto;">
						<thead>
							<tr>
								<td colspan="2">Resultado</td>
							</tr>
							<tr>
								<td>idVenda</td>
								<td>data</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>11/05/1968</td>
							</tr>
							<tr>
								<td>2</td>
								<td>25/02/2000</td>
							</tr>
							<tr>
								<td>3</td>
								<td>09/09/1999</td>
							</tr>
						</tbody>
					</table>
					<span class="clear"></span>
				</li>

				<hr>

				<!---------------------------------- PROJEÇÃO ---------------------------------->
				<li>
					<h2 id="projecao">Projeção <span class="orange">¢</span></h2>
					<p>Operação que filtra horizontalmente o resultado de uma consulta, i.e., limita os atributos que serão selectionados na operação.</p>
					<p>Exemplo 1: Será selecionado somente o atributo idProduto da RelVar Produto.</p>
					<p>Exemplo 2: Serão selecionados os atributos idProduto e nome da RelVar Produto.</p>
					<ul>
						<li class="rql-example">¢ idProduto (Produto);<br>
						¢ idProduto, nome (Produto);</li>
						<li class="sql-example">SELECT DISTINCT idProduto FROM Produto;<br>
							SELECT DISTINCT idProduto, nome FROM Produto;</li>
					</ul>

					<table style="">
						<thead>
							<tr>
								<td colspan="3">Resultado 1</td>
							</tr>
							<tr>
								<td>idProduto</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
							</tr>
							<tr>
								<td>2</td>
							</tr>
							<tr>
								<td>3</td>
							</tr>
							<tr>
								<td>4</td>
							</tr>
						</tbody>
					</table>

					<table style="margin-left:40px;">
						<thead>
							<tr>
								<td colspan="3">Resultado 2</td>
							</tr>
							<tr>
								<td>idProduto</td>
								<td>nome</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Teclado</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Mouse</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Monitor</td>
							</tr>
							<tr>
								<td>4</td>
								<td>Fone</td>
							</tr>
						</tbody>
					</table>
					<span class="clear"></span>

					</li>

					<hr>

					<!---------------------------------- SELEÇÃO ---------------------------------->
					<li>
						<h2 id="selecao">Seleção <span class="orange">£</span></h2>
						<p>Operação que filtra verticalmente as tuplas, limitando os resultados de acordo com algum critério.</p>
						<p>Exemplo 1: Serão selecionados somente as tuplas da RelVar Produto em que o nome seja igual a "Mouse".</p>
						<p>Exemplo 1: Serão selecionados somente as tuplas da RelVar Produto em que o valor seja maior que 9 e menor que 50.</p>
						<ul>
							<li class="rql-example">£ nome = "Mouse" (Produto);<br>
								£ valor > 9 ^ valor < 50 (Produto);</li>
							<li class="sql-example">SELECT DISTINCT * FROM Produto WHERE nome = 'Mouse';<br>
								SELECT DISTINCT * FROM Produto WHERE valor > 9 AND valor < 50;</li>
						</ul>
						<table style="">
							<thead>
								<tr>
									<td colspan="3">Resultado 1</td>
								</tr>
								<tr>
									<td>idProduto</td>
									<td>nome</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
							</tbody>
						</table>

						<table style="margin-left:40px;">
							<thead>
								<tr>
									<td colspan="3">Resultado 2</td>
								</tr>
								<tr>
									<td>idProduto</td>
									<td>nome</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Teclado</td>
									<td>25,00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
							</tbody>
						</table>
						<span class="clear"></span>
						<br>
						<p>A seguir estão listados os operadores lógicos das linguagens:</p>
						<table>
							<tbody>
								<tr>
									<td><b>RQL</b></td>
									<td>^</td>
									<td>v</td>
									<td>_v_</td>
									<td>¬</td>
								</tr>		

								<tr>
									<td><b>SQL</b></td>
									<td>AND</td>
									<td>OR</td>
									<td>XOR</td>
									<td>NOT</td>
								</tr>							
							</tbody>
						</table>
					</li>

					<hr>

					<!---------------------------------- RENOMEAÇÃO ---------------------------------->
					<li>
						<h2 id="renomeacao">Renomeação <span class="orange">§</span></h2>
						<p>Renomeia um ou mais atributos de uma relação. O atributo a esquerda sempre representa o nome original, enquanto o da direita corresponde ao novo nome do atributo.</p>
						<p>Exemplo 1: Retorna os atributos da RelVar Produto com a alteração do idProduto para "codProduto".</p>
						<p>Exemplo 1: Retorna os atributos da RelVar Produto com a alteração do idProduto para "codProduto" e do nome para "marca".</p>
						<ul>
							<li class="rql-example">§ idProduto codProduto (Produto);<br>
							§ idProduto codProduto, nome marca (Produto);</li>
							<li class="sql-example">SELECT DISTINCT idProduto AS codProduto, nome, valor FROM Produto;<br>
							SELECT DISTINCT idProduto AS codProduto, nome AS marca, valor FROM Produto;</li>
						</ul>
						<table style="">
							<thead>
								<tr>
									<td colspan="3">Resultado 1</td>
								</tr>
								<tr>
									<td>codProduto</td>
									<td>nome</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Teclado</td>
									<td>25,00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Monitor</td>
									<td>300,00</td>
								</tr>
								<tr>
									<td>4</td>
									<td>Fone</td>
									<td>8,50</td>
								</tr>
							</tbody>
						</table>

						<table style="margin-left:40px;">
							<thead>
								<tr>
									<td colspan="3">Resultado 2</td>
								</tr>
								<tr>
									<td>codProduto</td>
									<td>marca</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Teclado</td>
									<td>25,00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Monitor</td>
									<td>300,00</td>
								</tr>
								<tr>
									<td>4</td>
									<td>Fone</td>
									<td>8,50</td>
								</tr>
							</tbody>
						</table>
						<span class="clear"></span>
						<br>
						<p>A RQL tem um funcionamento um pouco diferente quanto a renomeação em relação à SQL. Quando é selecionado e renomeado algo em SQL da forma que está exemplificado acima, são executados duas operaçãos juntas: Projeção e renomeação e então são retornados somente os atributos especificados com suas devidas alterações. Já na RQL é realizada somente a renomeação, que sempre retorna todos os atributos da relação</p>
					</li>

					<p>Para as três seguintes operações, considere o esquema a seguir.</p>
					<div id="example-db">
						<table>
							<thead>
								<tr>
									<td colspan="2">Tabela1</td>
								</tr>
								<tr>
									<td>idTabela</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>4</td>
								</tr>
								<tr>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>3</td>
									<td>6</td>
								</tr>
							</tbody>
						</table>

						<table style="margin-left:40px;">
							<thead>
								<tr>
									<td colspan="2">Tabela2</td>
								</tr>
								<tr>
									<td>idTabela</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>4</td>
								</tr>
								<tr>
									<td>2</td>
									<td>6</td>
								</tr>
								<tr>
									<td>3</td>
									<td>7</td>
								</tr>
							</tbody>
						</table>
					</div>

					<hr>

					<!---------------------------------- União ---------------------------------->
					<li>
						<h2 id="uniao">União <span class="orange">v</span></h2>
						<p>Une verticalmente duas relações que possuam a mesma quantidade de atributos e que sejam de tipos compatíveis.</p>
						<p>Exemplo: Selecionar todas as tuplas das tabelas 1 e 2.</p>
						<ul>
							<li class="rql-example">Tabela1 v Tabela2;</li>
							<li class="sql-example">SELECT DISTINCT * FROM Tabela1 UNION SELECT DISTINCT * FROM Tabela2;</li>
						</ul>
						<table>
							<thead>
								<tr>
									<td colspan="2">Resultado</td>
								</tr>
								<tr>
									<td>idTabela</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>4</td>
								</tr>
								<tr>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>3</td>
									<td>6</td>
								</tr>
									<td>2</td>
									<td>6</td>
								</tr>
								<tr>
									<td>3</td>
									<td>7</td>
								</tr>
							</tbody>
						</table>
					</li>

					<hr>

					<!---------------------------------- Intersecção ---------------------------------->
					<li>
						<h2 id="interseccao">Intersecção <span class="orange">^</span></h2>
						<p>Semelhante à união, porém retorna todas as tuplas que sejam iguais entre duas relações.</p>
						<p>Exemplo: Selecionar somente as tuplas que sejam iguais entre as duas tabelas.</p>
						<ul>
							<li class="rql-example">Tabela1 ^ Tabela2;</li>
							<li class="sql-example">SELECT DISTINCT * FROM Tabela1 INTERSECTION SELECT DISTINCT * FROM Tabela2;</li>
						</ul>
						<table>
							<thead>
								<tr>
									<td colspan="2">Resultado</td>
								</tr>
								<tr>
									<td>idTabela</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>4</td>
								</tr>
							</tbody>
						</table>
					</li>
					</li>

					<hr>

					<!---------------------------------- Diferença ---------------------------------->
					<li>
						<h2 id="diferenca">Diferença <span class="orange">-</span></h2>
						<p>Assim com a União e Intersecção, precisa de duas relações compatíveis e retorna todos os elementos da relação à esquerda que não estejam presentes na relação da direita.</p>
						<p>Exemplo: Retornar todas as tuplas que existam na Tabela1 e que não existam na Tabela2.</p>
						<ul>
							<li class="rql-example">Tabela1 - Tabela2;</li>
							<li class="sql-example">SELECT DISTINCT * FROM Tabela1 DIFFERENCE SELECT DISTINCT * FROM Tabela2;</li>
						</ul>
						<table>
							<thead>
								<tr>
									<td colspan="2">Resultado</td>
								</tr>
								<tr>
									<td>idTabela</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2</td>
									<td>5</td>
								</tr>
								<tr>
									<td>3</td>
									<td>6</td>
								</tr>
							</tbody>
						</table>
					</li>
					</li>

					<hr>

					<!---------------------------------- JUNÇÃO ---------------------------------->
					<li>
						<h2 id="juncao">Junção <span class="orange">[]</span></h2>
						<p>Une horizontalmente duas relações de acordo com um atributo que tenham em comum. Pode ser realizadode duas formas: Junção ou Junção natural.</p>
						<p>A junção natural tenta identificar atributos com o mesmo nome entre as relações utilizadas, caso encontre mais de uma correspondência, então a operação é ambígua e um erro é lançado</p>
						<p>Já a junção comum requer a especificação de que atributos estão sendo utilizados para a junção, 1 de cada tabela.</p>
						<p>Exemplo 1: Operação de junção natural que retorna as Vendas, assim como os itens de venda relacionados à ela.</p>
						<p>Exemplo 1: Operação de junção com critério que retorna as Vendas que possuem seu ID igual ao de um Produto.</p>
						<ul>
							<li class="rql-example">Venda [] ItemVenda;<br>
							Venda [idVenda = idProduto] Produto;</li>
							<li class="sql-example">SELECT DISTINCT * FROM Venda NATURAL JOIN ItemVenda;<br>
							SELECT DISTINCT * FROM Venda INNER JOIN Produto ON Venda.idVenda = Produto.idProduto;</li>
						</ul>
						<table style="">
							<thead>
								<tr>
									<td colspan="4">Resultado 1</td>
								</tr>
								<tr>
									<td>data</td>
									<td>idVenda</td>
									<td>idProduto</td>
									<td>quantidade</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>11/05/1968</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>25/02/2000</td>
									<td>2</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>09/09/1999</td>
									<td>3</td>
									<td>1</td>
									<td>1</td>
								</tr>
								<tr>
									<td>25/02/2000</td>
									<td>2</td>
									<td>3</td>
									<td>1</td>
								</tr>
								<tr>
									<td>09/09/1999</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
								<tr>
									<td>11/05/1968</td>
									<td>1</td>
									<td>2</td>
									<td>2</td>
								</tr>
								<tr>
									<td>11/05/1968</td>
									<td>1</td>
									<td>1</td>
									<td>1</td>
								</tr>
							</tbody>
						</table>

						<table style="margin-left:40px;">
							<thead>
								<tr>
									<td colspan="4">Resultado 2</td>
								</tr>
								<tr>
									<td>idVenda</td>
									<td>data</td>
									<td>nome</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>11/05/1968</td>
									<td>Teclado</td>
									<td>25,00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>25/02/2000</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
								<tr>
									<td>3</td>
									<td>09/09/1999</td>
									<td>Monitor</td>
									<td>300,00</td>
								</tr>
							</tbody>
						</table>
						<span class="clear" style="margin-bottom:10px;"></span>
						<p>É importante ressaltar que no caso de uma junção por critério, o nome resultante do atributo é igual ao nome do atributo escrito à esquerda, que nesse caso é o idVenda</p>
					</li>

					<hr>

					<!---------------------------------- PRODUTO CARTESIANO ---------------------------------->
					<li>
						<h2 id="produto">Produto cartesiano <span class="orange">x</span></h2>
						<p>Faz referência de todas as tuplas da primeira relação com todas as tuplas da segunda relação.</p>
						<p>Exemplo: Retornar todas as vendas relacionadas com todos os produtos</p>
						<ul>
							<li class="rql-example">Venda x Produto;</li>
							<li class="sql-example">SELECT DISTINCT * FROM Venda CROSS JOIN Produto;</li>
						</ul>
						<table style="">
							<thead>
								<tr>
									<td colspan="5">Resultado</td>
								</tr>
								<tr>
									<td>idVenda</td>
									<td>data</td>
									<td>idProduto</td>
									<td>nome</td>
									<td>valor</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>11/05/1968</td>
									<td>1</td>
									<td>Teclado</td>
									<td>25,00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>25/02/2000</td>
									<td>1</td>
									<td>Teclado</td>
									<td>25,00</td>
								</tr>
								<tr>
									<td>3</td>
									<td>09/09/1999</td>
									<td>1</td>
									<td>Teclado</td>
									<td>25,00</td>
								</tr>
								<tr>
									<td>1</td>
									<td>11/05/1968</td>
									<td>2</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>25/02/2000</td>
									<td>2</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
								<tr>
									<td>3</td>
									<td>09/09/1999</td>
									<td>2</td>
									<td>Mouse</td>
									<td>10,00</td>
								</tr>
								<tr>
									<td>1</td>
									<td>11/05/1968</td>
									<td>3</td>
									<td>Monitor</td>
									<td>300,00</td>
								</tr>
								<tr>
									<td>2</td>
									<td>25/02/2000</td>
									<td>3</td>
									<td>Monitor</td>
									<td>300,00</td>
								</tr>
								<tr>
									<td>3</td>
									<td>09/09/1999</td>
									<td>3</td>
									<td>Monitor</td>
									<td>300,00</td>
								</tr>
								<tr>
									<td>1</td>
									<td>11/05/1968</td>
									<td>4</td>
									<td>Fone</td>
									<td>8,50</td>
								</tr>
								<tr>
									<td>2</td>
									<td>25/02/2000</td>
									<td>4</td>
									<td>Fone</td>
									<td>8,50</td>
								</tr>
								<tr>
									<td>3</td>
									<td>09/09/1999</td>
									<td>4</td>
									<td>Fone</td>
									<td>8,50</td>
								</tr>
							</tbody>
						</table>
					</li>

					<span class="clear" style="height:50px"></span>
					<h1>Operações implementadas</h1>
					<p>As seguintes operaçãos não são originalmente implementadas em SQL.</p>

					<hr>

					<li>
						<h2 id="fecho">Fecho transitivo <span class="orange">&lt;&lt;&gt;&gt;</span></h2>
						<p>
						De acordo com a regra da trasitividade:<br>
						A->B<br>
						B->C<br>
						logo:<br>A->C<br>
						Esta operação encontra as transitividades contidas dentro de uma relação, que deve ser binária e com seus dois atributos de mesmo tipo. O exemplo a seguir demonstra a proriedade de transitividade assim como o resultado da operação.
						</p>

						<table style="float:left">
							<thead>
								<tr>
									<td colspan="2"><b>Ordem</b></td>
								</tr>
								<tr>
									<td>anterior</td>
									<td>posterior</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>2</td>
								</tr>

								<tr>
									<td>2</td>
									<td>3</td>
								</tr>

								<tr>
									<td>4</td>
									<td>5</td>
								</tr
							</tbody>
						</table>

						<table style="margin-left:40px;">
							<thead>
							<tr>
							<td colspan="2"><b>Resultado</b></td>
							</tr>
							<tr>
							<td>anterior</td>
							<td>posterior</td>
							</tr>
							</thead>
							<tbody>
							<tr>
							<td>1</td>
							<td>2</td>
							</tr>

							<tr>
							<td>2</td>
							<td>3</td>
							</tr>

							<tr style="color:red">
							<td><b>1</b></td>
							<td><b>3</b></td>
							</tr>

							<tr>
							<td>4</td>
							<td>5</td>
							</tr
							</tbody>
						</table>
						<span class="clear" />

						<br>
						<p>No exemplo acima existe uma relação "Ordem" que possui dois atributos: <i>anterior</i> e <i>posterior</i>. É possível concluir que se 1 é anterior a 2 e 2 é anterior a 3, logo 1 é anterior a 3. Esse valor é adicionado à relação original e então é obtido o resultado da operação</p>
						<ul>
							<li class="rql-example">&lt;&lt;Ordem&gt;&gt;;</li>
							<li class="sql-example">SELECT DISTINCT * FROM Ordem<br>
							<span class="tab"/>UNION<br>
							<span class="tab"/>SELECT ordem1.anterior, ordem2.posterior FROM Ordem AS ordem1<br>
							<span class="tab"/>INNER JOIN<br>
							<span class="tab"/>Ordem AS ordem2 ON ordem1.posterior = ordem2.anterior WHERE ordem2.posterior != "";</li>
						</ul>
					</li>
					
					<hr>
					
					<li>
						<h2 id="divisao">Divisão <span class="orange">/</span></h2>
						<p>Esta operação possui um divisor e um dividendo que deve ser um subconjunto do divisor. Seu retorno são as tuplas do dividendo que se relacionam com todas as tuplas do divisor. Para entender melhor essa operação veja as relações <i>Venda</i> e <i>Produto</i>.</p>
						<table style="float:left">
							<thead>
							<tr>
								<td colspan="2"><b>Venda</b></td>
							</tr>
							<tr>
								<td>idVenda</td>
								<td>idProduto</td>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td>1</td>
								<td>1</td>
							</tr>
							
							<tr>
								<td>1</td>
								<td>2</td>
							</tr>

							<tr>
								<td>1</td>
								<td>3</td>
							</tr>

							<tr>
								<td>3</td>
								<td>1</td>
							</tr>
							</tbody>
						</table>

						<table style="margin-left:30px;">
							<thead>
								<tr>
									<td><b>Produto</b></td>
								</tr>
								<tr>
									<td>idProduto</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
								</tr>

								<tr>
									<td>2</td>
								</tr>

								<tr>
									<td>3</td>
								</tr>
							</tbody>
						</table>

						<table style="margin-left:30px;">
							<thead>
								<tr>
									<td><b>Resultado</b></td>
								</tr>
								<tr>
									<td>idProduto</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
								</tr>
							</tbody>
						</table>
						<span class="clear"></span>
						<br>
						<p>Nesse caso o produto 1 está relacionado com todas as vendas (1 e 3) e por isso será o resultado da operação</p>
						<ul>
							<li class="rql-example">Venda / Produto;</li>
							<li class="sql-example">
								SELECT DISTINCT idProduto<br>
								<span class="tab"/>FROM Venda<br>
								<span class="tab"/>WHERE (<br>
								<span class="tab"/>	SELECT COUNT(DISTINCT idVenda)<br>
								<span class="tab"/>	FROM Venda) = <br>
								<span class="tab"/> (SELECT count(*)<br>
								<span class="tab"/>	FROM Venda AS a<br>
								<span class="tab"/>	WHERE a.idProduto = Venda.idProduto)
							</li>
						</ul>
					</li>

					<hr>

					</ul>
						<h1>Referências</h1>
						<p>POVOA, Lucas Venezian. <b>RELATIONAL QUERY LANGUAGE:</b> Uma Proposta de Linguagem Puramente Relacional. 2011. Curso de Análise de Sistemas e Tecnologias da Informação, Faculdade de Tecnologia de Ourinhos, Ourinhos, 2011.</p>
						<p>RANGEL, Dérick Welman Brock. <b>TRADUÇÃO ENTRE SQL E RQL:</b> Uma linguagem de consulta puramente relacional. 2016. Curso de Análise e Desenvolvimento de Sistemas, Instituto Federal de Educação, Ciência e Tecnologia de São Paulo, Caraguatatuba, 2016.</p>
					</div>
					
					<span class="clear" style="height:80px"></span>
					
				<footer>
					Relational Query Language Translator - 2016<br> Developed by Dérick Welman and Lucas Venezian
				</footer>
			</div>
		</div>
	</body>
</html>
