package fiap.dsrpt21.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConectionFactory {

	public Connection getConexao() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String jdbc = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl";
		return DriverManager.getConnection(jdbc, "RM82413", "020901");
	}
}
