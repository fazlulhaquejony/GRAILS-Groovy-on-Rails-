<%--
  Created by IntelliJ IDEA.
  User: fazlu
  Date: 10-Aug-19
  Time: 12:25 AM
--%>

<g:each in="${contactDetails}" var="details">
    <g:render template="form" model="[details: details]"/>
</g:each>
<g:render template="form"/>
</html>