package fiap.dsrpt21.controle;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fiap.dsrpt21.modelo.Usuario;
import fiap.dsrpt21.negocio.UsuarioBO;
//import fiap.nac2.modelo.TipoFuncionario;
//import fiap.nac2.negocio.FuncionarioBO;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/loginController")
public class loginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //doGet(request, response);
        String login = request.getParameter("email");
        String senha = request.getParameter("senha");
        //Instancia o Business Object (BO)
        UsuarioBO negocio = new UsuarioBO();
        boolean hasPermission;
        try {

            hasPermission = negocio.login(login, senha);
            if (hasPermission) {
                request.getSession().setAttribute("usuarioLogado", true);
                request.getRequestDispatcher("/views/index.jsp").forward(request, response);
            }else
            {
                request.setAttribute("erro", "Login ou senha inválido!");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }

        }
        catch (Exception e) {
            request.setAttribute("erro", e.getMessage());
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

}
