<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<style type="text/css">
		table td{text-align: left !important;}
	</style>
	<link rel="shortcut icon" href="${path}/images/favicon.ico" />
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
	<div class="panel-heading">
		<strong>
			<span class="glyphicon glyphicon-list"></span> Lista de clientes cadastrados
		</strong>
		<div class="pull-right">
			<a href="javascript:void(0);" onclick="addForm('cliente')">
				<span class="glyphicon glyphicon-plus-sign"></span> Novo
			</a>
		</div>
	</div>
	<div class="panel-body">
		<table class="mGrid1" id="registros">
			<thead>
				<tr>
					<th>Codigo do cliente</th>         
					<th>Nome do cliente</th>
					<th>Status</th>
					<th>Editar</th>
					<th>Excluir</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clientees}" var="clientes">
					<tr>
						<td>${clientes.codCliente}</td>
						<td>${clientes.nome}</td>
						<td>
							<c:choose>
								<c:when test="${clientes.status eq 1}"> ATIVO</c:when>
								<c:otherwise> INATIVO</c:otherwise>
							</c:choose>
						</td>
						<td><a href="javascript:void(0);" onclick="editForm('cliente', '${clientes.id}')"><span class="glyphicon glyphicon-edit"></span></a></td>
						<td><a href="javascript:void(0);" onclick="deleteData('cliente', '${clientes.id}')"><span class="glyphicon glyphicon-trash"></span></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>