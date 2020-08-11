<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE>
<head>
	<!-- ==========================
    	Meta Tags 
    =========================== -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<style type="text/css">
		table td{text-align: left !important;}
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
	 <link rel="stylesheet" href="${path}/css/jquery.dataTables.min.css" />
	 <script src="${path}/js/jquery.dataTables.min.js"></script>
</head>
<div class="panel panel-default">
<sec:authorize access="hasAnyRole('ROLE_SOLICITANTE')">
	<div class="panel-heading">
		<strong>
			<span class="glyphicon glyphicon-list"></span> Minhas Solicitações
		</strong>
		<div class="pull-right">
			<a href="javascript:void(0);" onclick="addForm('solicitacao')">
				<span class="glyphicon glyphicon-plus-sign"></span> Nova
			</a>
		</div>
	</div>
	<div class="panel-body">
		<table class="mGrid1" id="registros">
			<thead>
				<tr>
					<th>Nº Solicitação</th>
					<th>Cliente</th>
					<th>Serviço</th>
					<th>Dt. Abertura</th>
					<th>Status</th>
					<th>Visualizar</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${solicitacaoes}" var="solicitacao">
					<tr>
						<td>${solicitacao.id}</td>
						<td>${solicitacao.cliente.nome}</td>
						<td>${solicitacao.servico.servico}</td>
						<td>
							<fmt:formatDate value="${solicitacao.dataCriacao}" type="both" pattern="dd/MM/yyyy HH:mm" dateStyle="full"/>
						</td>
						<td>${solicitacao.statusSolicitacao.nome}</td>
						<td><a href="javascript:void(0);" onclick="editForm('solicitacao', '${solicitacao.id}')"><span class="glyphicon glyphicon-edit"></span></a></td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</sec:authorize>	
</div>