<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--
<%
	Map<String, Object> map = (HashMap<String, Object>)request.getAttribute("purchaseMap");
	Search search = (Search)request.getAttribute("purchaseSearch");
	Page resultPage = (Page)request.getAttribute("resultPage");	
	

	List<Purchase> list = null;
	if(map != null){
		list=(Vector<Purchase>)map.get("purchaseList");
	}
	
%>
--%>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetUserList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listPurchase.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount } 건수, 현재  ${resultPage.currentPage } 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	

	<%--<%
	String transtatus = "";
	for(int i =0; i< list.size();++i){
		
		Purchase purchase = (Purchase)list.get(i);
		if(purchase.getTranCode().contains("0")){
			transtatus = "배송 준비 중";
		}else if(purchase.getTranCode().contains("1")){
			transtatus = "배송 중";
		}else{
			transtatus = "배송 완료";
		}
		%>
	<%} %>
	--%>
	<c:set var = "i" value="0" />
	<c:forEach var = "purchase" items="${purchaseMapList}">
	<c:set var="i" value="${i+1}"> </c:set>
		
		<c:set var="transtatus" value="배송완료"/>
		<c:if test="${purchase.tranCode.trim() == '0' }">
			<c:set var="transtatus" value="배송 준비중"></c:set>
		</c:if>
		<c:if test="${purchase.tranCode.trim() == '1' }">
			<c:set var="transtatus" value="배송 중"></c:set>
		</c:if>
			
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<tr class="ct_list_pop">
		<td align="center">
			<a href="/getPurchase.do?tranNo=${purchase.tranNo}">${i}</a>
		</td>
		<td></td>
		<td align="left">
			<a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
		</td>
		<td></td>
		<td align="left">${purchase.buyer.userName }</td>
		<td></td>
		<td align="left">${purchase.buyer.phone }</td>
		<td></td>
		<td align="left">현재
				
					${transtatus }
				
				 입니다.
				 <c:if test="${!(purchase.buyer.role == 'user')}">
				 	<a href="/updateTranCode.do?tranNo=${purchase.tranNo }">배송처리</a>	
				 </c:if>				
				 <%--<%if(purchase.getBuyer().getRole().equals("user")){%> 
				 <%}else{ %>
				 
				 <%} %>--%>
				 </td>
		<td></td>
		<td align="left">
			
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>

</c:forEach>	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%--<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>  --%>
			<jsp:include page="../common/pageNavigator.jsp"/>
			
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>