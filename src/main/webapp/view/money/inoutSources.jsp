<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="container col-md-12">
	<div class="card">
		<div class="card-header">
			<strong>
				<i class="fa fa-th-list"></i> Source Details
			</strong>
			<div class="btn-group pull-right">
				<a href="javascript:void(0);" class="btn btn-outline-secondary btn-sm" onclick="addForm('money/inoutSources')" title="Add New Source">
					<i class="fa fa-plus-circle"></i>
				</a>
				<a href="javascript:uploadModal('source');" class="btn btn-outline-secondary btn-sm" title="Upload New Source">
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
						<th>Status</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${sources.size() > 0}">
							<c:forEach items="${sources}" var="source">
								<tr 
									<c:choose>
										<c:when test="${source.activeStatus}">style="color: green"</c:when>
										<c:otherwise>style="color: red; font-weight:bold;"</c:otherwise></c:choose>>
									<td>
										<c:choose>
											<c:when test="${source.type == 'R'}">Revenue</c:when>
											<c:otherwise>Expenditure</c:otherwise>
										</c:choose>
									</td>
									<td>${source.name}</td>
									<td>
										<c:choose>
											<c:when test="${source.activeStatus}">
												Active
											</c:when>
											<c:otherwise>
												InActive
											</c:otherwise>
										</c:choose>
									</td>
									<td><a href="javascript:void(0);" onclick="editForm('money/inoutSources', '${source.id}')"><i class="fa fa-pencil fa-lg"></i></a></td>
									<td><a href="javascript:void(0);" onclick="deleteData('money/inoutSources', '${source.id}')"><i class="fa fa-trash fa-lg"></i></a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr align="center">
								<td colspan="7">No Sources available</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<c:if test="${sources.size() > 0}">
			<div class="card-footer">
				Showing ${number+1} to ${size} of ${totalElements}
				<ul class="pagination pull-right margin-7">
					<c:choose>
						<c:when test="${current == 1}">
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">First</a></li>
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Prev</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money/inoutSources', '1')" class="page-link">First</a></li>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money/inoutSources', '${current - 1}')" class="page-link">Prev</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<c:choose>
							<c:when test="${i == current}">
								<li class="page-item active"><a href="javascript:void(0);" onclick="list('money/inoutSources', '${i}')" class="page-link">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="javascript:void(0);" onclick="list('money/inoutSources', '${i}')" class="page-link">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${current == totalPages}">
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Next</a></li>
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Last</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money/inoutSources', '${current + 1}')" class="page-link">Next</a></li>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('money/inoutSources', '${totalPages}')" class="page-link">Last</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</c:if>
	</div>
</div>