<#import "/spring.ftl" as spring/>
<html>
<head>
    <title>Edit User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" media="screen" href="/../styles.css">
    <script type="text/javascript" src="../utilities.js"></script>

</head>
<body>
<#include "navbar.ftl">
<h1 class="errorRed">${errorMessage!""}</h1>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form class="form-horizontal" action="/admin/users/editUser" method="POST" id="userForm" name="userForm">
                <h4>User's Personal Details</h4>
                <@spring.bind "userForm.userID" />
                <input type="hidden" id="userID" name="userID" value="${userForm.userID!""}">
                <!-- <@spring.bind "userForm.userID" /> -->
                <#--bind this field with the registration form fields-->
                <div class="form-group">
                    <@spring.bind "userForm.firstName" />
                    <label for="firstName">Firstname</label>
                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </span>
                        <input type="text" class="form-control" id="firstName" name="firstName" placeholder="john"
                               value="${userForm.firstName!""}">
                    </div>
                    <#list spring.status.errorMessages as error>
                        <span class="errorRed">${error}</span>
                    </#list>
                </div>
                <div class="form-group">
                    <@spring.bind "userForm.lastName"/>
                    <label for="lastName">Lastname</label>
                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-pencil"></i>
                                    </span>
                        <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Doe"
                               value="${userForm.lastName!""}"/>
                    </div>
                    <#list spring.status.errorMessages as error>
                        <span class="errorRed">${error}</span>
                    </#list>
                </div>
                <br><br>
                <div class="form-group">
                    <h4>User's Credentials</h4>
                    <@spring.bind "userForm.type"/>
                    <label for="type">Type</label>
                    <div class="input-group">
                                    <span class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                    </span>
                        <select id="type" name="type" class="form-control">
                            <option value="Admin">Admin</option>
                            <option value="Teacher">Teacher</option>
                            <option value="Student">Student</option>
                        </select>
                    </div>
                    <#list spring.status.errorMessages as error>
                        <span class="errorRed">${error}</span>
                    </#list>
                </div>
                <div class="form-group">
                    <@spring.bind "userForm.email"/>
                    <label for="email">Email</label>
                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-envelope"></i>
                                    </span>
                        <input type="text" class="form-control" name="email" id="email" placeholder="john@doe.com"
                               value="${userForm.email!""}"/>
                    </div>
                    <#list spring.status.errorMessages as error>
                        <span class="errorRed">${error}</span>
                    </#list>
                </div>
                <div class="form-group">
                    <@spring.bind "userForm.password"/>
                    <label for="password">Password</label>
                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-lock"></i>
                                    </span>
                        <input type="password" class="form-control" name="password" id="password" placeholder="p4$$w0rd"
                               value="${userForm.password!""}"/>
                    </div>
                    <#list spring.status.errorMessages as error>
                        <span class="errorRed">${error}</span>
                    </#list>
                </div>
                <button type="submit" class="btn btn-success">Save</button>
                <button type="reset" id="btn-clear" class="btn btn-danger">Clear</button>
            </form>
        </div>
    </div>
</div>
<#include  "footer.ftl">
</body>
</html>
