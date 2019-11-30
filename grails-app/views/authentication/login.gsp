<%--
  Created by IntelliJ IDEA.
  User: fazlu
  Date: 08-Aug-19
  Time: 1:49 PM
--%>

<meta name ="layout" content ="public"/>

<div id="global-wrapper">
    <div id="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 mx-auto">
                    <img dir="images" file="aa.png" class ="profile-img"/>
                    <hi class="text-center login-title">Login Pannel </hi>
                    <div class="account-wall">
                        <g:form controller="authentication" action="dologin" class="form-signin">
                            <div>
                                <label id="text-center">Email Address</label>
                            <g:textField name="email" class="form-control"  required="required"/>
                            </div>

                            <div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<label id="text-center">Password</label>
                            <g:passwordField name="password" class="form-control" required="required"/>
                            </div>

                            <div>
                                    <g:submitButton name="Login" class="btn btn-primary" value="login"/>
                                    <g:submitButton name="Clear" class="btn btn-primary" value="clear"/>
                            </div>

                             <div>
                            <label>Are you new here?</label>
                            <g:link controller="authentication" action="registration" >Register Now</g:link>
                             </div>

                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>