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
		
		<div id="page" class="content-page">
			<h1>Apresentação e tutorial da RQL</h1><br>
			<p>A Relational Query Language é uma linguagem de consulta a banco de dados relacionais embasada na matemática e livre de uma língua regional como a maioria das suas semelhantes. Ela foi criada por Lucas Venezian Povoa e teve seu compilador/tradutor desenvolvido por Dérick Welman Brock Rangel.</p>
			<p>A seguir serão apresentadas as ~funções abordadas inicialmente pela nova linguagem de modo comparativo com a SQL:</p>
			<ul id="compare-operations">

				<hr>

				<li>
					<h2>Relação</h2>
					<p>Na RQL quando uma query é formada somente pelo nome de uma relação, ela retorna todos os atributos e tuplas da mesma.</p>
					<ul>
						<li class="rql-example">Relation;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation;</li>
					</ul>
				</li>

				<hr>

				<li>
					<h2>Projeção</h2>
					<p>Projeção é a operação que filtra horizontalmente o resultado de uma consulta, ou seja, limita os atributos que serão selectionados na operação.</p>
					<ul>
						<li class="rql-example">¢ idRelation (Relation);</li>
						<li class="rql-example">¢ idRelation, name (Relation);</li>
						<li class="sql-example">SELECT DISTINCT idRelation FROM Relation;</li>
						<li class="sql-example">SELECT DISTINCT idRelation, name FROM Relation;</li>
					</ul>
				</li>

				<hr>

				<li>
					<h2>Seleção</h2>
					<p>Ao contrário da projeção, filtra verticalmente as tuplas, limitando os resultados de acordo com algum critério.</p>
					<ul>
						<li class="rql-example">£ idRelation = 5 (Relation);</li>
						<li class="rql-example">¢ idRelation > 5 ^ idRelation < 10 v idRelation != 8  (Relation);</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation WHERE idRelation = 5;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation WHERE idRelation > 5 AND idRelations < 10 OR idRelation != 8;</li>
					</ul>
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

				<li>
					<h2>Renomeação</h2>
					<p>Renomeia um ou mais atributos de uma relação. O atributo a esquerda sempre representa o nome original, enquanto o da direita corresponde ao novo nome do atributo.</p>
					<ul>
						<li class="rql-example">§ idRelation cod (Relation);</li>
						<li class="rql-example">¢ idRelation cod, name description (Relation);</li>
						<li class="sql-example">SELECT DISTINCT idRelation AS cod FROM Relation;</li>
						<li class="sql-example">SELECT DISTINCT idRelation AS cod, name as description FROM Relation;</li>
					</ul>
					<br>
					<p>A RQL tem um funcionamento um pouco diferente quanto a renomeação. Quando é selecionado e renomeado algo em SQL da forma que está exemplificado acima, são executados duas operaçãos juntas: Projeção e renomeação e então são retornados somente os atributos especificados com suas devidas alterações. Já na RQL é realizada somente a renomeação, que sempre retorna todos os atributos da relação</p>
				</li>

				<hr>

				<li>
					<h2>União</h2>
					<p>Une verticalmente duas relações que possuam a mesma quantidade de atributos e que sejam de tipos compatíveis.</p>
					<ul>
						<li class="rql-example">Relation1 v Relation2;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation1 UNION SELECT DISTINCT * FROM Relation2;</li>
					</ul>
				</li>

				<hr>

				<li>
					<h2>Intersecção</h2>
					<p>Semelhante à união, porém retorna todas as tuplas que sejam iguais entre duas relações.</p>
					<ul>
						<li class="rql-example">Relation1 ^ Relation2;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation1 INTERSECTION SELECT DISTINCT * FROM Relation2;</li>
					</ul>
				</li>

				<hr>

				<li>
					<h2>Diferença</h2>
					<p>Assim com a União e Intersecção, precisa de duas relações compatíveis e retorna todos os elementos da relação à esquerda que não estejam presentes na relação da direita.</p>
					<ul>
						<li class="rql-example">Relation1 - Relation2;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation1 DIFFERENCE SELECT DISTINCT * FROM Relation2;</li>
					</ul>
				</li>

				<hr>

				<li>
					<h2>Junção</h2>
					<p>Une horizontalmente duas relações de acordo com um atributo que tenham em comum. Pode ser realizadode duas formas: Junção ou Junção natural.</p>
					<p>A junção natural tenta identificar atributos com o mesmo nome entre as relações utilizadas, caso encontre mais de uma correspondência, então a operação é ambígua e um erro é lançado</p>
					<p>Já a junção comum requer a especificação de que atributos estão sendo utilizados para a junção, 1 de cada tabela.</p>
					<ul>
						<li class="rql-example">Relation1 [] Relation2; (Junção natural)</li>
						<li class="rql-example">Relation1 [id1 = id2] Relation2;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation1 NATURAL JOIN Relation2;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation1 INNER JOIN Relation2 ON id1 = id2;</li>
					</ul>
				</li>

				<hr>

				<li>
					<h2>Produto cartesiano</h2>
					<p>Faz referência de todas as tuplas da primeira relação com todas as tuplas da segunda relação.</p>
					<ul>
						<li class="rql-example">Relation1 x Relation2;</li>
						<li class="sql-example">SELECT DISTINCT * FROM Relation1 CROSS JOIN Relation2;</li>
					</ul>
				</li>

				<span class="clear" style="height:50px"></span>
				<h1>Operações implementadas</h1>
				<p>As seguintes operaçãos não são originalmente implementadas em SQL.</p>

				<hr>
				
				<li>
					<h2>Fecho transitivo</h2>
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

					<table style="float:left;margin-left:40px;">
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
					<h2>Divisão</h2>
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

					<table style="float:left;margin-left:30px;">
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

					<table style="float:left;margin-left:30px;">
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

			</ul>
		</div>
		<span class="clear" style="height:80px"></span>
		<footer>
			Relational Query Language Translator - 2016<br> Developed by Dérick Welman and Lucas Venezian
		</footer>
	</div>
</div>
</body>
</html>
