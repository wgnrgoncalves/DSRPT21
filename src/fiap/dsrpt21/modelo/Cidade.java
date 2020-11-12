package fiap.dsrpt21.modelo;

public class Cidade {
	private int id_cidade;
	private String nm_cidade;
	private Pais pais;
	public int getId_cidade() {
		return id_cidade;
	}
	public void setId_cidade(int id_cidade) {
		this.id_cidade = id_cidade;
	}
	public String getNm_cidade() {
		return nm_cidade;
	}
	public void setNm_cidade(String nm_cidade) {
		this.nm_cidade = nm_cidade;
	}
	public Pais getPais() {
		return pais;
	}
	public void setPais(Pais pais) {
		this.pais = pais;
	}

}
