<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="POST" action="${path}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
</c:if>
<nav class="navbar sticky-top navbar-expand-lg bg-dark navbar-dark fixed-top" role="navigation">
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="javascript:void(0);">
    	<strong><i class="fa fa-money" aria-hidden="true"></i> Money Monster</strong>
    </a>
    <div class="collapse navbar-collapse justify-content-between" id="navbar">
        <div class="navbar-nav">
            <a href="${path}" class="nav-link active"><i class="fa fa-home"></i> Home</a>
            <a href="javascript:void(0);" id="moneyList" class="nav-link"><i class="fa fa-inr"></i> Money</a>
            <a href="javascript:void(0);" id="sourcesList" class="nav-link"><i class="fa fa-info-circle"></i> Sources</a>
        </div>
        <div class="navbar-nav">
			<ul class="navbar-nav ">
                <li class="nav-item dropdown">
                    <a href="javascript:void(0);" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                		<i class="fa fa-user fa-lg"></i> <label>${user.fullName}</label>
            		</a>
                    <div class="dropdown-menu" aria-labelledby="navDropDownLink" style="left:-120px;">
                   		<a class="dropdown-item" href="javascript:void(0);" id="settingList">
			                <label><i class="fa fa-cog"></i> Settings</label>
                        </a>
                        <a class="dropdown-item" href="javascript:void(0);" id="changePassword">
			                <label><i class="fa fa-lock"></i> Change Password</label>
                        </a>
                        <a class="dropdown-item" href="javascript:void(0);" id="userList">
			                <label><i class="fa fa-id-badge"></i> Profile</label>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="javascript:void(0);" class="dropdown-item" onclick="document.forms['logoutForm'].submit()"><i class="fa fa-sign-out"></i> Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>