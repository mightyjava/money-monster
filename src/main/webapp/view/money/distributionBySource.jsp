<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="table table-bordered table-condensed table-hover table-striped">
	<thead>
		<tr>
			<th>Date</th>
			<th>Information</th>
			<th>Amount</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${distributionBySource.size() gt 0}">
				<c:forEach items="${distributionBySource}" var="detail">
					<tr>
						<td><fmt:formatDate type="date" value="${detail[1]}"/></td>
						<td>${detail[2]}</td>
						<td align="right" <c:if test="${detail[4]}">onclick="editForm('money', '${detail[0]}')"</c:if>><fmt:formatNumber type="number" minFractionDigits = "2" value="${detail[3]}" /></td>
    				</tr>
    			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">No Distribution by Source Available</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>
		<tr align="right">
			<td colspan="2"><b>Total : </b></td>
			<td><b><fmt:formatNumber type="number" minFractionDigits = "2" value="${distributionBySourceSum}" /></b></td>
		</tr>
		<tr>
			<c:if test="${distributionBySource.size() > 0 && totalElements > 12}">
				<td colspan="3">
					Showing ${number+1} to ${size} of ${totalElements}
					<ul class="pagination pull-right margin-7">
						<c:choose>
							<c:when test="${current == 1}">
								<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">First</a></li>
								<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Prev</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="javascript:void(0);" onclick="distributionBySource('${source.id}', '${source.name}', '1')" class="page-link">First</a></li>
								<li class="page-item"><a href="javascript:void(0);" onclick="distributionBySource('${source.id}', '${source.name}', '${current - 1}')" class="page-link">Prev</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${begin}" end="${end}" var="i">
							<c:choose>
								<c:when test="${i == current}">
									<li class="page-item active"><a href="javascript:void(0);" onclick="distributionBySource('${source.id}', '${source.name}', '${i}')" class="page-link">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a href="javascript:void(0);" onclick="distributionBySource('${source.id}', '${source.name}', '${i}')" class="page-link">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${current == totalPages}">
								<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Next</a></li>
								<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Last</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="javascript:void(0);" onclick="distributionBySource('${source.id}', '${source.name}', '${current + 1}')" class="page-link">Next</a></li>
								<li class="page-item"><a href="javascript:void(0);" onclick="distributionBySource('${source.id}', '${source.name}', '${totalPages}')" class="page-link">Last</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</td>
			</c:if>
		</tr>
	</tfoot>
</table>