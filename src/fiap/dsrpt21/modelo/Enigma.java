package fiap.dsrpt21.modelo;

import java.util.List;

public class Enigma {
	private int id_enigma;
	private String nm_enigima;
	private String descricao;
	private int ordem;
	private Enigma anterior;
	private Enigma proximo;
	private List<Pista> pistas;
	private Solucao solucao;
	private Dificuldade dificuldade;
	private List<Imagem> imagens;
	public int getId_enigma() {
		return id_enigma;
	}
	public void setId_enigma(int id_enigma) {
		this.id_enigma = id_enigma;
	}
	public String getNm_enigima() {
		return nm_enigima;
	}
	public void setNm_enigima(String nm_enigima) {
		this.nm_enigima = nm_enigima;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getOrdem() {
		return ordem;
	}
	public void setOrdem(int ordem) {
		this.ordem = ordem;
	}
	public Enigma getAnterior() {
		return anterior;
	}
	public void setAnterior(Enigma anterior) {
		this.anterior = anterior;
	}
	public Enigma getProximo() {
		return proximo;
	}
	public void setProximo(Enigma proximo) {
		this.proximo = proximo;
	}
	public List<Pista> getPistas() {
		return pistas;
	}
	public void setPistas(List<Pista> pistas) {
		this.pistas = pistas;
	}
	public Solucao getSolucao() {
		return solucao;
	}
	public void setSolucao(Solucao solucao) {
		this.solucao = solucao;
	}
	public Dificuldade getDificuldade() {
		return dificuldade;
	}
	public void setDificuldade(Dificuldade dificuldade) {
		this.dificuldade = dificuldade;
	}
	public List<Imagem> getImagens() {
		return imagens;
	}
	public void setImagens(List<Imagem> imagens) {
		this.imagens = imagens;
	}
	

}
