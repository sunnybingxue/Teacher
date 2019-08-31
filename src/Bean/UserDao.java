package Bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import Model.Teacher;
import Model.User;
import java.sql.Statement;
import Util.DBUtil;
import java.util.ArrayList;
import java.util.List;
public class UserDao {
	public int add(User user){
		Connection connection=DBUtil.getConnection();
		String sql="select count(*) from T_USER where USERNAME=?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {	
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,user.getUsername());
			//接收结果集
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					return 1;
				}
			}

			sql = "insert into T_USER(USERNAME,PASSWORD) values (?,?)";
			System.out.println(user.getUsername() );
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,user.getUsername() );
			preparedStatement.setString(2,user.getPassword());
			System.out.println(user.getPassword());
			preparedStatement.executeUpdate();
			System.out.println("插入成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return 0;
	}
	 public User load1(String username) //查询数据
	    {
	        Connection connection = DBUtil.getConnection();
	        //准备sql语句
	        String sql = "select * from t_user  where username = ?";
	        //创建语句传输对象
	        PreparedStatement preparedStatement = null;
	        ResultSet resultSet = null;
	        User user = null;
	        try {
	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setString(1, username);//给第一个问号赋值为id
	            resultSet = preparedStatement.executeQuery();
	            while(resultSet.next()) {
	            	user = new User();
	            	
	            	user.setUsername(resultSet.getString("username"));
	            	user.setPassword(resultSet.getString("password"));
	            	
	            	System.out.println(user.getUsername());
	            }
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }finally {
	            DBUtil.close(resultSet);
	            DBUtil.close(preparedStatement);
	            DBUtil.close(connection);
	        }
	        return  user;
	    }
	 
	public boolean chongfu(String username){
		Connection connection=DBUtil.getConnection();
		String sql = "select count(*) from t_user where username = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					return false;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return true;
	}
	public boolean check(String username,String password){
		Connection connection=DBUtil.getConnection();
		String sql = "select password from t_user where username = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		boolean flag=true;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			System.out.println(password);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String password1=resultSet.getString("password");
				if(password.equals(password1)) {
					flag=true;
					return flag;
				}
				else
				{
				
				}
            }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return flag;
	}
	/*public void add(User user) {
		String sql = "insert into t_user(username,password) values('" + ""
				+ user.getUsername() + "','" 
				+ user.getPassword() + "')";
		System.out.println(new Date().toString() + "\t" + sql);
		Connection con = DBUtil.getConnection();
		Statement state = null;
		try {
			state = con.createStatement();
			state.execute(sql);
			System.out.println(new Date().toString() + "\t" + user.getUsername() + "保存成功！");
		} catch (Exception e) {
			System.out.println(new Date().toString() + "\t" + user.getUsername() + "保存失败！");
			e.printStackTrace();
		} finally {
			//DBUtil.close(state, con);
		}
	}*/

    public List<User> load2(String username,String password) //查询数据
    {
        Connection connection = DBUtil.getConnection();
        //准备sql语句
        String sql = "select * from t_user ";
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<User> users = new ArrayList<User>();
        User user = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //preparedStatement.setString(1, name);//给第一个问号赋值为id
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	user = new User();
            	user.setUsername(resultSet.getString("username"));
            	user.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
        return  users;
    }
    
	 public void update(User user)//修改数据
	    {
	        Connection connection=DBUtil.getConnection();
	        String sql="update t_user set password=? where username=?";
	        PreparedStatement preparedStatement = null;
	        try {
	            preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setString(1, user.getPassword());
	            System.out.println(user.getPassword());
	            preparedStatement.setString(2, user.getUsername());
	            preparedStatement.executeUpdate();
	            System.out.println("修改成功");
	        } catch (SQLException e) {
	            // TODO 自动生成的 catch 块
	            e.printStackTrace();
	        }finally{
	            DBUtil.close(preparedStatement);
	            DBUtil.close(connection);
	        }  
	    }
}
