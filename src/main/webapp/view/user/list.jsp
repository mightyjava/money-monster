<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="container col-md-12">
	<div class="card">
		<div class="card-header">
			<strong>
				<i class="fa fa-th-list"></i> User Details
			</strong>
			<div class="btn-group pull-right">
				<a href="javascript:void(0);" class="btn btn-outline-secondary btn-sm" onclick="addForm('user')" title="Add New User">
					<i class="fa fa-plus-circle fa-lg"></i> User
				</a>
			</div>
		</div>
		<div class="card-body">
			<table class="table table-bordered table-condensed table-hover table-striped">
				<thead>
					<tr>
						<th>Full Name</th>
						<th>User Id</th>
						<th>User Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Role</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${users.size() > 0}">
							<c:forEach items="${users}" var="user">
								<tr>
									<td>${user.fullName}</td>
									<td>${user.userId}</td>
									<td>${user.userName}</td>
									<td>${user.email}</td>
									<td>${user.mobile}</td>
									<td>${user.role.name}</td>
									<td><a href="javascript:void(0);" onclick="editForm('user', '${user.id}')"><i class="fa fa-pencil fa-lg"></i></a></td>
									<td><a href="javascript:void(0);" onclick="deleteData('user', '${user.id}')"><i class="fa fa-trash fa-lg"></i></a></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr align="center">
								<td colspan="8">No Users available</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<c:if test="${users.size() > 0}">
			<div class="card-footer">
				Showing ${number+1} to ${size} of ${totalElements}
				<ul class="pagination pull-right margin-7">
					<c:choose>
						<c:when test="${current == 1}">
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">First</a></li>
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Prev</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('user', '1')" class="page-link">First</a></li>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('user', '${current - 1}')" class="page-link">Prev</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${begin}" end="${end}" var="i">
						<c:choose>
							<c:when test="${i == current}">
								<li class="page-item active"><a href="javascript:void(0);" onclick="list('user', '${i}')" class="page-link">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a href="javascript:void(0);" onclick="list('user', '${i}')" class="page-link">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${current == totalPages}">
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Next</a></li>
							<li class="page-item disabled"><a href="javascript:void(0);" class="page-link">Last</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('user', '${current + 1}')" class="page-link">Next</a></li>
							<li class="page-item"><a href="javascript:void(0);" onclick="list('user', '${totalPages}')" class="page-link">Last</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</c:if>
	</div>
</div>