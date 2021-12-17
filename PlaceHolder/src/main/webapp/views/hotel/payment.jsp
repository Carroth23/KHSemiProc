<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Payment</title>
<style>
	div{
		border:1px solid black;
	}
	#container{
		width:700px;
		height:717px;
		margin:auto;
		box-sizing: border-box;
        background-color:rgb(215, 232, 250);
	}
	#hotelName{
        line-height:50px;
		height:50px;
	}
	#hotelImg{
        line-height:150px;
		height:150px;
	}
	#box{
		height:510px;
		box-sizing: border-box;
	}
	#userId{
        line-height:100px;
		height:100px;   
	}
	#revId{
        line-height:100px;
		height:100px;
	}
	#roomType{
        line-height:100px;
		height:100px;
	}
	#payWay{
        line-height:100px;
		height:100px;
	}
	#revPrice{
        line-height:100px;
		height:100px;
	}
    button{
        margin-top:10px;
        margin-left:5px;
        float:right;
    }
</style>
</head>
<body>
	<div id=container>
		<div id=hotelName name="hotelName">${dto.hotelName }</div>
		<div id=hotelImg name="hotelImg">${dto.hotelImg }</div>


		<div id="box">
			<div id="userId" name="userId">${dto.userId }</div>
			<div id="revId" name="revId">${dto.revId }</div>
			<div id="roomType" name="roomType">${dto.roomType }</div>
			<div id="payWay" name="payWay">${dto.payWay }</div>
			<div id="revPrice" name="revPrice">${dto.revPrice }</div>
		</div>
        <a href="javascript:history.back();"><button>취소</button></a>
        <a href="/reservation.pay"></a><button>예약</button></a>

	</div>
</body>
</html>