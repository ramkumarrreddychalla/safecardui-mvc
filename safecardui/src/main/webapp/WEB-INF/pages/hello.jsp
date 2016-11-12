<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%@page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>Bare - Start Bootstrap Template</title>
	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->

	<script language="JavaScript">

		var profileExps = "${profileDates}";
		var profileArry = profileExps.substring(1, (profileExps.length-1)).split(",");

		//document.getElementById("branchesLength").innerHTML = ''+branchesLength;

		$(document).ready(function() {
			var branches = "${branches}";
			var branchesLength = "${branchesLength}";
			var numberoflicenses = "${noOfLicenses}";
			var status = "${status}";
			document.getElementById("dateOfExpiry").innerHTML = profileArry[0];
			document.getElementById("branchesLength").innerHTML = branchesLength;
			document.getElementById("numberoflicenses").innerHTML = numberoflicenses;
			document.getElementById("status").innerHTML = status;

			$('#profileTypes').change(function(){
				alert('branchesLength >>'+branchesLength);
				var valueProfile = this.value;
				var dateOfExp = profileArry[valueProfile-1];
				if(dateOfExp === undefined){
					document.getElementById("dateOfExpiry").innerHTML = "";
				}else{
					document.getElementById("dateOfExpiry").innerHTML = dateOfExp;
				}

			});
		});

		function formSubmit() {
			document.myForm.submit();
		}

	</script>

	<!-- Custom CSS -->
	<style>
	body {
			padding-top: 70px;
			background: url(http://nebula.wsimg.com/92963f67dd226b315d1a312d117a9a51?AccessKeyId=531592D248B589D87A56&disposition=0&alloworigin=1) 96% / 15% no-repeat #eee;
			/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
		}

		.rTable { display: table;width: 80%; align-items: center; justify-content: center }
		.rTableRow {display: table-row; }
		.rTableHeading {display: table-header-group; background-color: #ddd; }
		.rTableCell, .rTableHead { display: table-cell; padding: 3px 10px; border: 1px solid #999999; }
		.rTableHeading {display: table-header-group;background-color: #ddd;	font-weight: bold; }
		.rTableFoot {display: table-footer-group; font-weight: bold; background-color: #ddd; }
		.rTableBody {display: table-row-group; }

		label {
			margin: 10px;
			background: transparent;
			padding: 5px 5px 5px 5px;
			font-size: 12px;
			height: 0px;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
		}
	</style>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>
<div>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container" >
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Safecard Corp</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li>
						<a href="#">About</a>
					</li>
					<li>
						<a href="#">Services</a>
					</li>
					<li>
						<a href="#">Contact</a>
					</li>

					<li align="right">
						Welcome : ${pageContext.request.userPrincipal.name}	<a href="javascript:formSubmit();"> Logout</a>
					</li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="container">
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form:form method="post" class="form-horizontal"  name="myForm" modelAttribute="profile" action="${logoutUrl}">

			<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />

			<fieldset>

				<!-- Form Name -->
				<legend>${profile.companyName}</legend>

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="ProfileType">Profile Type</label>
					<div class="col-md-5">
						<form:select  path="profileTypes" class="form-control" multiple="single">
							<form:options items="${profileTypes}" itemLabel="profileType" itemValue="profileId" />
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="ProfileType">Expiry Date</label>
					<div class="col-md-5">

						<label id="dateOfExpiry" for="dateOfExpiry"></label>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="expdate">No of Branches</label>
					<div class="col-md-4"><label id="branchesLength" for="branchesLength"></label>
						<!--<input id="expdate" name="expdate" type="text" placeholder="11/30/2018" class="form-control input-md">-->

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="numberoflicenses">No. of Lic#</label>
					<div class="col-md-4">
						<label id="numberoflicenses" for="numberoflicenses"></label>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="status">Status</label>
					<div class="col-md-4">
						<label id="status" for="status"></label>
					</div>
				</div>

			</fieldset>
		</form:form>

	</div>

	<!-- /.container -->

	<div class="container">
		<h3>List of Branches</h3> <div class="rTable">
		<div class="rTableRow">
			<div class="rTableHead"><strong>Branch Id</strong></div>
			<div class="rTableHead"><strong>Alias</strong></div>
			<div class="rTableHead"><span style="font-weight: bold;">ID (Host/IP)</span></div>
			<div class="rTableHead">Status</div>
			<div class="rTableHead">Description</div>
		</div>

		<c:forEach items="${branches}" var="branch">
			<div class="rTableRow" ng-repeat="branch in profile.branches">
				<div class="rTableCell"><c:out value="${branch.alias}"/></div>
				<div class="rTableCell"><c:out value="${branch.id}"/></div>
				<div class="rTableCell"><c:out value="${branch.host}"/></div>
				<div class="rTableCell"><c:out value="${branch.status}"/></div>
				<div class="rTableCell"><c:out value="${branch.desc}"/></div>
			</div>
		</c:forEach>

<!--
		<div class="rTableRow" ng-repeat="branch in profile.branches">
			<div class="rTableCell">{{branch.alias}}</div>
			<div class="rTableCell">{{branch.id}}</a></div>
			<div class="rTableCell">{{branch.host}}</div>
			<div class="rTableCell">{{branch.status}}</div>
			<div class="rTableCell">{{branch.desc}}</div>
		</div>
-->
	</div>
	</div>
	<!-- jQuery Version 1.11.1 -->

</body>

</html>
