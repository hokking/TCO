<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>


<link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/button.css'/>"/>


 <div style="display: none;">
<form name="msgForm" id="msgForm" action="<c:url value='  '/>" method="post"> 
	<c:if test="${empVO != null}">
		${empVO.empNm} 접속 하셨습니다.  <!-- 님, 메신저에 접속 합니다. -->
		<input type="button" id="connectMsgBtn" name="connectMsgBtn"/> <!-- comExtMsg.webSocket.btnInto -->
	</c:if>
	<c:if test="${empVO==null}">
		 로그인후 사용이 가능 합니다. <br/> <!-- 접속 후 가능한 메뉴입니다.  -->
		  <!-- 로그인 후 이용해주시기 바랍니다. -->
	</c:if>
</form>
</div>
 
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		var form = $("form[name=msgForm]");
		form.attr("action", "<c:url value='/chat/websocketMessengerMain'/>");
		form.attr("method", "post");
		form.submit();
	});
</script>