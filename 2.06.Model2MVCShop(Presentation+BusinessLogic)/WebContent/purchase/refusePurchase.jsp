<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
죄송합니다 재고가 부족합니다.
<table border=1>
	<tr>
		<td>물품번호</td>
		<td>${purchase.purchaseProd.prodNo}</td>
		<td></td>
	</tr>
	
	<tr>
		<td>구매수량</td>
		<td>${purchase.purchaseCount}</td>
		<td></td>
	</tr>
	
	<tr>
		<td>재고량</td>
		<td>${purchase.purchaseProd.prodInven}</td>
		<td></td>
	</tr>
</table>
</body>
</html>