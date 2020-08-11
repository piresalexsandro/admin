<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:useBean id="data" class="java.util.Date"/>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  	<meta name="viewport" content="width=device-width, initial-scale=1"/>

 	<!-- ==========================
    	CSS 
    =========================== -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${path}/css/toastr.min.css" />
	<link rel="stylesheet" href="${path}/css/loading.css" />
	<link rel="stylesheet" href="${path}/css/grid.trable.css" />
	<style type="text/css">
			body {
				background: url("${path}/images/banner1000624.jpg") no-repeat center center fixed;
				background-size: cover;
				display: flex;
			}
	</style>
	<!-- ==========================
    	JS 
    =========================== -->
	<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
	<script src="${path}/js/loading.js"></script>
	<script type="text/javascript" src="${path}/js/jquery.boot.js"></script>
	<script type="text/javascript">
		hideLoading();
	</script>

	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- ==========================
    	Title 
    =========================== -->
    <title>ERP</title>
    
    <!-- ==========================
    	Favicons 
    =========================== -->
	<link rel="shortcut icon" href="${path}/images/favicon-messer.png" type="image/x-icon" />
	<link rel="apple-touch-icon" href="${path}/assets/icons/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="${path}/assets/icons/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="${path}/assets/icons/apple-touch-icon-114x114.png">

</head>

