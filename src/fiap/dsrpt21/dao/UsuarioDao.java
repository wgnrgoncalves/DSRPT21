package fiap.dsrpt21.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import fiap.dsrpt21.modelo.Usuario;

public class UsuarioDao implements Dao<Usuario> {

	@Override
	public Usuario recuperaPorId(long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Usuario> recupera(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void altera(Usuario entidade) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void apaga(long id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void salva(Usuario entidade) throws Exception {
		// TODO Auto-generated method stub
		
	}

	private List<Usuario> login(Usuario f) throws SQLException, Exception {
		List<Usuario> retorno = new ArrayList();

		String sql = "select id, nome, tipo, login, senha from tbl_funcionario where login = ? and senha = ? ";
		try (Connection con = new ConectionFactory().getConexao();
			 PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, f.getLogin());
			pstmt.setString(2, f.getSenha());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId_usuario(rs.getInt(1));
				usuario.setNm_usuario(rs.getString(2));
//				funcionario.setTipo(TipoFuncionario.valueOf(rs.getString(3)));
				usuario.setLogin(rs.getString(4));
				usuario.setSenha(rs.getString(5));
				retorno.add(usuario);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return retorno;

	}

}
