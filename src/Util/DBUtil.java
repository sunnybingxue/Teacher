package Util;
import java.sql.*;

public class DBUtil {
	
	
	public static Connection getConnection() {
	Connection conn = null;
	try {
	Class.forName("oracle.jdbc.driver.OracleDriver"); //加载数据库驱动
	System.out.println("数据库驱动加载成功！");	//输出的信息
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";	//获取连接URL
	String user = "TEACHER"; //连接用户名
	String password = "Lijing925"; //连接密码
	 conn = DriverManager.getConnection(url, user, password); //获取数据库连接
	if (conn != null) {
	System.out.println("成功的与Oracle数据库建立连接！！");
	}
	} catch (Exception e) {
	e.printStackTrace();
	} 
	return conn; //返回Connection实例 
	}
	//关闭资源的方法
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
