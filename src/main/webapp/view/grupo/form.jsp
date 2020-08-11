<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>
			<c:choose>
				<c:when test="${isNew}"><span class="glyphicon glyphicon-plus-sign"></span></c:when>
				<c:otherwise><span class="glyphicon glyphicon-edit"></span></c:otherwise>
			</c:choose> Dados do Grupo
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/grupo/add" commandName="grupoForm" id="submitGrupoForm">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label">Nome do Grupo : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="name" placeholder="Digite o Nome do Grupo somente letras minusculas" required="true" oninvalid="setCustomValidity('Campo obrigatório digite somente letras minúsculas!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Email para envio : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="emailEnvio" placeholder="Digite o email para envio" required="true" oninvalid="setCustomValidity('Campo obrigatório digite email formato correto! ex: email@email.com ')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
		</div>
		<div class="panel-footer">
			<form:button value="Save" class="btn btn-primary">
				<i class="fa fa-floppy-o" aria-hidden="true"></i>
				<c:choose>
					<c:when test="${isNew}"> SALVAR</c:when>
					<c:otherwise> ALTERAR</c:otherwise>
				</c:choose>
			</form:button>
		</div>
	</form:form>
</div>