package fiap.dsrpt21.modelo;

import java.util.List;

public class Local {
	private int id_local;
	private String nm_local;
	private String descricao;
	private String coordenada;
	private List<Imagem> imagem;
	private Cidade cidade;
	
	public int getId_local() {
		return id_local;
	}
	public void setId_local(int id_local) {
		this.id_local = id_local;
	}
	public String getNm_local() {
		return nm_local;
	}
	public void setNm_local(String nm_local) {
		this.nm_local = nm_local;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getCoordenada() {
		return coordenada;
	}
	public void setCoordenada(String coordenada) {
		this.coordenada = coordenada;
	}
	public List<Imagem> getImagem() {
		return imagem;
	}
	public void setImagem(List<Imagem> imagem) {
		this.imagem = imagem;
	}
	public Cidade getCidade() {
		return cidade;
	}
	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}


}
