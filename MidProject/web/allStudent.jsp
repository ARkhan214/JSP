<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%@page import="java.util.*"%>

<%@include file="header.jsp"%>


<%
 List<Student> list=StudentDao.getAllStudent();
 request.setAttribute("list", list);

%>

<div class="container px-0 border border-danger rounded">



    <h1 class="text-warning text-center bg-danger">Student Details</h1> 

    <table class="table table-striped">

        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="e">
                <tr>
                    <td>${e.getId()}</td>
                    <td>${e.getName()}</td>
                    <td>${e.getEmail()}</td>                  
                     <td>${e.getAddress()}</td> 
                     <td>
                        <a href="studentServlet?action=edit&id=${e.id}" class="btn btn-sm btn-primary">Edit</a>
                        <a href="studentServlet?action=delete&id=${e.id}" class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this Student?');">Delete</a>
                    </td>

                </tr>

            </c:forEach>

        </tbody>
    </table>

</div>

<%@include file="footer.jsp" %>