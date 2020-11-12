package fiap.dsrpt21.modelo;

public class Solucao {
	
	private int id_solucao;
	private String nm_solucao;
	private String descricao;
	private String resposta;
	private TipoSolucao tipo_solucao;
	private Enigma proximo;
	private Enigma enigma;
	public int getId_solucao() {
		return id_solucao;
	}
	public void setId_solucao(int id_solucao) {
		this.id_solucao = id_solucao;
	}
	public String getNm_solucao() {
		return nm_solucao;
	}
	public void setNm_solucao(String nm_solucao) {
		this.nm_solucao = nm_solucao;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getResposta() {
		return resposta;
	}
	public void setResposta(String resposta) {
		this.resposta = resposta;
	}
	public TipoSolucao getTipo_solucao() {
		return tipo_solucao;
	}
	public void setTipo_solucao(TipoSolucao tipo_solucao) {
		this.tipo_solucao = tipo_solucao;
	}
	public Enigma getProximo() {
		return proximo;
	}
	public void setProximo(Enigma proximo) {
		this.proximo = proximo;
	}
	public Enigma getEnigma() {
		return enigma;
	}
	public void setEnigma(Enigma enigma) {
		this.enigma = enigma;
	}
	
	

	
	
}
