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
			</c:choose> Dados do Status
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/status/add" commandName="statusForm" id="submitStatusForm">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label">Nome do Status : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="nome" placeholder="Digite o Nome do Status" required="true" oninvalid="setCustomValidity('Campo obrigatório digite o Nome do Status!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
				<label class="col-md-2 control-label">Terminativo :</label>
				<div class="col-md-2">
					<form:select class="form-control" path="isTerminativo">
						<form:option value="true">SIM</form:option>
						<form:option value="false">NÃO</form:option>
					</form:select>
				</div>
				
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Requer Autorização :</label>
				<div class="col-md-2">
					<form:select class="form-control" path="requerAutorizacao">
						<form:option value="true">SIM</form:option>
						<form:option value="false">NÃO</form:option>
					</form:select>
				</div>
				<label class="col-md-2 control-label">Tempo SLA 1 :</label>
				<div class="col-md-1">
					<form:input class="form-control" maxlength="3" path="tempoSLALimite1" required="true" oninvalid="setCustomValidity('Campo obrigatório digite somente números!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
				<label class="col-md-2 control-label">Tempo SLA 2 :</label>
				<div class="col-md-1">
					<form:input class="form-control" maxlength="3" path="tempoSLALimite2" required="true" oninvalid="setCustomValidity('Campo obrigatório digite somente números!')" onchange="try{setCustomValidity('')}catch(e){}"/>
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