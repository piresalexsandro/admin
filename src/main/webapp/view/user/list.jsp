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
<div class="modal fade" id="create-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
      <h4 class="modal-title" id="modalLabel"> Cadastro de Usuario 
        </h4>
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
        
      </div>
      <div class="modal-body">
        <div class="col-lg-12" style="align:center; width:100%">
        	
        </div>
     </div>
      <div class="modal-footer">
      	<button type="submit" class="btn btn-primary">SALVAR</button>
 		<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div> <!-- /.modal -->

<div class="panel panel-default">
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
<div>
				<div class="abas">
					<div class="tab-content">
						<div id="alert">
							<h5 align="center">
								<font color="black">
								<i class="fa fa-list" ></i> 	
								<b>Lista de Usuários</b>
								</font>
							</h5>
						</div>
						<div class="menu clearfix">
						</div>
						<div class="col-lg-12" style="align:center; width:100%">
						<div class="dt-buttons" align="right">
							<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#create-modal">
									<i class="fa fa-plus-square" aria-hidden="true"></i> 
									Novo
							</a>
						</div>
						
						 <br>
			              <table class="mGrid1" id="registros" >
			                <thead>
			                  <tr>
			                   <th>Nome</th>
								<th>Email</th>
								<th>Perfil de Acesso</th>
								<th>Grupo</th>
								<th>Editar</th>
								<th>Excluir</th>
			                  </tr>
			                </thead>
			                <tbody>
			                <c:forEach items="${users}" var="user">
								<tr>
									<td style="text-align:left">
										<div align="center">
											${user.fullName}
										</div>	
									</td>
									<td style="text-align:left">
										<div align="center">
											${user.userName}
										</div>
									</td>
									<td style="text-align:left">
									   <div align="center">
										${user.role.name}
									   </div>	
									</td>
									<td style="text-align:left">
									   <div align="center">
										${user.grupo.name}
									   </div>	
									</td>
									<td style="text-align:left">
										<div align="center">
											<a href="javascript:void(0);" onclick="editForm('user', '${user.id}')">
													<i class="fas fa-user-edit" aria-hidden="true"></i>
											</a>
										</div>
									</td>
									<td style="text-align:left">
									  <div align="center">	
										<a href="javascript:void(0);" onclick="deleteData('user', '${user.id}')"><i class="fa fa-trash"></i></a>
									  </div>	
									</td>
								</tr>
							</c:forEach>
			              
			                </tbody>
			              </table>
			          </div>
					</div>
				</div>
</div>
</sec:authorize>	
</div>