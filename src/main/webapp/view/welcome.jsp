<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Welcome</title>
		<c:set var="path" value="${pageContext.request.contextPath}"/>
		<link rel="shortcut icon" href="https://cdn0.iconfinder.com/data/icons/finance-65/100/HAND_MONEY-512.png">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
		<link rel="stylesheet" href="${path}/webjars/bootstrap/4.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" href="${path}/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="${path}/css/style.css">
	</head>
	<body>
		<jsp:directive.include file="menu.jsp" />
    	<div id="container" class="container-class">
    		<div class="row inner-jsp margin-20">
    			<div class="container col-md-4">
    				<div class="card border border-success">
		    			<div class="card-header bg-success text-white">
		    				<strong>
								<i class="fa fa-inr"></i> Revenue Details
							</strong>
							<div class="btn-group pull-right">
								<strong><fmt:formatNumber type="number" minFractionDigits = "2" value="${revenue}"/></strong>
							</div>
		    			</div>
		    			<div class="card-body dashboard-table" id="revenueChartId">
			    			<table class="table table-bordered table-condensed table-hover table-striped">
								<thead>
									<tr>
										<th>Source</th>
										<th>Amount</th>
									</tr>
								</thead>
								<tbody>
					    			<c:choose>
										<c:when test="${groupByRevenue.size() gt 0}">
											<c:forEach items="${groupByRevenue}" var="money">
							    				<tr>
							    					<td><a href="javascript:distributionBySource('${money[0]}', '${money[1]}', '1');" class="text-success">${money[1]}</a></td>
							    					<td align="right"><fmt:formatNumber type="number" minFractionDigits = "2" value="${money[2]}" /></td>
							    				</tr>
							    			</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="2">No Revenue Available</td>
											</tr>
										</c:otherwise>
									</c:choose>
					    		</tbody>
					    	</table>
					    </div>
					</div>
				</div>
				<div class="container col-md-4">
	    			<div class="card border border-danger">
		    			<div class="card-header bg-danger text-white">
		    				<strong>
								<i class="fa fa-inr"></i> Expenditure Details
							</strong>
							<div class="btn-group pull-right">
								<strong><fmt:formatNumber type="number" minFractionDigits = "2" value="${expenditure}"/></strong>
							</div>
		    			</div>
		    			<div class="card-body dashboard-table">
			    			<table class="table table-bordered table-condensed table-hover table-striped">
								<thead>
									<tr>
										<th>Source</th>
										<th>Amount</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${groupByExpenditure.size() gt 0}">
											<c:forEach items="${groupByExpenditure}" var="money">
							    				<tr>
							    					<td><a href="javascript:distributionBySource('${money[0]}', '${money[1]}', '1');" class="text-danger">${money[1]}</a></td>
							    					<td align="right"><fmt:formatNumber type="number" minFractionDigits = "2" value="${money[2]}" /></td>
							    				</tr>
							    			</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="2">No Expenditure Available</td>
											</tr>
										</c:otherwise>
									</c:choose>
					    		</tbody>
					    	</table>
					    </div>
					</div>
				</div>
				<div class="container col-md-4">
	    			<div class="card border border-primary">
		    			<div class="card-header bg-primary text-white">
		    				<strong>
								<i class="fa fa-inr"></i> Year wise Revenue Details
							</strong>
		    			</div>
		    			<div class="card-body dashboard-table">
			    			<table class="table table-bordered table-condensed table-hover table-striped">
								<thead>
									<tr>
										<th>Year</th>
										<th>Amount</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${yearWiseEarnings.size() gt 0}">
											<c:forEach items="${yearWiseEarnings}" var="money">
							    				<tr>
							    					<td><a href="javascript:yearlyEarningDestribution(${money[0]});" class="text-primary">${money[0]}</a></td>
							    					<td align="right"><fmt:formatNumber type="number" minFractionDigits = "2" value="${money[1]}" /></td>
							    				</tr>
							    			</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="2">No Year wise Revenue Available</td>
											</tr>
										</c:otherwise>
									</c:choose>
					    		</tbody>
					    	</table>
					    </div>
					</div>
				</div>
    		</div>
    		<div class="navbar navbar-expand-lg bg-dark navbar-dark fixed-bottom">
				<div class="col-md-12 navbar-text text-center">© 2018-19, All Rights Reserved by Almighty Java</div>
			</div>
    	</div>
    	<div id="modal-data"></div>
    	<jsp:directive.include file="money/modal.jsp" />
		<script type="text/javascript" src="${path}/webjars/jquery/3.3.1/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/webjars/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${path}/js/jquery.boot.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
	</body>
</html>