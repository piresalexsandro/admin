<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="data" class="java.util.Date"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<script type="text/javascript">
		hideLoading();
</script>
<script>
function limitTextArea(element, limit) {
	if (element.value.length > limit) {
			element.value = element.value.substring(0, limit);
			alert('Campo Informações adicionais aceita no máximo 1000 carácteres.');
	}
}
</script>
<style type="text/css">
		body {
				background:none !important;
				background-size: cover;
				display: flex;
				align-items: center;
				height: 100vh;
		}
</style>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>
			<c:choose>
				<c:when test="${isNew}"><span class="glyphicon glyphicon-plus-sign"></span></c:when>
				<c:otherwise><span class="glyphicon glyphicon-edit"></span></c:otherwise>
			</c:choose> Preencha os Dados da Solicitação
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/admin/add" commandName="solicitacaoForm" id="submitSolicitacaoForm" onsubmit="showLoading();">
		<form:hidden path="id"/>
		<div class="panel-body">
		   <c:choose>
		    <c:when test="${isNew}">
			<div class="form-group">
			    <label class="col-md-2 control-label">Código do Cliente : </label>
				<div class="col-md-4">
					<form:input class="form-control" maxlength="10" path="clienteId" placeholder="Digite o código do cliente" 
					required="true" pattern="[0-9]+$" 
					oninvalid="setCustomValidity('Digite o Código do cliente somente numeros!')" 
					onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
				<label class="col-md-2 control-label">Nome do Cliente : </label>
				<div class="col-md-4">
					<form:input class="form-control" maxlength="30" path="nomeCliente" placeholder="Digite o nome do cliente" required="true"
					pattern="^[^-\s][a-zA-ZÀ-ú ]*"
					oninvalid="setCustomValidity('Digite o Nome do cliente somente letras')" onchange="try{setCustomValidity('')}catch(e){}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Data da Solicitação : </label>
				<div class="col-md-4">
					<input type="text" class="form-control js-date" value="<fmt:formatDate value="${data}" type="both" pattern="dd/MM/yyyy" dateStyle="full"/>" readonly="readonly"/>
				</div>
				<label class="col-md-2 control-label">Nome da Solicitação : </label>
				<div class="col-md-4">
					<form:select class="form-control" id="servicoId" path="servicoId" required="required">
					   <form:option value="">SELECIONAR NOME DE SOLICITAÇÃO</form:option>
					   <c:forEach items="${catalogos}" var="catalogo">
						 <form:option value="${catalogo.id}">${catalogo.servico}</form:option>
					   </c:forEach>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Informações adicionais : </label>
				<div class="col-md-10">
				  <form:textarea path="comment" class="form-control" rows="7" id="comment" required="required" 
					x-moz-errormessage="Campo obrigatório Informe alguma informação para prosseguir" 
					placeholder="Descreva aqui informações adicionais de sua solicitação. Máximo 1000 caracteres."
					onkeyup="limitTextArea(this,1000);" onkeydown="limitTextArea(this,1000);"/>
				</div>
			</div>
			</c:when>
			<c:otherwise>
			<div class="form-group">
			    <label class="col-md-2 control-label">Código do Cliente : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="clienteId" readonly="true"/>
				</div>
				<label class="col-md-2 control-label">Nome do Cliente : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="nomeCliente" readonly="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Data da Solicitação : </label>
				<div class="col-md-4">
					<form:input class="form-control" path="dataCriacao" readonly="true"/>
				</div>
				<label class="col-md-2 control-label">Nome da Solicitação : </label>
				<div class="col-md-4">
					<form:select class="form-control" path="servicoId" required="required">
					   <c:forEach items="${catalogos}" var="catalogo">
						 <form:option value="${catalogo.id}">${catalogo.servico}</form:option>
					   </c:forEach>
					</form:select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label">Informações adicionais : </label>
				<div class="col-md-10">
				  <form:textarea path="comment" class="form-control" rows="7" />
				</div>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="panel-footer">
			<c:choose>
				<c:when test="${isNew}"> 
					<form:button value="Save" class="btn btn-primary">
						<span class="glyphicon glyphicon-floppy-disk"></span>
						  SALVAR
					</form:button>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</div>
	</form:form>
</div>