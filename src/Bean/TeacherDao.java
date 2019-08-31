package Bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Model.Teacher;
import Model.User;
import Util.DBUtil;
import Util.UserException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class TeacherDao {
   /* public int add(Teacher teacher){
		Connection connection=DBUtil.getConnection();
		System.out.println("lalala");
		String sql="select count(*) from t_teacher where id=?";
		System.out.println("lalalalalala");
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {	
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,teacher.getId());
			//接收结果集
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					return 1;
				}
			}
			System.out.println("lalalaqian");
			sql = "insert into t_teacher (id,name,number,address,phone,department,wages,time,major,duty,birth) values (?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println("lalalahouh");
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,teacher.getId() );
			preparedStatement.setString(2,teacher.getName() );
			preparedStatement.setString(3,teacher.getNumber() );
			preparedStatement.setString(4,teacher.getAddress());

			preparedStatement.setString(5,teacher.getPhone() );
			preparedStatement.setString(6,teacher.getDepartment());
			preparedStatement.setDouble(7, teacher.getWages());
			preparedStatement.setString(8,teacher.getTime());
			preparedStatement.setString(9, teacher.getMajor());
			preparedStatement.setString(10, teacher.getDuty());
			preparedStatement.setString(11, teacher.getBirth());
			System.out.println("lala时代大厦供电所覆盖不舍得lahouh");
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
		
	}*/
	public int add(Teacher teacher){
		Connection connection=DBUtil.getConnection();
		String sql="select count(*) from T_TEACHER where ID=?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {	
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,teacher.getId());
			//接收结果集
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					return 1;
				}
			}

			sql = "insert into T_TEACHER(ID,NAME,NUM,ADDRESS,PHONE,DEPARTMENT,WAGES,TIME,MAJOR,DUTY,BIRTH) values (?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println(teacher.getId() );
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,teacher.getId() );
			preparedStatement.setString(2,teacher.getName());
			preparedStatement.setString(3,teacher.getNum() );
			preparedStatement.setString(4,teacher.getAddress());

			preparedStatement.setString(5,teacher.getPhone() );
			preparedStatement.setString(6,teacher.getDepartment());
			preparedStatement.setDouble(7, teacher.getWages());
			preparedStatement.setString(8,teacher.getTime());
			preparedStatement.setString(9, teacher.getMajor());
			preparedStatement.setString(10, teacher.getDuty());
			preparedStatement.setString(11, teacher.getBirth());
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

