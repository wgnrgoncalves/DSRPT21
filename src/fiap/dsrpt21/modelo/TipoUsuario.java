package fiap.dsrpt21.modelo;

public enum TipoUsuario {
	ADMINISTRADOR("Administrador do Sistema"),
	COMUM("Usuario Comum");
	
	private TipoUsuario(String nome) {
		this.nome = nome;
	}

	private String nome;
	
	public String getNome() {
		return nome;
	}

}
