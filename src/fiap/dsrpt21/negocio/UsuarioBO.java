package fiap.dsrpt21.negocio;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import org.apache.jasper.tagplugins.jstl.core.Set;

import fiap.dsrpt21.dao.ConectionFactory;
import fiap.dsrpt21.dao.Dao;
import fiap.dsrpt21.dao.UsuarioDao;
import fiap.dsrpt21.modelo.Usuario;
import fiap.dsrpt21.dao.ExceptionDao;
//import fiap.nac2.dao.FuncionarioDao;
//import fiap.nac2.modelo.Funcionario;

public class UsuarioBO {
    Dao<Usuario> dao = null;

    public UsuarioBO() {
        this.dao = new UsuarioDao();
    }

    public void Incluir(Usuario usuario) throws Exception {

        // verifica se campos estão preenchidos
        if (usuario.getNm_usuario().trim() == "") {
            throw new ExceptionDao("Nome vazio");
        }

        if (usuario.getLogin().trim() == "") {
            throw new ExceptionDao("Login vazio");
        }

        if (usuario.getSenha().trim() == "") {
            throw new ExceptionDao("Senha vazia");
        }

        if (Existe(usuario.getLogin())) {
            throw new ExceptionDao("Usuário já existe!");
        }

        usuario.setSenha(MD5(usuario.getSenha()));


        dao.salva(usuario);

    }

    private String MD5(String str) throws NoSuchAlgorithmException {

        MessageDigest m = MessageDigest.getInstance("MD5");
        m.update(str.getBytes(), 0, str.length());
        return new BigInteger(1, m.digest()).toString(16);
    }


    public boolean login(String login, String senha) throws Exception{
        boolean permission = false;

        if(login == null) {
            throw new ExceptionDao("Login vazio");
        }
        if(senha == null) {
            throw new ExceptionDao("Senha vazia");
        }
        Usuario user = new Usuario();
        user.setLogin(login);
        user.setSenha(senha);


        String sql = "select id_usuario, nm_usuario, login, senha, id_tipo_usuario, sexo, dt_nascimento from usuario where login = ? and senha = ? ";
        try (Connection con = new ConectionFactory().getConexao();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, user.getLogin());
            pstmt.setString(2, user.getSenha());

            ResultSet rs = pstmt.executeQuery();


            if (rs.next()) {
                permission = true;
            }

            return permission;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }


    public boolean Existe(String login) {
        List<Usuario> lst = null;

        Map<String, Object> param = new HashMap();
        param.put("login", login);

        try {
            lst = dao.recupera(param);

            return lst != null && lst.size() > 0;

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }

    }

}
