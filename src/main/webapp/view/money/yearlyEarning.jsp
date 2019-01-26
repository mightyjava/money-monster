<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="table table-bordered table-condensed table-hover table-striped">
	<thead>
		<tr>
			<th>Source</th>
			<th>Amount</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${yearlyEarning.size() gt 0}">
				<c:forEach items="${yearlyEarning}" var="money">
						<tr>
							<td>${money[0]}</td>
							<td align="right"><fmt:formatNumber type="number" minFractionDigits = "2" value="${money[1]}" /></td>
    				</tr>
    			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="2">No Year wise Earning Available</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
