<%--
  Created by IntelliJ IDEA.
  User: fazlul
  Date: 01-Aug-19
  Time: 12:01 AM
--%>

%{--Main Layout included--}%
<meta name="layout" content="main"/>
<div class="card">
<div class="card-header">
<g:message code="user" args="['Details']"/>

</div>
    <div class="card-body">
        <g:if test="${user}">
            <table class="table">
                <tr>
                    <th class="text-right"><g:message code="first.name"/></th><td class="text-left">${user.firstName}</td>
                    </tr>
                <tr>
                    <th class="text-right"><g:message code="last.name"/></th><td class="text-left">${user.lastName}</td>
                </tr>

                <tr>
                    <th class="text-right"><g:message code="email"/></th><td class="text-left">${user.email}</td>
                </tr>

                <tr>
                    <th class="text-right"><g:message code="member.type"/></th><td class="text-left">${user.memberType}</td>
                </tr>
            </table>
        </g:if>

        <div class="form-action-panel">
            <g:link controller="user" action="index" class="btn btn-primary"><g:message code="cancel"/></g:link>

            <g:link controller="user" action="create" class="btn btn-primary"><g:message code="create"/></g:link>

            <g:link controller="user" action="edit" id="${user?.id}" class="btn btn-primary"><g:message code="update" /></g:link>

        </div>

</div>
</div>