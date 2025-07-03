<jsp:useBean class="model.Employee"  id="emp" />
<%@page  import="dao.EmployeeDao" %>
<jsp:setProperty  name="emp" property="*" />

<%
        
        int result=EmployeeDao.updateEmployee(emp);
        if(result > 0){
             response.sendRedirect("details.jsp");
    
            }
            else{
    response.sendRedirect("error.jsp");
    }


%>