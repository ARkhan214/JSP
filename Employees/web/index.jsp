<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Employee"%>
<%@page import="dao.EmployeeDao"%>
<%@page import="java.util.*"%>


<%@include file="header.jsp"%>
<h1>Hi Programmer</h1>
<h1>Hi Programmer</h1>
<h1>Hi Programmer</h1>
<h1>Hi Programmer</h1>
<h1>Hi Programmer</h1>
<h1>Hi Programmer</h1>
<h1>Hi Programmer</h1>
<h1>Hi Programmer</h1>

<%
 List<Employee> list=EmployeeDao.getAllEmployees();
 request.setAttribute("list", list);

%>

<div class="container">



    <h1 class="text-primary text-center">All Employee</h1> 

    <table class="table table-striped">

        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Designation</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="e">
                <tr>
                    <td>${e.getId()}</td>
                    <td>${e.getName()}</td>
                    <td>${e.getDesignation()}</td>                  
                    <td>
                        <button type="submit" class="btn btn-primary">Edit</button>
                        <button type="submit" class="btn btn-warning">Delete</button>
                    </td>

                </tr>

            </c:forEach>

        </tbody>
    </table>

</div>

<%@include file="footer.jsp" %>