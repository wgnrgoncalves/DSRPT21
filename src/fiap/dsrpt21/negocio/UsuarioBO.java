package fiap.dsrpt21.negocio;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

//import org.apache.jasper.tagplugins.jstl.core.Set;

import fiap.dsrpt21.dao.*;
import fiap.dsrpt21.modelo.TipoUsuario;
import fiap.dsrpt21.modelo.Usuario;
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


    public Usuario login(String login, String senha) throws Exception {
        if (login == null) {
            throw new ExceptionDao("Login vazio");
        }
        if (senha == null) {
            throw new ExceptionDao("Senha vazia");
        }
        Usuario user = new Usuario();
        user.setLogin(login);
        user.setSenha(senha);


        String sql = "select * from usuario inner join tipo_usuario on usuario.id_tipo_usuario = tipo_usuario.id_tipo_usuario where login = ? and senha = ? ";
        try (Connection con = new ConectionFactory().getConexao();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, user.getLogin());
            pstmt.setString(2, user.getSenha());

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                user.setId_usuario(rs.getInt(1));
                user.setNm_usuario(rs.getString(2));
                user.setTp_usuario(TipoUsuario.valueOf(rs.getString("NM_TIPO_USUARIO")));
                user.setLogin(rs.getString(3));
                user.setSenha(rs.getString(4));
            }

            return user;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void incluir(Usuario u) throws Exception {

        String sql = "INSERT INTO USUARIO(NM_USUARIO, LOGIN, SENHA, ID_TIPO_USUARIO, SEXO, DT_NASCIMENTO)"
                + " VALUES(?, ?, ?, ?, ?, ?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = new ConectionFactory().getConexao();
            pstmt = con.prepareStatement(sql, new String[]{"ID_USUARIO"});

            long tipoUsuario = 0;

            if (u.getTp_usuario() == TipoUsuario.ADMINISTRADOR) {
                tipoUsuario = 1;
            }else {
                tipoUsuario = 2;
            }

            pstmt.setString(1, u.getNm_usuario());
            pstmt.setString(2, u.getLogin());
            pstmt.setString(3, u.getSenha());
            pstmt.setLong(4, tipoUsuario);
            pstmt.setString(5, String.valueOf(u.getSexo()));
            pstmt.setDate(6, UtilBanco.converte(u.getDt_nascimento()));

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();
            if (rs.next()) {
                long id = rs.getBigDecimal(1).longValue();
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw e;  //propaga a exception
        } finally {
            pstmt.close();
            con.close();
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
