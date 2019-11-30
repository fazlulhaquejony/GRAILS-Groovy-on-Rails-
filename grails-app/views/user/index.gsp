<%--
  Created by IntelliJ IDEA.
  User: fazlu
  Date: 25-Jul-19
  Time: 4:36 PM
--%>


<meta name="layout" content="main">

<div class="card">
    <div class="card-header">
        <g:message code="user" args="['List']"/>

        <span class="float-right">
        <div class="btn-group">
            <g:form controller="user" action="index" method="GET">
                <div class="input-group" id="search-area">
                    <g:select name="colName" class="form-control" from="[firstName: 'First Name' , lastName:'Last Name', email: 'Email']" value="${params?.colName}" optionKey="key" optionValue="value" />
                    <g:textField name="colValue" class="from-control" value="${params?.colValue}" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Search</button>
                </span>
                </div>
            </g:form>
        </div>
        %{--create and reload--}%
        <div class="btn-group">
            <g:link controller="user" action="create" class="btn btn-success"><g:message code="create"/> </g:link>
            <g:link controller="user" action="index" class="btn btn-primary"><g:message code="reload"/></g:link>
        </div>
    </span>
    </div>


    <div class="card-body">
    <table class ="table table-bordered">
        <thead class="thead-blue">
        <tr>
         <g:sortableColumn  property="firstName lastname" title="${g.message(code: "first.name")}"/>
         %{--<g:sortableColumn property="lastName" title="${g.message(code: "last.name")}"/>--}%
         <g:sortableColumn property="email" title="${g.message(code: "email")}"/>
            <th class="action-row"><g:message code="action"/> </th>
        </tr>
        </thead>

        <tbody>
        <g:each in="${userList}" var="info">
            <tr>
            <td>${info?.firstName  + "  " + "  "+ info.lastName}</td>
           %{--<td>${info?.lastName}</td>--}%
            <td>${info?.email}</td>
                <td>
                    <div class="btn-group">
                        <g:link controller="user" action="details" class="btn btn-secondary" id="${info.id}"><i class="fas fa-eye"></i></g:link>
                        <g:link controller="user" action="edit" class="btn btn-secondary" id="${info.id}"><i class="fas fa-edit"></i></g:link>
                        <g:link controller="user" action="delete" id="${info.id}" class="btn btn-secondary delete-confirmation"><i class="fas fa-trash"></i></g:link>
                    </div>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
        <div class="pagination">
            <g:paginate total="${total ?: 0}" />
        </div>
</div>
</div>