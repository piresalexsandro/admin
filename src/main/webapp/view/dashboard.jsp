<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="data" class="java.util.Date" />
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>MESSER BRASIL</title>
<link rel="stylesheet" href="${path}/css/jquery.dataTables.min.css" />
<style type="text/css">
body {
				background:none !important;
				background-size: cover;
				align-items: center;
}
table td {
	text-align: left !important;
}
</style>
<script type="text/javascript" src="${path}/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		oTable = $('#registros').dataTable({
			"bPaginate": true,
			"bJQueryUI": false,
			"sPaginationType": "full_numbers"
		});
	});
</script>
<script type="text/javascript">
		hideLoading();
</script>
<script src="${path}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${path}/js/loader.js"></script>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      
      var usuarios = ${usuarios};
      var perfis = ${roles};
      var grupos = ${grupos};
      var servicos = ${servicos};
      var clientes = ${clientes};
      var solicitacoes = ${solicitacoes};
      
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Dados do Sistema', 'Qtd'],
          ['Usuários',     usuarios],
          ['Grupos', grupos],
          ['Perfis', perfis],
          ['Serviços',     servicos],
          ['Clientes',  clientes]
        ]);

        var options = {
          'is3D':false,
          'width':650,
          'height':240,
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
</script>
<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Solicitações", { role: "style" } ],
        ["Aprovadas", 12, "#6959CD"],
        ["Reprovadas", 9, "#DAA520"],
        ["Em Aberto", 18, "#C0C0C0"],	
        ["Em Execução", 28, "#004FA3"],
        ["Pendentes", 17, "#e3312a"],
        ["Redirecionadas", 19, "#FF8C00"],
        ["Finalizadas", 30, "color: #006400"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        width: 650,
        height: 240,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
</script>
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Solicitações'],
          ['Pendentes',      12],
          ['Redirecionadas',  20],
          ['Reprovadas',    7]
        ]);

        var options = {
          is3D: true,
          'width':650,
          'height':240,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
</script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Grupo');
        data.addColumn('number', 'Qtd. Solicitações em atraso');
        //data.addColumn('boolean', 'Status'); , true ,  false
        data.addRows([
          ['EXECUTORES C2C MESSER-BR',  {f: '14'}],
          ['COMERCIAL MESSER-BR', {f: '12'}],
          ['ESCRITÓRIO DE ADVOCACIA',   {f: '21'}],
          ['GERENTE DE COBRANÇA E CRÉDITO', {f: '5'}],
          ['GERENTE COMERCIAL HEAD COMERCIAL CFO', {f: '10'}],
          ['JURÍDICO INTERNO',   {f: '7'}]
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
      }
    </script>
</head>
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
<br/><br/><br/>
<div class="tab-content">
<div class="col-lg-12" style="align:center; width:100%">
<table border="1">
	<tbody>
		<tr>
			<td>
				<div class="col-lg-12" style="height: 350px; width: 100%">
				   <div class="panel panel-default">
						<div class="panel-heading">
							<strong><span class="glyphicon glyphicon-cog"></span> Cadastros realizados no Sistema 
							</strong>
						</div>
						<div id="chart_div" class="panel-body"></div>
					</div>
				</div>
			</td>
			<td>
				<div class="col-lg-12" style="height: 350px; width: 100%">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong><span class="glyphicon glyphicon-stats"></span> Quantidade de Solicitações realizadas no Mês de ${nomeMesAtual} de <fmt:formatDate value="${data}" type="both" pattern="yyyy" dateStyle="full"/>
							</strong>
						</div>
						<div id="columnchart_values" class="panel-body"></div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="col-lg-12" style="height: 350px; width: 100%">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong><span class="glyphicon glyphicon-stats"></span> Solicitações atrasadas por Status no Mês de ${nomeMesAtual} de <fmt:formatDate value="${data}" type="both" pattern="yyyy" dateStyle="full"/>
							</strong>
						</div>
						<div id="piechart_3d" class="panel-body"></div>
					</div>
				</div>
			</td>
			<td>
				<div class="col-lg-12" style="height: 350px; width: 100%">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong><span class="glyphicon glyphicon-stats"></span> Quantidade de Solicitações atrasadas por Grupo Mês de ${nomeMesAtual} de <fmt:formatDate value="${data}" type="both" pattern="yyyy" dateStyle="full"/>
							</strong>
						</div>
						<br/><br/>
						<div id="table_div" class="panel-body"></div>
					</div>
				</div>
			</td>
		</tr>
	</tbody>
</table>
</div>
</div>
</sec:authorize>
<sec:authorize access="hasAnyRole('ROLE_EXECUTOR')">
<div>
		<div class="panel panel-default">
				<div class="panel-heading">
						<strong>
							<font color="red"><span class="glyphicon glyphicon-list-alt"></span> Minhas Pendências </font>
						</strong>
				</div>
				<div class="panel-body">
						<table class="mGrid1" id="registros">
							<thead>
								<tr>
									<th>Nº Solicitação</th>
									<th>Cliente</th>
									<th>Dt. Abertura</th>
									<th>Status</th>
									<th>Dias de Atraso</th>
									<th>Tratar</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${servicoes}" var="servicos">
									<tr>
										<td>${servicos.codServico}</td>
										<td>${servicos.emailEnvio}</td>
										<td>${servicos.definicao}</td>
										<td>${servicos.dados}</td>
										<td><a href="javascript:void(0);" onclick="editForm('servico', '${servicos.id}')"><span class="glyphicon glyphicon-edit"></span></a></td>	
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
		</div>
</div>
</sec:authorize>