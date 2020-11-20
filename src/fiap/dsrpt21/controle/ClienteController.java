package fiap.dsrpt21.controle;

import fiap.dsrpt21.modelo.TipoUsuario;
import fiap.dsrpt21.modelo.Usuario;
import fiap.dsrpt21.negocio.UsuarioBO;
//import fiap.dsrpt21.modelo.Funcionario;
//import fiap.dsrpt21.modelo.Paciente;
//import fiap.dsrpt21.negocio.PacienteBO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * Servlet implementation class IncluiPaciente
 */
@WebServlet("/ClienteController")
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ClienteController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpServletResponse hres = (HttpServletResponse) response;
		HttpServletRequest hreq = (HttpServletRequest) request;
		HttpSession session = hreq.getSession();

		Object userHasPermission = session.getAttribute("usuarioLogado");

		if (!userHasPermission.equals(true)) {
			session.invalidate();
			hres.sendRedirect("index.jsp");
		}
		
		
		request.getRequestDispatcher("/views/admin/cadastraCliente.jsp").forward(request, response);
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpServletResponse hres = (HttpServletResponse) response;
		HttpServletRequest hreq = (HttpServletRequest) request;
		HttpSession session = hreq.getSession();

		Object userHasPermission = session.getAttribute("usuarioLogado");

		if (!userHasPermission.equals(true)) {
			session.invalidate();
			hres.sendRedirect("index.jsp");
		}


		//pegando informações do paciente através do formulário
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String tipoUsuario = request.getParameter("tp_usuario");
		String sexo = request.getParameter("sexo");
		String nascimento = request.getParameter("nascimento");

		//criando e preenchendo objeto Paciente
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		Usuario user = new Usuario();
		user.setNm_usuario(nome);
		user.setLogin(email);
		user.setSenha(senha);
		if (tipoUsuario.equals("1")) {
			user.setTp_usuario(TipoUsuario.ADMINISTRADOR);
		}else {
			user.setTp_usuario(TipoUsuario.COMUM);
		}
		user.setSexo(sexo);
		user.setDt_nascimento(LocalDate.parse(nascimento, dtf));



		//Instancia o Business Object (BO)
		UsuarioBO negocio = new UsuarioBO();
		try {
			negocio.incluir(user);

			request.setAttribute("usuario", user);
			request.setAttribute("msg", "Usuário incluído com sucesso!");

			request.getRequestDispatcher("/views/admin/exibeCliente.jsp").forward(request, response);
		}
		catch (Exception e) {
			request.setAttribute("erro", e.getMessage());
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}

	}

}
