package fiap.dsrpt21.modelo;

public enum TipoSolucao {
	Texto("A Solu��o tem que ser escrita"),
	Escolha("A Solu��o � uma escolha");
	
	private TipoSolucao(String nome) {
		this.nome = nome;
	}

	private String nome;
	
	public String getNome() {
		return nome;
	}

}
