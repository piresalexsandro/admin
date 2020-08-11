<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			</c:choose> Dados do Servi�o
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/servico/add" commandName="servicoForm" id="submitServicoForm" onsubmit="showLoading();">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label">C�digo do Servi�o : </label>
				<div class="col-md-2">
					<form:input class="form-control" maxlength="7" path="codServico" placeholder="Digite o c�digo do Servi�o" required="true" oninvalid="setCustomValidity('Campo obrigat�rio digite o C�digo do Servi�o!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
				<label class="col-md-1 control-label">SLA : </label>
				<div class="col-md-1">
					<form:input class="form-control" maxlength="3" path="sla" required="true" pattern="[0-9]{3}$" oninvalid="setCustomValidity('Campo obrigat�rio digite somente n�meros!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Nome do Servi�o : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="servico" placeholder="Digite o Nome do Servi�o somente letras min�sculas" required="true" oninvalid="setCustomValidity('Campo obrigat�rio digite somente letras min�sculas!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
		</div>
		<div class="panel-footer">
			<form:button value="Save" class="btn btn-primary">
				<span class="glyphicon glyphicon-floppy-disk"></span>
				<c:choose>
					<c:when test="${isNew}"> SALVAR</c:when>
					<c:otherwise> ALTERAR</c:otherwise>
				</c:choose>
			</form:button>
		</div>
	</form:form>
</div>