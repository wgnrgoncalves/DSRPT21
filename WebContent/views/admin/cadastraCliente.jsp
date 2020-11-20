<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DSRPT21 - Cadastra Cliente</title>
	<%@include file="../../partial/estilos.txt"%>
</head>
<body>
	<%@include file="../../partial/admin/header.txt"%>

	<div class="container body-content" style="padding-top: 40px;">
		<form method="post" action="ClienteController">
			<h3>Cadastra cliente</h3>

			<div class="form-group">
				<label for="nome">Nome</label> 
				<input type="text" class="form-control" id="nome" name="nome" placeholder="Nome" required />
			</div>
			<div class="form-group">
				<label for="email">E-mail</label>
				<input type="text" class="form-control"  name="email" id="email" placeholder="E-mail" required/>
			</div>
			<div class="form-group">
				<label for="senha">Senha</label>
				<input type="password" class="form-control"  name="senha" id="senha" placeholder="Senha" required>
			</div>
			<div class="form-group">
				<label for="tp_usuario">Tipo Usuário</label>
				<select class="form-control" name="tp_usuario" id="tp_usuario" required>
					<option value="1">Administrador</option>
					<option value="2">Cliente</option>
				</select>
			</div>
			<div class="form-group">
				<label for="sexo">Sexo</label>
				<select class="form-control" name="sexo" id="sexo" required>
					<option value="M">Masculino</option>
					<option value="F">Feminino</option>
				</select>
			</div>
			<div class="form-group">
				<label for="nascimento">Data de nascimento</label>
				<input type="date" class="form-control"  name="nascimento" id="nascimento" placeholder="Nascimento" required/>
			</div>

			<input type="submit" value="Salvar" class="btn btn-primary"/>
		</form>
		<%@include file="../../partial/footer.txt"%>
	</div>

</body>
</html>