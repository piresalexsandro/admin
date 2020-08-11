<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<jsp:useBean id="data" class="java.util.Date"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="pt">
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>Abrir nova solicitação</title>
<link rel="stylesheet" href="${path}/css/abas.css" />
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
<body>
  <!-- Modal Excluir Anexo -->
<div class="modal fade" id="delete-anexo" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalLabel">Excluir Anexo</h4>
      </div>
      <div class="modal-body">
        Deseja realmente excluir este anexo?
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Sim</button>
 		<button type="button" class="btn btn-danger" data-dismiss="modal">N&atilde;o</button>
      </div>
    </div>
  </div>
</div> <!-- /.modal -->

<!-- Modal Abrir Solicitacao -->
<div class="modal fade" id="enviar-anexo" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalLabel">Enviar Anexo</h4>
      </div>
      <form method="POST" action="${path}/uploadAnexo" enctype="multipart/form-data">
      <input type="hidden" id="id_chamado" name="id_chamado" value="${param.id}" />
       <div class="modal-body">
         <div class="container-fluid"> 
           <div class="row">
				<div class="form-group  col-sm-6">
					<label for="senha" class="control-label">Selecionar Arquivo</label>
					<input class="form-control" type="file" value="" name="anexo" id="anexo" maxlength="20" placeholder="Selecione um arquivo" required="required">
				</div>
			</div>
          </div>
      </div>
      <div class="modal-footer">
         <button type="submit" class="btn btn-primary">Enviar</button>
	     <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
      </div>
      </form>
 </div>
</div>
</div>

<!-- Modal Excluir Chamado -->
<div class="modal fade" id="delete-cobranca" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="modalLabel">Cancelar Solicitação</h4>
      </div>
      <div class="modal-body">
        Deseja realmente cancelar esta solicitação?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Sim</button>
 		<button type="button" class="btn btn-danger" data-dismiss="modal">N&atilde;o</button>
      </div>
    </div>
  </div>
</div> <!-- /.modal -->

<div id="exTab3" class="container">
<div class="tab-content clearfix">
<div class="tab-pane active" id="1b">
<section>
	<div class="tab-content">
	<div class="col-lg-6">
	   <h4 align="center">Solicitação Nº 20200101202020
       </h4>
	</div>
      <div class="container-fluid">
		<form method="POST" action="${path}/gravarSolicitacao" onsubmit="adicionaLoading();">
			<div class="row">
				<button type="submit" class="btn  btn-info">
					<i class="fa fa-floppy-o" aria-hidden="true"></i>
					Salvar
				</button>
				<!--   -->
				<a href="#" class="btn btn-default" data-toggle="modal" data-target="#enviar-anexo">
				 <i class="fa fa-files-o" aria-hidden="true"></i>
				 Enviar Anexo
				</a>
			
			</div>
			<input type="hidden" name="acao" id="acao" value="update" />
			<input type="hidden" id="id_usuario" name="id_usuario" value="1" />
			<div class="row">
				<div class="form-group  col-sm-12  bw-required">
					<label for="nome" class="control-label">Nome Cliente</label>
					<input type="text" class="form-control" id="nome" />
				</div>
			</div>
			<div class="row">
				<div class="form-group  col-sm-3">
					<label for="dtAbertura" class="control-label">Data da Solicitação</label>
					<input type="text" class="form-control js-date" id="dtAbertura" value="<fmt:formatDate value="${data}" type="both" pattern="dd/MM/yyyy" dateStyle="full"/>" readonly="readonly"/>
				</div>
				<div class="form-group  col-sm-6">
					<label for="id_servico" class="control-label">Tipo de Solicitação</label>
					<select class="form-control" id="id_servico" name="id_servico" required="required">
					   <option value="">SELECIONAR TIPO DE SOLICITAÇÃO</option>
					   <c:forEach items="${servicos}" var="servico">
							<option value="${servico.id}">${servico.servico}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row">
				
				
				<div class="form-group  col-sm-3">
					<label for="cod_cliente" class="control-label">Código do cliente</label>
					<input type="text" class="form-control" id="cod_cliente" name="cod_cliente" value="10012030" readonly="readonly"/>
				</div>
				<div class="form-group  col-sm-3">
					<label for="cod_cliente" class="control-label">Nome Cliente</label>
					<input type="text" class="form-control" id="nome_cliente" name="nome_cliente" value="EMPRESA TESTE" readonly="readonly"/>
				</div>
			</div>
			<div class="row">
				<div class="form-group  col-sm-12  bw-required">
					<label for="comment" class="control-label">Informações adicionais</label>
					<textarea class="form-control" rows="3" id="comment" name="comment" required="required" x-moz-errormessage="Campo obrigatório Informe alguma informação para prosseguir" placeholder="Descreva aqui informações adicionais de sua solicitação. Máximo 1000 caracteres."
					onkeyup="limitTextArea(this,1000);" onkeydown="limitTextArea(this,1000);"></textarea>
				</div>
			</div>
			<input type="hidden" id="id_chamado" name="id_chamado" value="1" />
			<input type="hidden" id="id_usuario" name="id_usuario" value="1" />
</form>			
<div style="align:center; width:100%">
	<h3 align="center">Anexo(s) desta Solicitação</h3>
	<div align="center"> 
						  <table class="mGrid1" id="anexos" border="1">
			                <thead>
			                  <tr>
			                    <th data-type="alpha" align="center">Nome Anexo</th>
			                    <th data-type="alpha" align="center">Enviado Por</th>
			                    <th data-type="alpha" align="center">Data Envio</th>
			                    <th class="actions">Ações</th>
			                  </tr>
			                </thead>
			                <tbody>
			                <c:forEach var="os" items="${Anexo.rows}">
			                	<tr>
			                		<td style="text-align:left">
			                		  <div align="center">
			                		    <a href="${os.url}" target="_blank">
			                		    	${os.nome}
			                		    </a>
									  </div>
			                		</td>
			                		<td style="text-align:left">
			                		  <div align="center">
			                		       ${os.enviado}  
									  </div>
			                		</td>
			                		<td style="text-align:left">
			                		  <div align="center">
			                		       <fmt:formatDate value="${os.data_envio}" type="both" pattern="dd/MM/yyyy" dateStyle="full"/>
									  </div>
			                		</td>
			                		<td class="actions">
			                		  <div align="center">
			                		     <a href="${os.url}" target="_blank">
			                		    	<button class="btn btn-primary btn-xs" type="submit" title="Clique para visualizar anexo">
			                		    		<i class="fa fa-download" aria-hidden="true"></i>
			                		    	</button>
			                		    </a>
				                        <a href="${path}/excluirAnexo?id_anexo=${os.id_anexo}&id_chamado=${os.id_chamado}&p=S&acao=apagar">
				                        	<button class="btn btn-danger btn-xs" type="submit" title="Excluir Anexo">
				                        		<i class="fa fa-trash" aria-hidden="true"></i>
				                        	</button>
				                        </a>
				                      </div>  
				                    </td>
			                	</tr>
			                </c:forEach>
			                </tbody>
			              </table>
						 </div>
</div>
		
	</div>
	
</div>
</section>
</div>
</div>
</div>
</body>
</html>