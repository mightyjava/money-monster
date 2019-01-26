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
				</c:choose> Money
			</strong>
		</div>
		<form:form method="post" class="form-horizontal" action="${path}/money/add" commandName="moneyForm" id="submitMoneyForm">
			<form:hidden path="id"/>
			<div class="card-body">
				<div class="row">
					<label class="col-md-2 control-label">Type : </label>
					<div class="col-md-4 mb-3">
						<select class="form-control" onchange="fetchSources()" id="type" required="true">
							<option value="">---Select Type---</option>
							<c:forEach items="${incomeTypes}" var="incomeType">
								<c:choose>
									<c:when test="${isNew}">
										<option value="${incomeType.key}">${incomeType.value}</option>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${fn:contains(incomeType.key, moneyForm.source.type)}">
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
					
					<label class="col-md-2 control-label">Source : </label>
					<div class="col-md-4 mb-3" id="sourceDivId">
						<form:select class="form-control" path="sourceId" required="true" disabled="true">
							<form:option value="">---Select Source---</form:option>
						</form:select>
					</div>
				</div>
				<div class="row">
					<label class="col-md-2 control-label">Information : </label>
					<div class="col-md-10 mb-3" id="sourceDivId">
						<form:textarea path="moreInformation" class="form-control" placeholder="Enter More Information" required="true"/>
					</div>
				</div>
				<div class="row">
					<label class="col-md-2 control-label">Date : </label>
					<div class="col-md-4 mb-3">
					  	<form:input type="date" path="date" class="form-control" placeholder="Enter Date" required="true"/>
					</div>
					
					<label class="col-md-2 control-label">Amount : </label>
					<div class="col-md-4 mb-3">
						<form:input class="form-control" path="amount" placeholder="Enter Amount" required="true"/>
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
<script type="text/javascript">
$(function() {
	if($("#type").val() != "") {
		fetchSources();
		setTimeout(function() {
			$("#sourceDivId option[value=" + '${moneyForm.source.id}'+"]").attr("selected","selected") ;
		}, 2000);
	}
});
</script>