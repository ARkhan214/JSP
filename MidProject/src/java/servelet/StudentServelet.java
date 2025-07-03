
package servelet;

import dao.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Student;

@WebServlet("/studentServlet")
public class StudentServelet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            Student stu = new Student();
            
            stu.setName(request.getParameter("name"));
            stu.setEmail(request.getParameter("email"));
             stu.setAddress(request.getParameter("address"));
            
            System.out.println("name "+ stu.getName());
            
          StudentDao.saveStudent(stu);
          
          response.sendRedirect("allStudent.jsp");
         
        }
        else if("update".equals(action)){
        
        Student stu = new Student();
            
            stu.setName(request.getParameter("name"));
            stu.setEmail(request.getParameter("email"));
             stu.setAddress(request.getParameter("address"));
            stu.setId(Integer.parseInt(request.getParameter("id")));
            
            System.out.println("name "+ stu.getName());
            
          StudentDao.updateStudent(stu);          
          response.sendRedirect("allStudent.jsp");
        }
        
        
        
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String action = request.getParameter("action");
         if ("delete".equals(action)) {
            StudentDao.deleteStudent(Integer.parseInt(request.getParameter("id")));
            response.sendRedirect("allStudent.jsp");
        }
         else if ("edit".equals(action)){
         
             Student s = StudentDao.getById(Integer.parseInt(request.getParameter("id")));
             request.setAttribute("stu", s);
             
             System.out.println(s);
             request.getRequestDispatcher("editStudent.jsp").forward(request, response);
             
         }
        
        
    }
    
    
    
}
