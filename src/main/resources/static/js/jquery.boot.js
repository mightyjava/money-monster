$(function() {
	$("#userList").click(function() {
		fetchList("user");
	});
	
	$("#moneyList").click(function() {
		fetchList("money");
	});
	
	$("#sourcesList").click(function() {
		fetchList("money/inoutSources");
	});
	
	$("#uploadExcelFile").submit(function(e) {
		e.preventDefault();
		var formData = new FormData(this);
		$.ajax({
			type:"POST",
			url:"/moneymonster/money/readExcel/"+$("#modelFor").val(),
			data:formData,
			cache:false,
			contentType:false,
			processData:false,
			success:function(data) {
				$("#uploaded-data").html(data);
			}
		});
	});
});

var pageConstant = "?page=1";

function addForm(type) {
	modifyData(type+"/form");
}

function editForm(type, id) {
	$("#myModal").modal('hide');
	modifyData(type+"/edit/"+id);
}

function fetchList(type) {
	modifyData(type+"/list"+pageConstant);
}

function refresh(type) {
	modifyData(type+"/refresh"+pageConstant);
}

function list(type, page) {
	modifyData(type+"/list?page="+page);
}

function modifyData(suffix) {
	$.ajax({
		type : "GET",
		url : "/moneymonster/"+suffix,
		success : function(data) {
			$(".inner-jsp").html(data);
		}
	});
}

function deleteData(type, id) {
	toastr.warning("<div>Are you sure you want to delete this?</div>" +
			"<div class='btn-group pull-right'>" +
			"<button type='button' id='confirmationYes' class='btn btn-xs btn-default'><i class='glyphicon glyphicon-ok'></i> Yes</button>" +
			"<button type='button' class='btn btn-xs btn-default clear'><i class='glyphicon glyphicon-remove'></i> No</button>" +
			"</div>", "Delete Confirmation", {
		allowHtml:true,
		closeButton:true,
		onShown: function() {
			$("#confirmationYes").click(function() {
				$.ajax({
					type : "GET",
					url : "/moneymonster/"+type+"/delete/"+id,
					success : function(data) {
						fetchList(type);
						toastr.success(data.message, "Delete Confirmation", {
							closeButton:true
						});
					}
				});
			});
		}
	});
}

function fetchSources() {
	var type = $("#type").val();
	if(type != "") {
		$.ajax({
			type : "GET",
			url : "/moneymonster/money/fetch/"+type,
			success : function(data) {
				$("#sourceDivId").html(data);
			}
		});
	}
}

function yearlyEarningDestribution(year) {
	$.ajax({
		type : "GET",
		url : "/moneymonster/money/yearlyEarning/"+year,
		success : function(data) {
			$("#sourceModalData").html(data);
			$("#sourceModal").modal('show');
			$(".model-label").text(year);
		}
	});
}

function distributionBySource(id, name, page) {
	$.ajax({
		type : "GET",
		url : "/moneymonster/money/distributionBySource/"+id+"?page="+page,
		success : function(data) {
			$("#sourceModalData").html(data);
			$("#sourceModal").modal('show');
			$(".model-label").text(name);
		}
	});
}

function uploadModal(modalFor) {
	$.ajax({
		type : "GET",
		url : "/moneymonster/money/uploadModal/"+modalFor,
		success : function(data) {
			$("#modal-data").html(data);
			$("#uploadModal").modal('show');
			$(".model-label").text(modalFor);
			$(".modal-body").css("height", "65px");
		}
	});
}