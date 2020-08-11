$(document).ready(function() {
	$(function() {
		$("#cliente").autocomplete({
			width: 300,
	        max: 10,
	        delay: 100,
	        minLength: 3,
	        autoFocus: true,
	        cacheLength: 1,
	        scroll: true,
	        highlight: false,
			source : function(request, response) {
				$.ajax({
					url : "/admin/cliente/pesquisaCliente",
					type : "GET",
					data : {
						term : request.term
					},
					dataType : "json",
					success : function(data) {
						response(data);
					}
				});
			}
		});
	});
});
