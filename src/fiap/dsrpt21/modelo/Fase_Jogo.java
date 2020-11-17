package fiap.dsrpt21.modelo;

import java.time.LocalDateTime;

public class Fase_Jogo {
	private int id_fase_jogo;
	private LocalDateTime dt_inicio;
	private LocalDateTime dt_fim;
	private Jogo jogo;
	private Enigma fase;
	
	public int getId_fase_jogo() {
		return id_fase_jogo;
	}
	public void setId_fase_jogo(int id_fase_jogo) {
		this.id_fase_jogo = id_fase_jogo;
	}
	public LocalDateTime getDt_inicio() {
		return dt_inicio;
	}
	public void setDt_inicio(LocalDateTime dt_inicio) {
		this.dt_inicio = dt_inicio;
	}
	public LocalDateTime getDt_fim() {
		return dt_fim;
	}
	public void setDt_fim(LocalDateTime dt_fim) {
		this.dt_fim = dt_fim;
	}
	public Jogo getJogo() {
		return jogo;
	}
	public void setJogo(Jogo jogo) {
		this.jogo = jogo;
	}
	public Enigma getFase() {
		return fase;
	}
	public void setFase(Enigma fase) {
		this.fase = fase;
	}
	
	

}
