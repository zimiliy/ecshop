package utils;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DH {

	public static final String connstr = "com.mysql.jdbc.Driver";
	public static final String dr = "jdbc:mysql://localhost:3306/augmentum?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	public static final String uid = "root";
	public static final String pwd = "";

	/**
	 * 查询全部
	 * 
	 * @param sql
	 * @param o:查询对象
	 * @param args:参数为String类型的数组，按照参数占位符的顺序赋值
	 * @return
	 */
	public static List getall(String sql, Object o, Object[] args) {
		List li = new ArrayList();
		Connection conn = null;
		DbUtils.loadDriver(DH.connstr);
		try {
			conn = DriverManager.getConnection(DH.dr, DH.uid, DH.pwd);
			QueryRunner qr = new QueryRunner();
			li = (List) qr.query(conn, sql, args, new BeanListHandler(o.getClass()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DbUtils.closeQuietly(conn);

		}

		return li;
	}

    /**
     * 查询总条数
     * @param sql
     * @param category
     * @return
     */
	public static int getTotal(String sql,String category){
        int count=0;
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(DH.dr, DH.uid, DH.pwd);
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1,category);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                count++;
            }
        } catch (Exception e) {

            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);

        }
        return count;
    }



	/**
	 * 增删改数据
	 * 
	 * @param sql
	 * @param args
	 * @return
	 */

	public static int update(String sql, String[] args) {
		int num = 0;
		Connection conn = null;
		DbUtils.loadDriver(DH.connstr);
		try {
			conn = DriverManager.getConnection(DH.dr, DH.uid, DH.pwd);
			QueryRunner qr = new QueryRunner();
			num = qr.update(conn, sql, args);
			// System.out.println(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			DbUtils.closeQuietly(conn);

		}
		return num;
	}

	public static Connection getconn() {
		Connection conn = null;
		try {
			Class.forName(DH.connstr);
			conn = DriverManager.getConnection(DH.dr, DH.uid, DH.pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeall(Statement st, Connection conn) {
		try {
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void closeall(ResultSet rs, Statement st, Connection conn) {
		try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
