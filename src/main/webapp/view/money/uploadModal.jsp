<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${path}/js/jquery.boot.js"></script>
<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog modal-dialog-top modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<b><label class="model-label" style="text-transform: capitalize;"></label></b>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<form id="uploadExcelFile" class="form-horizontal" action="" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<div class="row">
						<input type="hidden" value="${modalFor}" id="modelFor"/>
						<label class="col-md-2 control-label">Upload Xlsx : </label>
						<div class="col-md-4 mb-3">
							<input type="file" name="file" required="true"/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<a href="/moneymonster/money/downloadTemplate/source" class="btn btn-info btn-sm mr-auto"><i class="fa fa-download"></i>  Template</a>
					<button type="submit" class="btn btn-success btn-sm"><i class="fa fa-file-excel-o"></i> Read</button>
					<button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
				</div>
			</form>
			<div id="uploaded-data"></div>
		</div>
	</div>
</div>