public void update(Teacher teacher)//修改数据
    {
        Connection connection=DBUtil.getConnection();
        String sql="update t_teacher set address=?,phone=?,department=?,wages=?,major=?,duty=? where id=?";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, teacher.getAddress());
            System.out.println(teacher.getAddress());
            preparedStatement.setString(2, teacher.getPhone());
            System.out.println(teacher.getPhone());
            preparedStatement.setString(3, teacher.getDepartment());
            preparedStatement.setDouble(4, teacher.getWages());
            System.out.println(teacher.getWages());
            preparedStatement.setString(5, teacher.getMajor());
            preparedStatement.setString(6, teacher.getDuty());
            System.out.println(teacher.getDuty());
            preparedStatement.setString(7, teacher.getId());
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
    public Teacher load1(String id) //查询数据
    {
        Connection connection = DBUtil.getConnection();
        //准备sql语句
        String sql = "select * from t_teacher  where id = ?";
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Teacher teacher = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);//给第一个问号赋值为id
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	teacher = new Teacher();
            	teacher.setId(id);
            	teacher.setName(resultSet.getString("name"));
            	//teacher.setPassword(resultSet.getString("password"));
            	teacher.setNum(resultSet.getString("num"));
            	teacher.setAddress(resultSet.getString("address"));
            	teacher.setPhone(resultSet.getString("phone"));
            	teacher.setDepartment(resultSet.getString("department"));
            	teacher.setWages(resultSet.getDouble("wages"));
            	teacher.setTime(resultSet.getString("time"));
            	teacher.setMajor(resultSet.getString("major"));
            	teacher.setDuty(resultSet.getString("duty"));
            	teacher.setBirth(resultSet.getString("birth"));
            	System.out.println(teacher.getId());
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
        return  teacher;
    }
    public List<Teacher> load2() //查询数据
    {
        Connection connection = DBUtil.getConnection();
        //准备sql语句
        String sql = "select * from t_teacher ";
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Teacher> teachers = new ArrayList<Teacher>();
        Teacher teacher = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            //preparedStatement.setString(1, name);//给第一个问号赋值为id
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	teacher = new Teacher();
            	teacher.setId(resultSet.getString("id"));
            	teacher.setName(resultSet.getString("name"));
            	//teacher.setPassword(resultSet.getString("password"));
            	teacher.setNum(resultSet.getString("num"));
            	teacher.setAddress(resultSet.getString("address"));
            	teacher.setPhone(resultSet.getString("phone"));
            	teacher.setDepartment(resultSet.getString("department"));
            	teacher.setWages(resultSet.getDouble("wages"));
            	teacher.setTime(resultSet.getString("time"));
            	teacher.setMajor(resultSet.getString("major"));
            	teacher.setDuty(resultSet.getString("duty"));
            	teacher.setBirth(resultSet.getString("birth"));
            	teachers.add(teacher);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
        return  teachers;
    }
    public List<Teacher> load3(Double wages1,Double wages2) //查询数据
    {
        Connection connection = DBUtil.getConnection();
        //准备sql语句
        String sql = "select * from t_teacher  where wages1 >= ? and wages wages2 <=?";
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Teacher> teachers = new ArrayList<Teacher>();
        Teacher teacher = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setDouble(1, wages1);//给第一个问号赋值为id
            preparedStatement.setDouble(2, wages2);//给第一个问号赋值为id
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	teacher = new Teacher();
            	teacher.setId(resultSet.getString("id"));
            	teacher.setName(resultSet.getString("name"));
            	//teacher.setPassword(resultSet.getString("password"));
            	teacher.setNum(resultSet.getString("num"));
            	teacher.setAddress(resultSet.getString("address"));
            	teacher.setPhone(resultSet.getString("phone"));
            	teacher.setDepartment(resultSet.getString("department"));
            	teacher.setWages(resultSet.getDouble("wages"));
            	teacher.setTime(resultSet.getString("time"));
            	teacher.setMajor(resultSet.getString("major"));
            	teacher.setDuty(resultSet.getString("duty"));
            	teacher.setBirth(resultSet.getString("birth"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
        return  teachers;
    }
    public List<Teacher> load4(int year1,int month1,int year2,int month2) //查询数据
    {
        Connection connection = DBUtil.getConnection();
        //准备sql语句
        String sql = "select distinct birth from t_teacher";
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Teacher> teachers = new ArrayList<Teacher>();
        Teacher teacher = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	teacher = new Teacher();
            	String[] strarray=resultSet.getString("birth").split("-");
            	int[] birth1=null;
            	for(int i=0;i<=strarray.length;i++)
            	{
            		birth1[i]=Integer.parseInt(strarray[i]);
            	}
            	if((birth1[0]>year1&&birth1[0]<year2)||(birth1[0]==year1&&birth1[0]<=year2)&&(birth1[1]>=month1&&birth1[1]<=month2)||(birth1[0]>=year1&&birth1[0]==year2)&&(birth1[1]>=month1&&birth1[1]<=month2))
            	{
            		sql = "select *  from t_teacher where  where birth=?";
            		preparedStatement = connection.prepareStatement(sql);
            		preparedStatement.setString(1, resultSet.getString("birth"));
                    ResultSet resultSet1 = preparedStatement.executeQuery();
                    teacher.setId(resultSet1.getString("id"));
                	teacher.setName(resultSet1.getString("name"));
                	//teacher.setPassword(resultSet1.getString("password"));
                	teacher.setNum(resultSet1.getString("num"));
                	teacher.setAddress(resultSet1.getString("address"));
                	teacher.setPhone(resultSet1.getString("phone"));
                	teacher.setDepartment(resultSet1.getString("department"));
                	teacher.setWages(resultSet1.getDouble("wages"));
                	teacher.setTime(resultSet1.getString("time"));
                	teacher.setMajor(resultSet1.getString("major"));
                	teacher.setDuty(resultSet1.getString("duty"));
                	teacher.setBirth(resultSet1.getString("birth"));
            	}
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
        return  teachers;
    }
    public List<Teacher> load5(int year1,int month1,int year2,int month2) //查询数据
    {
        Connection connection = DBUtil.getConnection();
        //准备sql语句
        String sql = "select distinct time from t_teacher";
        //创建语句传输对象
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Teacher> teachers = new ArrayList<Teacher>();
        Teacher teacher = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
            	teacher = new Teacher();
            	String[] strarray=resultSet.getString("time").split("-");
            	int[] birth1=null;
            	for(int i=0;i<=strarray.length;i++)
            	{
            		birth1[i]=Integer.parseInt(strarray[i]);
            	}
            	if((birth1[0]>year1&&birth1[0]<year2)||(birth1[0]==year1&&birth1[0]<=year2)&&(birth1[1]>=month1&&birth1[1]<=month2)||(birth1[0]>=year1&&birth1[0]==year2)&&(birth1[1]>=month1&&birth1[1]<=month2))
            	{
            		sql = "select *  from t_teacher where  where time=?";
            		preparedStatement = connection.prepareStatement(sql);
            		preparedStatement.setString(1, resultSet.getString("time"));
                    ResultSet resultSet1 = preparedStatement.executeQuery();
                    teacher.setId(resultSet1.getString("id"));
                	teacher.setName(resultSet1.getString("name"));
                	//teacher.setPassword(resultSet1.getString("password"));
                	teacher.setNum(resultSet1.getString("num"));
                	teacher.setAddress(resultSet1.getString("address"));
                	teacher.setPhone(resultSet1.getString("phone"));
                	teacher.setDepartment(resultSet1.getString("department"));
                	teacher.setWages(resultSet1.getDouble("wages"));
                	teacher.setTime(resultSet1.getString("time"));
                	teacher.setMajor(resultSet1.getString("major"));
                	teacher.setDuty(resultSet1.getString("duty"));
                	teacher.setBirth(resultSet1.getString("birth"));
            	}
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            DBUtil.close(resultSet);
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
        return  teachers;
    }
    public List<Teacher> loadzonghe(String[] sqls){
		Connection connection = DBUtil.getConnection();
		String sql="";
		for(int i=0;i<sqls.length;i++){
			sql+=sqls[i];	
		}
		//System.out.println(sql);
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int i=1;
		List<Teacher> teachers = new ArrayList<Teacher>();
		Teacher teacher = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			try{
			resultSet = preparedStatement.executeQuery();
			}catch (Exception e) {
				// TODO: handle exception
				throw new UserException("cuowu ") ;
			}
			while(resultSet.next()) {
				teacher = new Teacher();
				teacher.setId(resultSet.getString("id"));
				teacher.setName(resultSet.getString("name"));
				teacher.setNum(resultSet.getString("num"));
				teacher.setAddress(resultSet.getString("address"));
				teacher.setPhone(resultSet.getString("phone"));
				teacher.setDepartment(resultSet.getString("department"));
				teacher.setWages(resultSet.getDouble("wages"));
				teacher.setTime(resultSet.getString("time"));
				teacher.setMajor(resultSet.getString("major"));
				teacher.setDuty(resultSet.getString("duty"));
				teacher.setBirth(resultSet.getString("birth"));
				
				teachers.add(teacher);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  teachers;
	}
	
    public void delete(String id)//删除数据
    {
        Connection connection=DBUtil.getConnection();
        String sql="delete from t_teacher where id=?";
        System.out.println("删除成功shzgxd");
        PreparedStatement preparedStatement=null;
        try {
            preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,id);
            preparedStatement.executeQuery();
            System.out.println("删除成功");
        } catch (SQLException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }finally {
            DBUtil.close(preparedStatement);
            DBUtil.close(connection);
        }
        
    }
}