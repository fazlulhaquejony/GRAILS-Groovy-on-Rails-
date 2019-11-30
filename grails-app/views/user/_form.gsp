<div class="form-group">
    <label><g:message code="first.name"/>
    <span class="required-indicator">*</span>
    </label>
     <span class="required-indicator">
    <g:textField name="firstName" class = "form-control" value="${user?.firstName}" placeholder= "Please Enter First Name"/>
     </span>
    <UIHelper:renderErrorMessage fieldName="firstName" model="${user}" errorMessage="please.enter.name"/>
</div>

<div class="form-group">
    <label><g:message code="last.name"/> </label>
    <g:textField name="lastName" class = "form-control" value="${user?.lastName}" placeholder= "Please Enter last Name"/>
</div>

<div class="form-group">
    <label><g:message code="email.address"/>*</label>
    <g:textField type="email" name="email" class = "form-control" value="${user?.email}" placeholder= "Please Enter Email"/>
    <UIHelper:renderErrorMessage fieldName="email" model="${user}" errorMessage="Your Email Address is not valid or already exist"/>

</div>

<div class="form-group">
    <label><g:message code="birthdate"/>*</label>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <input type="text" name="date" class="date" readonly placeholder="DD/MM/YYYY" />
    <script>
        $(function() {
            $( ".date" ).datepicker({
                dateFormat : 'dd/mm/yy',
                showOn: "both",
                buttonImage: "b_calendar.png",
                buttonImageOnly: true,
                buttonText: "Select date",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0"
            });
        })
    </script>

</div>

<g:if test="${!edit}">
 <div class ="form-group">
     <label><g:message code="password"/>*</label>
     <g:passwordField name="password" class ="form-control" value="${user?.password}" placeholder = "please enter Password"/>
     <UIHelper:renderErrorMessage fieldName="password" model="${user}" errorMessage="Please enter valid password"/>
 </div>
</g:if>