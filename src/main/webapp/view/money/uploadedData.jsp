<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="card">
	<div class="card-header">
		Read Data for <strong style="text-transform: capitalize;">${modalFor}</strong>
	</div>
	<div class="card-body">
		<table class="table table-bordered table-condensed table-hover table-striped">
			<thead>
				<tr>
					<th>Type</th>
					<th>Name</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${sources.size() gt 0}">
						<c:forEach items="${sources}" var="source">
							<tr>
								<td>${source.type}</td>
								<td>${source.name}</td>
		    				</tr>
		    			</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3">No Source Available</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div class="card-footer text-right">
		<button class="btn btn-sm btn-primary"><i class="fa fa-save"></i> Insert</button>
	</div>
</div>