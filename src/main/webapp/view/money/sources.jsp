<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select class="form-control" name="sourceId" required="true">
	<option value="">---Select Source---</option>
	<c:forEach items="${sources}" var="source">
		<option value="${source.id}">${source.name}</option>
	</c:forEach>
</select>