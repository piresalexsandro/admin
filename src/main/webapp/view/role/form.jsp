<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="data" class="java.util.Date"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<jsp:include page="../scripts.jsp" />
<style type="text/css">
		body {
				background:none !important;
				background-size: cover;
				display: flex;
				align-items: center;
				height: 100vh;
		}
</style>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
</head>
<div id="exTab3" class="container">
<div class="tab-content clearfix">
<div class="tab-pane active" id="1b">
<section>
	<div class="tab-content">
	<div class="panel panel-default">	
	<div class="col-lg-6">
	   <h4 align="center">Preencha os Dados do Perfil
       </h4>
	</div>
      <div class="container-fluid">
        <div class="panel-heading">
		<strong>
			<c:choose>
				<c:when test="${isNew}"><span class="glyphicon glyphicon-plus-sign"></span></c:when>
				<c:otherwise><span class="glyphicon glyphicon-edit"></span></c:otherwise>
			</c:choose> Dados do Perfil de Acesso
		</strong>
		</div> 
      	<form:form method="post" class="form-horizontal" action="${path}/role/add" commandName="roleForm" id="submitRoleForm">
		<form:hidden path="id"/>
			<div class="dt-buttons" align="center">
				<form:button value="Save" class="btn btn-primary">
				<i class="far fa-save"></i>
				<c:choose>
					<c:when test="${isNew}"> SALVAR</c:when>
					<c:otherwise> ALTERAR</c:otherwise>
				</c:choose>
				</form:button>
			</div>
			
			<div class="row">
				<div class="form-group  col-sm-12  bw-required">
					<label for="nome" class="control-label">Perfil de Acesso</label>
					<form:input class="form-control" path="name" placeholder="Digite o nome do perfil de acesso" required="true" oninvalid="setCustomValidity('Campo obrigatório digite o Perfil de Acesso!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
		</form:form>			
	</div>
	</div>
</div>
</section>
</div>
</div>
</div>

<!--<div class="panel panel-default">
	<div class="panel-heading">
		<strong>
			<c:choose>
				<c:when test="${isNew}"><span class="glyphicon glyphicon-plus-sign"></span></c:when>
				<c:otherwise><span class="glyphicon glyphicon-edit"></span></c:otherwise>
			</c:choose> Dados do Perfil de Acesso
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/role/add" commandName="roleForm" id="submitRoleForm">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label">Perfil de Acesso : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="name" placeholder="Digite o nome do perfil de acesso" required="true" oninvalid="setCustomValidity('Campo obrigatório digite o Perfil de Acesso!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
		</div>
		<div class="panel-footer">
			<form:button value="Save" class="btn btn-primary">
				<i class="far fa-save"></i>
				<c:choose>
					<c:when test="${isNew}"> SALVAR</c:when>
					<c:otherwise> ALTERAR</c:otherwise>
				</c:choose>
			</form:button>
		</div>
	</form:form>
</div> -->