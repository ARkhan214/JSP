<%@ page import="model.Student" %>
<%@include file="header.jsp" %>

<%
    Student s = (Student) request.getAttribute("stu");
%>

<div class="container my-3">
    <div class="bg-info text-white text-center p-2 rounded">
        <h2>Edit Student</h2>
    </div>

    <form action="studentServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= s.getId() %>">

        <div class="row mt-3">
            <div class="col-md-6">
                <label class="form-label">Name</label>
                <input type="text" class="form-control" name="name" value="<%= s.getName() %>" required>
            </div>

            <div class="col-md-6">
                <label class="form-label">Email</label>
                <input type="text" class="form-control" name="email" value="<%= s.getEmail() %>" required>
            </div>
            
            <div class="col-md-6">
                <label class="form-label">Address</label>
                <input type="text" class="form-control" name="address" value="<%= s.getAddress() %>" required>
            </div>
        </div>

        

        <div class="row mt-4 text-center">
            <div class="col-md-6">
                <button type="submit" class="btn btn-success w-100">Update</button>
            </div>
            <div class="col-md-6">
                <a href="allStudent.jsp" class="btn btn-secondary w-100">Cancel</a>
            </div>
        </div>
    </form>
</div>

<%@include file="footer.jsp" %>