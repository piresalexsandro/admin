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
			</c:choose> Cliente
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/cliente/add" commandName="clienteForm" id="submitClienteForm" onsubmit="showLoading();">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label">Nome do cliente : </label>
				<div class="col-md-8">
					<form:input class="form-control" path="nome" placeholder="Digite o nome do cliente" required="true"
					pattern="^[^-\s][a-zA-ZÀ-ú ]*"
					oninvalid="setCustomValidity('Digite o Nome do cliente somente letras')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Código do cliente : </label>
				<div class="col-md-2">
					<form:input class="form-control" path="codCliente" placeholder="Digite o código do cliente" required="true"
					pattern="[0-9]+$" 
					oninvalid="setCustomValidity('Digite o Código do cliente somente numeros!')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
				<label class="col-md-2 control-label">Status :</label>
				<div class="col-md-2">
					<form:select class="form-control" path="status" required="true" oninvalid="setCustomValidity('Selecione um Status para prosseguir')" onchange="try{setCustomValidity('')}catch(e){}">
						<form:option value="1">ATIVO</form:option>
						<form:option value="0">INATIVO</form:option>
					</form:select>
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