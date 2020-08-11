$(function() {
	$("#userList").click(function() {
		fetchList("user");
	});
	
	$("#roleList").click(function() {
		fetchList("role");
	});
	
	$("#grupoList").click(function() {
		fetchList("grupo");
	});
	
	$("#servicoList").click(function() {
		fetchList("servico");
	});
	
	$("#clienteList").click(function() {
		fetchList("cliente");
	});
	
	$("#parametroList").click(function() {
		fetchList("parametro");
	});
	
	$("#statusList").click(function() {
		fetchList("status");
	});
	
	$("#solicitacaoList").click(function() {
		fetchList("solicitacao");
	});
	
	$("#solicitacaoListCanceladas").click(function() {
		fetchList("solicitacao");
	});
	
	$("#solicitacaoListFinalizadas").click(function() {
		fetchList("solicitacao");
	});
	
	$("#solicitacaoForm").click(function() {
		fetchForm("solicitacao");
	});
	
});

function addForm(type) {
	modifyData(type+"/form");
}

function editForm(type, id) {
	modifyData(type+"/edit/"+id);
}

function updateForm(type, id) {
	modifyData(type+"/alterarUsuario/"+id);
}

function fetchList(type) {
	modifyData(type+"/list");
}

function fetchForm(type) {
	modifyData(type+"/solicitacao");
}

function modifyData(suffix) {
	$.ajax({
		type : "GET",
		url : "/admin/"+suffix,
		success : function(data) {
			$(".inner-jsp").html(data);
		}
	});
}

function dash() {
    $.ajax({
        url : '/admin/dashboard',
        success : function(data) {
            $('.inner-jsp').html(data);
        }
    });
}

function solicitation() {
    $.ajax({
        url : '/admin/solicitacao',
        success : function(data) {
        	//console.log(data);
            $('.inner-jsp').html(data);
        }
    });
}

function deleteData(type, id) {
	toastr.warning("<div>Tem certeza que deseja excluir este registro?</div>" +
			"<div class='btn-group pull-right'>" +
			"<button type='button' id='confirmationYes' class='btn btn-xs btn-default'><i class='glyphicon glyphicon-ok'></i> SIM</button>" +
			"<button type='button' class='btn btn-xs btn-default clear'><i class='glyphicon glyphicon-remove'></i> NÃO</button>" +
			"</div>", "Mensagem de confirmação", {
		allowHtml:true,
		closeButton:true,
		onShown: function() {
			$("#confirmationYes").click(function() {
				$.ajax({
					type : "GET",
					url : "/admin/"+type+"/delete/"+id,
					success : function(data) {
						fetchList(type);
						toastr.success(data.message, "Mensagem de Confirmação", {
							closeButton:true
						});
					}
				});
			});
		}
	});
}