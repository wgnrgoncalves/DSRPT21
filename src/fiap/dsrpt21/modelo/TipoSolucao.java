package fiap.dsrpt21.modelo;

public enum TipoSolucao {
	Texto("A Solução tem que ser escrita"),
	Escolha("A Solução é uma escolha");
	
	private TipoSolucao(String nome) {
		this.nome = nome;
	}

	private String nome;
	
	public String getNome() {
		return nome;
	}

}
