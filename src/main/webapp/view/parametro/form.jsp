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
			</c:choose> Dados do Parametro
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/parametro/add" commandName="parametroForm" id="submitParametroForm">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label">Valor : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="statusInicial" placeholder="Digite o Valor desejado" required="true" oninvalid="setCustomValidity('Campo obrigatório digite o Valor desejado ')" onchange="try{setCustomValidity('')}catch(e){}"/>
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