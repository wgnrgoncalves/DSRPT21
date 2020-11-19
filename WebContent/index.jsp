<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>DSRPT21 - LOGIN</title>
    <%@include file="partial/estilos.txt" %>
</head>
<body>
<div style="min-height: 100vh; height: 100%; background-color: #ec145c;">
<div style="top: 50%; left: 50%; position: absolute; transform: translate(-50%, -50%);">
    <div style="background-color: #fff; padding: 100px;">
    <form class="form-signin" method="post" action="loginController">
        <h2 class="form-signin-heading" style="text-align: center; margin-bottom: 20px;">DSRPT21</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="Email" required autofocus>
        <label for="inputPassword" class="sr-only">Senha</label>
        <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
        <div class="checkbox hidden" style="margin-top: 5px;">
            <label>
                <input type="checkbox"  value="remember-me"> Remember me
            </label>
        </div>
            <div class="alert" style="padding: 0 !important; margin-bottom: 0 !important;">
                <p>${erro}</p>
            </div>
        <div class="row" style="margin-top: 15px">
            <div class="col-md-12" style="margin-top: 5px">
                <button class="btn btn-dark btn-block" type="submit">Login</button>
            </div>
            <div class="col-md-12" style="margin-top: 5px">
                <a class="btn btn-outline-dark btn-block" href="FuncionarioController">Novo Funcionário</a>
            </div>
        </div>
    </form>
    </div>
</div>
</div>
</body>
</html>