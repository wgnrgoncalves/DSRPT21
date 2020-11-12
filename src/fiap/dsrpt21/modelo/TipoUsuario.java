package fiap.dsrpt21.modelo;

public enum TipoUsuario {
	Administrador("Administrador do Sistema"),
	Comum("Usuario Comum");
	
	private TipoUsuario(String nome) {
		this.nome = nome;
	}

	private String nome;
	
	public String getNome() {
		return nome;
	}

}
