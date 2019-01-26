<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="container col-md-12">
	<div class="card">
		<div class="card-header">
			<strong>
				<i class="fa fa-th-list"></i> Money Details
			</strong>
			(<b>Revenue : </b><fmt:formatNumber type="number" minFractionDigits = "2" value="${revenue}"/> | 
			<b>Expenditure : </b><fmt:formatNumber type="number" minFractionDigits = "2" value="${expenditure}"/> | 
			<b>Under Observation : </b><fmt:formatNumber type="number" minFractionDigits = "2" value="${revenue - expenditure}"/>)
			<div class="btn-group pull-right">
				<a href="javascript:void(0);" class="btn btn-outline-secondary btn-sm" onclick="addForm('money')" title="Add New Details">
					<i class="fa fa-plus-circle"></i>
				</a>
				<a href="javascript:uploadModal('money');" class="btn btn-outline-secondary btn-sm" title="Upload New Money">
					<i class="fa fa-upload"></i>
				</a>
			</div>
		</div>
		<div class="card-body">
			<table class="table table-bordered table-condensed table-hover table-striped">
				<thead>
					<tr>
						<th>Type</th>
						<th>Source</th>
						<th>More Information</th>
						<th>Date</th>
						<th>Amount</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${moneyDetails.size() > 0}">
							<c:forEach items="${moneyDetails}" var="money">
								<tr>
									<td>
										<c:choose>
											<c:when test="${money.source.type == 'R'}">Revenue</c:when>
											<c:otherwise>Expenditure</c:otherwise>
										</c:choose>
									</td>
									<td>${money.source.name}</td>
									<td>${money.moreInformation}</td>
									<td><fmt:formatDate type="date" value="${money.date}" /> </td>
									<td><fmt:formatNumber type="number" minFractionDigits = "2" value="${money.amount}" /></td>
									<td>
										<c:if test="${money.source.activeStatus}">
											<a href="javascript:void(0);" onclick="editForm('money', '${money.id}')"><i class="fa fa-pencil fa-lg"></i></a>
										</c:if>
									</td>
									<td><a href="javascript:void(0);" onclick="deleteData('money', '${money.id}')"><i class="fa fa-trash fa-lg"></i></a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr align="center">
								<td colspan="7">No Details available</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<c:if test="${moneyDetails.size() > 0}">
			<div class="card-footer">
				Showing ${number+1} to ${size} of ${totalElements}
				<ul class="pagination pull-right margin-7">
					<c:choose>
						<c:when test="${current == 1}">
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">First</a></li>
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Prev</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money', '1')" class="page-link">First</a></li>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money', '${current - 1}')" class="page-link">Prev</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<c:choose>
							<c:when test="${i == current}">
								<li class="page-item active"><a href="javascript:void(0);" onclick="list('money', '${i}')" class="page-link">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="javascript:void(0);" onclick="list('money', '${i}')" class="page-link">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${current == totalPages}">
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Next</a></li>
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Last</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money', '${current + 1}')" class="page-link">Next</a></li>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money', '${totalPages}')" class="page-link">Last</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</c:if>
	</div>
</div>