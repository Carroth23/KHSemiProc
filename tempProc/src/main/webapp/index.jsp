<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
  <button class="btn">패치</button>
  	${hi}
  <script>

    document.querySelector(".btn").addEventListener("click", function () {
      fetch("/roomd.room").then(function (res) {
		console.log(${hi});
		
      })
    })

  </script>
</body>

</html>