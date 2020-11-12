package fiap.dsrpt21.modelo;

public class Imagem {
	private int id_imagem;
	private String nm_imagem;
	private  byte[] imagem;
	public int getId_imagem() {
		return id_imagem;
	}
	public void setId_imagem(int id_imagem) {
		this.id_imagem = id_imagem;
	}
	public String getNm_imagem() {
		return nm_imagem;
	}
	public void setNm_imagem(String nm_imagem) {
		this.nm_imagem = nm_imagem;
	}
	public byte[] getImagem() {
		return imagem;
	}
	public void setImagem(byte[] imagem) {
		this.imagem = imagem;
	}
	
	

}
