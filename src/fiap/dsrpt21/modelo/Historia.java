package fiap.dsrpt21.modelo;

import java.util.List;

public class Historia {
	private int id_historia;
	private String nm_historia;
	private String enredo;
	private Usuario criador;
	private List<Enigma> enigmas;
	private List<Imagem> imagens;
	public int getId_historia() {
		return id_historia;
	}
	public void setId_historia(int id_historia) {
		this.id_historia = id_historia;
	}
	public String getNm_historia() {
		return nm_historia;
	}
	public void setNm_historia(String nm_historia) {
		this.nm_historia = nm_historia;
	}
	public String getEnredo() {
		return enredo;
	}
	public void setEnredo(String enredo) {
		this.enredo = enredo;
	}
	public Usuario getCriador() {
		return criador;
	}
	public void setCriador(Usuario criador) {
		this.criador = criador;
	}
	public List<Enigma> getEnigmas() {
		return enigmas;
	}
	public void setEnigmas(List<Enigma> enigmas) {
		this.enigmas = enigmas;
	}
	public List<Imagem> getImagens() {
		return imagens;
	}
	public void setImagens(List<Imagem> imagens) {
		this.imagens = imagens;
	}
	

}
