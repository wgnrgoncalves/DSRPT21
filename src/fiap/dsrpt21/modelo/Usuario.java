package fiap.dsrpt21.modelo;

public class Usuario {
	
	private int id_usuario;
	private String nm_usuario;
	private String login;
	private String senha;
	private TipoUsuario tp_usuario;
	
	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public String getNm_usuario() {
		return nm_usuario;
	}
	public void setNm_usuario(String nm_usuario) {
		this.nm_usuario = nm_usuario;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public TipoUsuario getTp_usuario() {
		return tp_usuario;
	}
	public void setTp_usuario(TipoUsuario tp_usuario) {
		this.tp_usuario = tp_usuario;
	}
	
	
	

}
