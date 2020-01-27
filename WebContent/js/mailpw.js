$(document).ready(function() {
	$('#summernote').summernote({
		placeholder : 'Enter Content',
		tabsize : 3,
		height : 200
	});

	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#pw1").val();
			var pwd2 = $("#pw2").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
	function regmail() {
		var email = $("#email").val();
		if (email === "" || email === null) {
			alert('email이 입력되지 않았습니다.');
			return;
		}

		var mail = {
			reg_mail : email
		}

		$.ajax({
			type : "POST",
			url : "/yp/user?cmd=regmail",
			dataType : "text",
			contentType : "application/json",
			data : JSON.stringify(mail),
			success : function(data) {
				if (data === "ok") {
					alert("메일이 등록되었습니다.")
					$("#email").val('');
				} else {
					alert("메일이 등록이 실패하였습니다.")
				}

			},
			error : function(data) {
				alert("통신실패")
			}
		});

	}
});