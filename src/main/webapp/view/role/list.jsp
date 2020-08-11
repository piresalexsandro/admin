<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		body {
				background:none !important;
				background-size: cover;
				display: flex;
				align-items: center;
				height: 100vh;
		}
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
<div>
				<div class="abas">
					<div class="tab-content">
						<div id="alert">
							<h5 align="center">
								<font color="black">
								<i class="fa fa-list" ></i> 	
								<b>Lista de Perfis</b>
								</font>
							</h5>
						</div>
						<div class="menu clearfix">
						</div>
						<div class="col-lg-12" style="align:center; width:100%">
						<div class="dt-buttons" align="right">
							<a class="btn btn-primary" href="javascript:void(0);" onclick="addForm('role')">
								<i class="fa fa-plus-square" aria-hidden="true"></i> 
								Novo
							</a>
						 <br><br>
			              <table class="mGrid1" id="registros" >
			                <thead>
			                  <tr>
			                    <th>Perfil</th>
								<th>Editar</th>
								<th>Excluir</th>
			                  </tr>
			                </thead>
			                <tbody>
			                <c:forEach items="${rolees}" var="role">
								<tr>
									<td>${role.name}</td>
									<td><a href="javascript:void(0);" onclick="editForm('role', '${role.id}')"><i class="fas fa-edit" aria-hidden="true"></i></a></td>
									<td><a href="javascript:void(0);" onclick="deleteData('role', '${role.id}')"><i class="fa fa-trash"></i></a></td>
								</tr>
							</c:forEach>
			              
			                </tbody>
			              </table>
			          </div>
					</div>
				</div>
			</div>
</div>			