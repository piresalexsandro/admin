<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   	<link rel="shortcut icon" href="https://www.messer-br.com/wp-content/uploads/2019/08/favicon-messer-1.png" type="image/x-icon" />
	<title>Messer Brasil</title>
	<style type="text/css">
			/*body {
				background: url("https://imprimeai.com.br/wp-content/uploads/2019/07/logo-preto2.png") no-repeat center center fixed;
				background-size: cover;
				display: flex;
				align-items: center;
				height: 100vh;
			}*/
	</style>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
		<div align="center">
			<img alt="" src="https://imprimeai.com.br/wp-content/uploads/2019/06/logo1.2.png" />
		</div>
		<br><br>
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
                   <form method="POST" action="${path}/user/login" name="login">
                   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                   		   <c:if test="${error != null}">
									<div class="alert alert-danger">
										<strong>${error}</strong>
									</div>
							</c:if>
							<c:if test="${message != null}">
									<div class="alert alert-success">
										<strong>${message}</strong>
									</div>
							</c:if> 	
                           <div class="form-group">
                              <label for="exampleInputEmail1">
                              	<font color="black"><b>E-mail</b></font>
                              </label>
                              <input type="email" name="username"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Digite seu email" required="required" oninvalid="setCustomValidity('Campo obrigatório digite seu email!')" onchange="try{setCustomValidity('')}catch(e){}">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">
                              	<font color="black"><b>Senha</b></font>
                              </label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Digite sua senha" required="required" oninvalid="setCustomValidity('Campo obrigatório digite sua senha!')" onchange="try{setCustomValidity('')}catch(e){}">
                           </div>
                
                           <div class="col-md-12 text-center ">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">ENTRAR</button>
                           </div>
                        </form>
                 
				</div>
			</div>
			  
			</div>
		</div>
      </div> 
<!-- /container -->
</body>
</html>