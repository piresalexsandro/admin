<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="data" class="java.util.Date"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<jsp:include page="scripts.jsp" />
<script>
function limitTextArea(element, limit) {
	if (element.value.length > limit) {
			element.value = element.value.substring(0, limit);
			alert('Campo Informações adicionais aceita no máximo 1000 carácteres.');
	}
}
</script>
</head>
<br/>
<div id="exTab3" class="container">
<div class="tab-content clearfix">
<div class="tab-pane active" id="1b">
<section>
	<div class="tab-content">
	<div class="col-lg-6">
	   <h4 align="center">Preencha os Dados da Solicitação
       </h4>
	</div>
      <div class="container-fluid">
		<form method="POST" action="${path}/admin/add" id="submitSolicitacaoForm">
			<div class="dt-buttons" align="center">
				<button type="submit" class="btn btn-primary">
					<i class="fa fa-save" aria-hidden="true"></i>
					SALVAR
				</button>
			</div>
			
			<div class="row">
				<div class="form-group  col-sm-12  bw-required">
					<label for="nome" class="control-label">Nome do cliente</label>
					<input type="text" class="form-control" id="cliente" name="clienteId" required="required"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group  col-sm-3">
					<label for="dtAbertura" class="control-label">Data da Solicitação</label>
					<input type="text" class="form-control js-date" id="dtAbertura" value="<fmt:formatDate value="${data}" type="both" pattern="dd/MM/yyyy" dateStyle="full"/>" readonly="readonly"/>
				</div>
				<div class="form-group  col-sm-6">
					<label for="id_servico" class="control-label">Tipo de Solicitação</label>
					<select class="form-control" id="servicoId" name="servicoId" required="required">
					   <option value="">SELECIONAR TIPO DE SOLICITAÇÃO</option>
					   <c:forEach items="${catalogos}" var="catalogo">
						 <option value="${catalogo.id}">${catalogo.servico}</option>
					   </c:forEach>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group  col-sm-12  bw-required">
					<label for="comment" class="control-label">Informações adicionais</label>
					<textarea class="form-control" rows="7" id="comment" name="comment" required="required" 
					x-moz-errormessage="Campo obrigatório Informe alguma informação para prosseguir" 
					placeholder="Descreva aqui informações adicionais de sua solicitação. Máximo 1000 caracteres."
					onkeyup="limitTextArea(this,1000);" onkeydown="limitTextArea(this,1000);"></textarea>
				</div>
			</div>
		</form>			
	</div>
</div>
</section>
</div>
</div>
</div>