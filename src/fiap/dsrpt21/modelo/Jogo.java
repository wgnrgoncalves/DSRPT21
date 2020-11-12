package fiap.dsrpt21.modelo;

import java.time.LocalDateTime;

public class Jogo {
	private int id_jogo;
	private Usuario jogador;
	private Historia historia;
	private LocalDateTime dt_inicio;
	private LocalDateTime dt_fim;
	public int getId_jogo() {
		return id_jogo;
	}
	public void setId_jogo(int id_jogo) {
		this.id_jogo = id_jogo;
	}
	public Usuario getJogador() {
		return jogador;
	}
	public void setJogador(Usuario jogador) {
		this.jogador = jogador;
	}
	public Historia getHistoria() {
		return historia;
	}
	public void setHistoria(Historia historia) {
		this.historia = historia;
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
	

}
