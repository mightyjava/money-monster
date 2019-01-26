<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<div class="container col-lg-8">
	<div class="card">
		<div class="card-header">
			<strong>
				<c:choose>
					<c:when test="${isNew}"><i class="fa fa-plus-circle fa-lg"></i></c:when>
					<c:otherwise><i class="fa fa-pencil fa-lg"></i></c:otherwise>
				</c:choose> Source
			</strong>
		</div>
		<form:form method="post" class="form-horizontal" action="${path}/money/inoutSources/add" commandName="inoutSourcesForm" id="submitInoutSourcesForm">
			<form:hidden path="id"/>
			<div class="card-body">
				<div class="row">
					<label class="col-md-2 control-label">Type : </label>
					<div class="col-md-4 mb-3">
						<select class="form-control" name="type" required="true">
							<option value="">---Select Income Type---</option>
							<c:forEach items="${incomeTypes}" var="incomeType">
								<c:choose>
									<c:when test="${isNew}">
										<option value="${incomeType.key}">${incomeType.value}</option>
									</c:when>
									<c:otherwise>
			      						<c:choose>
											<c:when test="${fn:contains(incomeType.key, inoutSourcesForm.type)}">
												<option selected="selected" value="${incomeType.key}">${incomeType.value}</option>
											</c:when>
											<c:otherwise>
												<option value="${incomeType.key}">${incomeType.value}</option>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<label class="col-md-2 control-label">Name : </label>
					<div class="col-md-4 mb-3">
						<form:input path="name" class="form-control" placeholder="Enter Source Name" required="true"/>
					</div>
				</div>
				<div class="row">
					<label class="col-md-2 control-label">Active Status : </label>
					<div class="col-md-4 mb-3">
						<select class="form-control" name="activeStatus" required="true">
							<option value="">---Select Status---</option>
							<c:choose>
								<c:when test="${isNew}">
									<option value="true">Active</option>
									<option value="false">InActive</option>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${inoutSourcesForm.activeStatus}">
											<option value="true" selected="selected">Active</option>
											<option value="false">InActive</option>
										</c:when>
										<c:otherwise>
											<option value="true">Active</option>
											<option value="false" selected="selected">InActive</option>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>
			</div>
			<div class="card-footer text-right">
				<form:button value="Save" class="btn btn-sm btn-primary">
					<i class="fa fa-save"></i>
					<c:choose>
						<c:when test="${isNew}"> Save</c:when>
						<c:otherwise> Update</c:otherwise>
					</c:choose>
				</form:button>
			</div>
		</form:form>
	</div>
</div>