<body>
<div id="id01" class="w3-modal" style="display: none;"></div>
<c:if test="${pageContext.request.userPrincipal.name != null}">
	<!-- navbar -->

	<nav class="navbar navbar-expand-md navbar-light fixed-top" style="background-color: #000;">
		<form id="logoutForm" method="POST" action="${path}/logout">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		
		<div class="navbar-header mr-auto">
                <a href="#" class="navbar-brand" data-toggle="collapse" data-target=".navbar-collapse">
                	<img src="${path}/images/favicon-messer.png" class="img-responsive" alt="" width="30" height="30" />
                	<font color="white"><b>ERP</b></font> 
                </a>
                <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		                <i class="fa fa-bars"></i>
		        </button> -->
        </div>

		
		<div class="collapse navbar-collapse justify-content-between" id="nav">
			<ul class="navbar-nav">
			  	<li class="nav-item">
					<a class="nav-link text-light font-weight-bold px-3" href="${path}/" onclick="showLoading();">	
						<i class="fas fa-home" aria-hidden="true"></i>
						MENU
					</a>
				</li>
				<sec:authorize access="hasAnyRole('ROLE_EXECUTOR') or hasAnyRole('ROLE_ADMIN')">
				<li class="nav-item">
					<a class="nav-link text-light font-weight-bold px-3" href="javascript:void(0);" onclick="dash(); showLoading();">	
						<i class="fas fa-tachometer-alt" aria-hidden="true"></i>
						DASH
					</a>
				</li>
				</sec:authorize>
				<!-- ==========================
				   MENU PERMISSAO ROLE_ADMIN
				 =========================== -->
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<li class="nav-item dropdown" data-toggle="dropdown">
					<a class="nav-link text-light font-weight-bold px-3 dropdown-toggle" href="#">
					    <i class="fa fa-newspaper" aria-hidden="true"></i>	
						CADASTROS
					</a>
					<div id="cadastros" class="dropdown-menu">
							<a class="dropdown-item" href="javascript:void(0);" onclick="showLoading();" id="userList"> 
							<i class="fas fa-user"></i>
								Usuários (${usuarios})
							</a> 
							<a class="dropdown-item" href="javascript:void(0);"
								id="roleList" onclick="showLoading();"><i
								class="fa fa-id-card" aria-hidden="true"></i> Perfis (${roles})
							</a> 
							<a class="dropdown-item" href="javascript:void(0);"
								id="grupoList" onclick="showLoading();"><i
								class="fa fa-users" aria-hidden="true"></i> Grupos (${grupos}) 
							</a> 
							<a class="dropdown-item" href="javascript:void(0);"
								id="servicoList" onclick="showLoading();"> <i
								class="fas fa-list-alt"></i> Serviços (${servicos})
							</a> 
							<a class="dropdown-item" href="javascript:void(0);"
								id="clienteList" onclick="showLoading();"><i
								class="fas fa-address-card"></i> Clientes (${clientes}) 
							</a> 
							<a
								class="dropdown-item" href="javascript:void(0);" id="statusList"
								onclick="showLoading();"> <i class="fa fa-sitemap"></i>
								Status (${status})
							</a>
				    </div>
				</li>
				</sec:authorize>
			</ul>
			<!-- ==========================
				MENU PERMISSAO ROLE_ADMIN
			=========================== -->
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<ul class="navbar-nav">
				<li class="nav-item dropdown" data-toggle="dropdown">
					<a class="nav-link text-light font-weight-bold px-3 dropdown-toggle" href="#">
					    <i class="fas fa-chart-pie" aria-hidden="true"></i>	
						RELATÓRIOS
					</a>
					<div id="relatorios" class="dropdown-menu">
							<a class="dropdown-item" href="${path}/" id="reportStatus"
								onclick="showLoading();">
				                       <i class="fas fa-chart-area" aria-hidden="true"></i>
				                    	Pesquisa de Solicitações por status
				            </a>
				            <a class="dropdown-item" href="${path}/" id="reportGroup"
								onclick="showLoading();">
				                        <i class="fas fa-chart-pie" aria-hidden="true"></i>
				                    	Pesquisa de Solicitações por grupo
				            </a>
				            <a class="dropdown-item" href="${path}/" id="reportDate"
								onclick="showLoading();">
				                        <i class="fas fa-chart-line" aria-hidden="true"></i>
				                    	Pesquisa de Solicitações por data
				            </a>
				            <a class="dropdown-item" href="${path}/" id="reportCustomer"
								onclick="showLoading();">
				                        <i class="fas fa-address-card" aria-hidden="true"></i>
				                    	Pesquisa de Solicitações por código do cliente
				            </a>
					</div>
					
			  </li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown" data-toggle="dropdown">
					<a class="nav-link text-light font-weight-bold px-3 dropdown-toggle" href="#">
					    <i class="fas fa-chart-pie" aria-hidden="true"></i>	
						REDIRECIONADAS
					</a>
					<div id="relatorios" class="dropdown-menu">
							<a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
				                       <i class="fas fa-tasks" aria-hidden="true"></i>
				                    	Gerência C2C
				            </a>
							<a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
									   <i class="fas fa-balance-scale" aria-hidden="true"></i>
				                    	Escritório de Advocacia
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-gavel" aria-hidden="true"></i>
				                    	Jurídico Interno
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
				                        <i class="fas fa-address-card" aria-hidden="true"></i>
				                    	Gerência Comercial
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-universal-access" aria-hidden="true"></i>
				                    	Comercial
				            </a>
					</div>
					
			  </li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown" data-toggle="dropdown">
					<a class="nav-link text-light font-weight-bold px-3 dropdown-toggle" href="#">
					    <i class="fas fa-chart-pie" aria-hidden="true"></i>	
						MINHAS TAREFAS
					</a>
					<div id="relatorios" class="dropdown-menu">
							<a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
									   <i class="fas fa-exclamation-triangle" aria-hidden="true"></i>
				                    	Solicitações pendentes
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-thumbs-up" aria-hidden="true"></i>
				                    	Solicitações aprovadas
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-thumbs-down" aria-hidden="true"></i>
				                    	Solicitações reprovadas
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-users-cog" aria-hidden="true"></i>
				                    	Solicitações redirecionadas
				            </a>
					</div>
					
			  </li>
			</ul>
			</sec:authorize>
			<!-- ==========================
				  MENU PERMISSAO ROLE_EXECUTOR
			=========================== -->
			<sec:authorize access="hasAnyRole('ROLE_EXECUTOR')">
			<ul class="navbar-nav">
				<li class="nav-item dropdown" data-toggle="dropdown">
					<a class="nav-link text-light font-weight-bold px-3 dropdown-toggle" href="#">
					    <i class="fas fa-chart-pie" aria-hidden="true"></i>	
						MINHAS TAREFAS
					</a>
					<div id="relatorios" class="dropdown-menu">
							<a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
									   <i class="fas fa-exclamation-triangle" aria-hidden="true"></i>
				                    	Solicitações pendentes
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-thumbs-up" aria-hidden="true"></i>
				                    	Solicitações aprovadas
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-thumbs-down" aria-hidden="true"></i>
				                    	Solicitações reprovadas
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-users-cog" aria-hidden="true"></i>
				                    	Solicitações redirecionadas
				            </a>
					</div>
					
			  </li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item dropdown" data-toggle="dropdown">
					<a class="nav-link text-light font-weight-bold px-3 dropdown-toggle" href="#">
					    <i class="fas fa-chart-pie" aria-hidden="true"></i>	
						REDIRECIONADAS
					</a>
					<div id="relatorios" class="dropdown-menu">
							<a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
				                       <i class="fas fa-tasks" aria-hidden="true"></i>
				                    	Gerência C2C
				            </a>
							<a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
									   <i class="fas fa-balance-scale" aria-hidden="true"></i>
				                    	Escritório de Advocacia
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-gavel" aria-hidden="true"></i>
				                    	Jurídico Interno
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
				                        <i class="fas fa-address-card" aria-hidden="true"></i>
				                    	Gerência Comercial
				            </a>
				            <a class="dropdown-item" href="javascript:void(0);" id="userList"
								onclick="showLoading();">
										<i class="fas fa-universal-access" aria-hidden="true"></i>
				                    	Comercial
				            </a>
					</div>
					
			  </li>
			</ul>
			</sec:authorize>
			
			<!-- ==========================
				 MENU PERMISSAO ROLE_SOLICITANTE
			=========================== -->
			<sec:authorize access="hasRole('ROLE_SOLICITANTE')">
			<ul class="navbar-nav">
			  	<li class="nav-item">
					<a class="nav-link text-light font-weight-bold px-3" href="javascript:void(0);" id="solicitacaoList" onclick="showLoading();">	
						<i class="fas fa-newspaper" aria-hidden="true"></i>
						MINHAS SOLICITAÇÕES
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light font-weight-bold px-3" href="javascript:void(0);" onclick="addForm('solicitacao'); showLoading();">	
						<i class="fas fa-calendar-plus" aria-hidden="true"></i>
						ABRIR SOLICITAÇÃO
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link text-light font-weight-bold px-3" href="${path}/" onclick="showLoading();">
						<i class="fas fa-clipboard-list"aria-hidden="true"></i>	
						SOLICITAÇÕES FINALIZADAS
					</a>
				</li>
			</ul>		
			</sec:authorize>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item dropdown" data-toggle="dropdown">
	                    	<li class="nav-item dropdown" data-toggle="dropdown">
								<a class="nav-link text-light font-weight-bold px-3 dropdown-toggle" href="#" title="Clique para alterar seus dados">
								    <i class="fas fa-user" aria-hidden="true"></i>
									${nomeUsuarioLogado}
								</a>
								<div id="dados" class="dropdown-menu">
										<sec:authorize access="hasAnyRole('ROLE_EXECUTOR') or hasAnyRole('ROLE_ADMIN')">
											 <a class="dropdown-item" href="javascript:void(0);" onclick="dash(); showLoading();">
						                       <i class="fas fa-tachometer-alt" aria-hidden="true"></i>
						                    	Dashboard
						                    </a>
										</sec:authorize>
										<a class="dropdown-item" href="javascript:void(0);" onclick="updateForm('user', '${userId}');showLoading();">
												   <i class="fas fa-users-cog"aria-hidden="true"></i>
	                            					Atualizar meus dados
							            </a>
							            <a class="nav-link text-dark font-weight-bold px-3" href="javascript:void(0);" onclick="document.forms['logoutForm'].submit();showLoading();">
					                          <i class="fa fa-power-off" aria-hidden="true"></i>
					                           SAIR
					                    </a>
								</div>
								
						  </li>
	            <li>      	
			</ul>
			<!-- Pesquisa de solcitacao bar -->
			<!--<sec:authorize access="hasAnyRole('ROLE_EXECUTOR') or hasAnyRole('ROLE_ADMIN')">
			<form class="navbar-form navbar-right" method="POST" action="${path}/pesquisa" onsubmit="showLoading();">
				<div class="input-group">
					<input type="text" class="form-control" maxlength="6" placeholder="Nº da Solicitação" required="required" pattern="[0-9]+$" 
							oninvalid="setCustomValidity('Digite o Nº da Solicitação somente numeros!')" onchange="try{setCustomValidity('')}catch(e){}">
					<button type="submit">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</form>
			</sec:authorize>-->
		</div>
	</nav>
	
	<br/>
	<div class="container-fluid">
		  <div class="inner-jsp"></div>
	</div>
</c:if>		
</body>
</html>