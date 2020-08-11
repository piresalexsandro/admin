<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
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
	<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
</head>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>
			<i class="fa fa-list" ></i> 
			Lista de Grupos cadastrados
		</strong>
		<div class="pull-right">
			<a href="javascript:void(0);" onclick="addForm('grupo')">
				<i class="fa fa-plus-square" ></i> 
				Novo
			</a>
		</div>
	</div>
	<div class="panel-body">
		<table class="mGrid1" id="registros">
			<thead>
				<tr>
					<th>Nome do Grupo</th>
					<th>Email para envio</th>
					<th>Editar</th>
					<!--<th>Excluir</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${grupoes}" var="grupo">
					<tr>
						<td>${grupo.name}</td>
						<td>${grupo.emailEnvio}</td>
						<td><a href="javascript:void(0);" onclick="editForm('grupo', '${grupo.id}')"><i class="fa fa-pencil-square-o"></i></a></td>
						<!--<td><a href="javascript:void(0);" onclick="deleteData('grupo', '${grupo.id}')"><i class="fa fa-trash"></i></a></td> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>