package Util;
import java.sql.*;

public class DBUtil {
	
	
	public static Connection getConnection() {
	Connection conn = null;
	try {
	Class.forName("oracle.jdbc.driver.OracleDriver"); //�������ݿ�����
	System.out.println("���ݿ��������سɹ���");	//�������Ϣ
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";	//��ȡ����URL
	String user = "TEACHER"; //�����û���
	String password = "Lijing925"; //��������
	 conn = DriverManager.getConnection(url, user, password); //��ȡ���ݿ�����
	if (conn != null) {
	System.out.println("�ɹ�����Oracle���ݿ⽨�����ӣ���");
	}
	} catch (Exception e) {
	e.printStackTrace();
	} 
	return conn; //����Connectionʵ�� 
	}
	//�ر���Դ�ķ���
		public static void close(Connection connection ) {
			try {
				if (connection != null) {
					connection.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		public static void close(PreparedStatement preparedStatement ) {
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		public static void close(ResultSet resultSet ) {
			try {
				if (resultSet != null) {
					resultSet.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

}
