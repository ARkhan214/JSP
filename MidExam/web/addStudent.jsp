
<%@include file="header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<div class="container my-3">
    <div class="bg-success text-center">
       
        <h1 class="jumborton"><i class="fa-solid fa-graduation-cap"></i> Add Stusent</h1>
    </div>
    <!--    start form-->
    <form action="studentServlet"  method="post">
        <input type="hidden" name="action" value="add">
        
        <div class="row">
            <div class="col-md-6">
                <label for="exampleInputEmail1" class="form-label">Name</label>
                <input type="text" class="form-control"  name="name" placeholder="Full Name">
            </div>

            <div class="col-md-6">
                <label for="exampleInputEmail1" class="form-label">Fee</label>
                <input type="text" class="form-control"  name="fee" placeholder="000000">
            </div>        
        </div>
        

        <div class="row mt-3 text-center">
            <div class="col-md-6">
                <button type="submit" class="btn btn-success text-center" >Save</button>

            </div>

            <div class="col-md-6">
                <button type="reset" class="btn btn-danger text-center" >Reset</button>

            </div>
        </div>
    </form>

    <!--end form    -->
</div>


<%@include file="footer.jsp" %>
