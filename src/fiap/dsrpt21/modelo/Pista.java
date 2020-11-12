package fiap.dsrpt21.modelo;

import java.util.List;

public class Pista {
	private int id_pista;
	private String nm_pista;
	private String desc_pista;
	private int agrupamento;
	private Local local_inicio;
	private Local local_destino;
	private List<Imagem> imagens;
	public int getId_pista() {
		return id_pista;
	}
	public void setId_pista(int id_pista) {
		this.id_pista = id_pista;
	}
	public String getNm_pista() {
		return nm_pista;
	}
	public void setNm_pista(String nm_pista) {
		this.nm_pista = nm_pista;
	}
	public String getDesc_pista() {
		return desc_pista;
	}
	public void setDesc_pista(String desc_pista) {
		this.desc_pista = desc_pista;
	}
	public int getAgrupamento() {
		return agrupamento;
	}
	public void setAgrupamento(int agrupamento) {
		this.agrupamento = agrupamento;
	}
	public Local getLocal_inicio() {
		return local_inicio;
	}
	public void setLocal_inicio(Local local_inicio) {
		this.local_inicio = local_inicio;
	}
	public Local getLocal_destino() {
		return local_destino;
	}
	public void setLocal_destino(Local local_destino) {
		this.local_destino = local_destino;
	}
	public List<Imagem> getImagens() {
		return imagens;
	}
	public void setImagens(List<Imagem> imagens) {
		this.imagens = imagens;
	}
	
	
	
	
	
	

}
