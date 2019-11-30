<%--
  Created by IntelliJ IDEA.
  User: fazlu
  Date: 24-Jul-19
  Time: 11:32 PM
--%>

%{--- Include main Layout -----}%
<meta name="layout" content="main">

<div class="card">
     <div class ="card-header">
         <g:message code="user" args="['Create']"/>

     </div>
    <div class="card-body">
        <g:form controller="user" action="save">

            %{---[Partial templating]-----}%
            <g:render template= "form"/>
            <div class="form-action-panel">
                <g:submitButton  class="bnn btn-primary" name="save" value="${g.message(code: "save")}"/>
                <g:link controller="user" action="index" class =" btn btn-primary"><g:message code="cancel"/> </g:link>

            </div>
        </g:form>
    </div>
</div>