package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import util.DbUtil;


public class EmployeeDao {

    static PreparedStatement ps;
    static ResultSet rs;
    static String sql;

    public static List<Employee> getAllEmployees() {
        List<Employee> employee = new ArrayList<>();
        sql = "select * from employee";

        try {
            ps = DbUtil.getCon().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                Employee e = new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("designation"),
                        rs.getFloat("salary")
                );

                employee.add(e);

            }
            rs.close();
            ps.close();
            DbUtil.getCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return employee;
    }

    public static int saveAllEmployees(Employee e){
      
    int status = 0 ;
    
    sql="insert into employee(name,designation,salary) values(?,?,?)";
        try {
            ps=DbUtil.getCon().prepareStatement(sql);
            ps.setString(1, e.getName());
            ps.setString(2, e.getDesignation());
            ps.setFloat(3, e.getSalary());
            
            
            status= ps.executeUpdate();
            
            System.out.println(status);
            
            ps.close();
            DbUtil.getCon().close();
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    return status;
    }
    public static void deleteEmployee(int id){
    sql="delete from employee where id =?";
        try {
            ps=DbUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            
            ps.executeUpdate();
            
            ps.close();
            DbUtil.getCon().close();
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    
    }
    
    public static Employee getById(int id){
        Employee em=null;
        
    sql="select * from employee where id=?";
    
        try {
            ps = DbUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            
            rs=ps.executeQuery();
            
            while (rs.next()) {                
                em =new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("designation"),
                        rs.getFloat("salary")
                );
            }
            rs.close();
            ps.close();
            DbUtil.getCon().close();
            
            
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    return em;
    }
    
    public static int updateEmployee(Employee e){
        int status = 0;
    sql="update employee set name=?,designation=?,salary=? where id =?";
    
        try {
            ps=DbUtil.getCon().prepareStatement(sql);
            ps.setString(1, e.getName());
            ps.setString(2, e.getDesignation());
            ps.setFloat(3, e.getSalary());
            ps.setInt(4, e.getId());
            
            status = ps.executeUpdate();

            System.out.println(status);

            ps.close();
            DbUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }
    
    
    
}
