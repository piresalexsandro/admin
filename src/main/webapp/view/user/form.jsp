<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script type="text/javascript">
	hideLoading();
</script>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>
			<c:choose>
				<c:when test="${isNew}"><span class="glyphicon glyphicon-plus-sign"></span></c:when>
				<c:otherwise><span class="glyphicon glyphicon-edit"></span></c:otherwise>
			</c:choose> <font color="black">
								<i class="fas fa-users-cog"></i> 	
								<b>Dados do usuário</b>
								</font> 
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/user/add" commandName="userForm" id="submitUserForm">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label">
					<font color="white">
						Nome Completo : 
					</font>
				</label>
				<div class="col-md-10">
					<form:input class="form-control" path="fullName" placeholder="Digite o Nome Completo somente letras" required="true" 
					pattern="^[^-\s][a-zA-ZÀ-ú ]*"
					oninvalid="setCustomValidity('Digite o Nome Completo somente letras')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Perfil de acesso :</label>
				<div class="col-md-4">
					<form:select class="form-control" path="roleId" required="true" 
						oninvalid="setCustomValidity('Selecione um Perfil para prosseguir')" onchange="try{setCustomValidity('')}catch(e){}">
						<form:option value="">Selecionar</form:option>
						<c:forEach items="${roles}" var="role">
							<form:option value="${role.id}">${role.name}</form:option>
						</c:forEach>
					</form:select>
				</div>
			
				<label class="col-md-2 control-label">Grupo :</label>
				<div class="col-md-4">
					<form:select class="form-control" path="grupoId" required="true" 
						oninvalid="setCustomValidity('Selecione um Grupo para prosseguir')" onchange="try{setCustomValidity('')}catch(e){}">
						<form:option value="">Selecionar</form:option>
						<c:forEach items="${grupos}" var="grupo">
							<form:option value="${grupo.id}">${grupo.name}</form:option>
						</c:forEach>
					</form:select>
				</div>
				
				
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Email de acesso : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="userName" placeholder="Digite o email de acesso" required="true" 
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" 
					oninvalid="setCustomValidity('Digite o email ex: email@email.com')" onchange="try{setCustomValidity('')}catch(e){}" />
				</div>
				
				<label class="col-md-2 control-label">Senha : </label>
				<div class="col-md-4">
					<form:password class="form-control" path="password" placeholder="Digite a Senha" required="true" 
					oninvalid="setCustomValidity('Digite a Senha para prosseguir')" onchange="try{setCustomValidity('')}catch(e){}" />
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
</div>