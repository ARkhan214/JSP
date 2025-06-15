<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Employee"%>
<%@page import="dao.EmployeeDao"%>
<%@page import="java.util.*"%>

<%@include file="header.jsp"%>


<%
 List<Employee> list=EmployeeDao.getAllEmployees();
 request.setAttribute("list", list);

%>

<div class="container px-0 border border-danger rounded">



    <h1 class="text-warning text-center bg-danger">Employees Details</h1> 

    <table class="table table-striped">

        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Designation</th>
                <th>Salary</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="e">
                <tr>
                    <td>${e.getId()}</td>
                    <td>${e.getName()}</td>
                    <td>${e.getDesignation()}</td>                  
                    <td>${e.getSalary()}</td>                  
                    <td>
                      
                        <a href="editEmployeeform.jsp?id=${e.id}" class="btn btn-primary">Edit</a>

                        <a href="deleteEmployee.jsp?id=${e.id}" class="btn btn-danger" 
                           onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>

                    </td>

                </tr>

            </c:forEach>

        </tbody>
    </table>

</div>

<%@include file="footer.jsp" %>