
<%@include file="header.jsp" %>
<div class="container my-3">
    <div class="bg-success text-center">
        <h1 class="jumborton">Add Employee</h1>
    </div>


    <!--    start form-->
    <form action="addEmployee.jsp" method="post">
        <div class="row">

            <div class="col-md-4">
                <label for="exampleInputEmail1" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Full Name">
            </div>


            <div class="col-md-4">
                <label for="exampleInputEmail1" class="form-label">Designation</label>
                <input type="text" class="form-control" id="designation" name="designation" placeholder="Md">
            </div> 

        </div>

        <div class="row">

            <div class="col-md-4">
                <label for="exampleInputEmail1" class="form-label">Salary</label>
                <input type="text" class="form-control" id="salary" name="salary" placeholder="20000">
            </div> 

        </div>

        <div class="row mt-3 text-center">
            <div class="col-md-2">
                <button type="submit" class="btn btn-success text-center" >Save</button>

            </div>
        
            <div class="col-md-1">
                <button type="reset" class="btn btn-danger text-center" >Reset</button>

            </div>
        </div>

    </form>
</div>
<%@include file="footer.jsp" %>
