<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Payment</title>
<style>
div {
	border: 1px solid black;
}

#container {
	width: 700px;
	height: 717px;
	margin: auto;
	box-sizing: border-box;
	background-color: rgb(215, 232, 250);
}

#hotelName {
	line-height: 50px;
	height: 50px;
}

#hotelImg {
	line-height: 150px;
	height: 150px;
}

#box {
	height: 510px;
	box-sizing: border-box;
}

#userId {
	line-height: 100px;
	height: 100px;
}

#revId {
	line-height: 100px;
	height: 100px;
}

#roomType {
	line-height: 100px;
	height: 100px;
}

#payWay {
	line-height: 100px;
	height: 100px;
}

#revPrice {
	line-height: 100px;
	height: 100px;
}

button {
	margin-top: 10px;
	margin-left: 5px;
	float: right;
}
</style>
</head>
<body>
	<c:forEach var="info" items="${paymentInfo}">
	<form action="/paid.book" method="post" id="form">
		<div id=container>
			<div id=hotelName name="hotelName">ȣ�� �̸� : ${info.hotelName }</div>
			<div id="box">
				<div id="userId" name="userId">ȸ�� ���̵� : ${info.userId }</div>
				<div id="revId" name="reservvId">���� ��ȣ : ${info.revId }</div>
				<input type=text name="revId" value="${info.revId }" style="display:none">
				<div id="checkIn" name="checkIn">üũ�� : ${info.checkIn }</div>
				<div id="checkOut" name="checkOut">üũ�ƿ� : ${info.checkOut }</div>
				<div id="revRoomType" name="revRoomType">�� Ÿ�� :
					${info.revRoomType }</div>
				<div id="revQuantity" name="revQuantity">�� ���� :
					${info.revQuantity }</div>
				<div id="revPrice" name="revPrice">�� ���� : ${info.revPrice }</div>
			</div>
			<a href="javascript:history.back();"><button>���</button></a> 
			<input type="submit" value="����Ȯ���ϱ�">
		</div>
		</form>
	</c:forEach>
</body>
</html>