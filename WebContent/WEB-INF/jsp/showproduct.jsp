<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細</title>
<link rel="stylesheet"type="text/css" href="<%=request.getContextPath() %>/css/top.css">
<link rel="stylesheet"type="text/css" href="<%=request.getContextPath() %>/css/header2.css">
<link rel="stylesheet"type="text/css" href="<%=request.getContextPath() %>/css/all.css">
<script src="<%=request.getContextPath() %>/js/header.js"></script>

</head>
<body>
 <div>
  <header class="header-div">
   <nav class="pc-nav">
    <ul class="header-ul">
     <li class="header-li"><a class="header-a" href="inputupdateuser">ユーザー情報の変更</a></li>
     <li class="header-li"><a class="header-a" href="showorder">注文履歴</a></li>
     <li class="header-li">
      <c:if test="${sessionScope.userid == null}" var="flg" />
       <c:if test="${flg}">
        <a class="header-a"  href="inputlogin">ログイン</a>
       </c:if>
       <c:if test="${!flg}">
        <a class="header-a"  href="logout">ログアウト</a>
       </c:if>
	 </li>
    </ul>
   </nav>





   <nav>
                  <ul class="primary">


                    <li>
                      <a  class="atag" href="getgenderproduct?gender=0">メンズ</a>
                      <ul class="sub">
                        <li><a class="atag" href="getgenderandcategoryproduct?gender=0&category=1">スニーカー</a></li>
                        <li><a class="atag" href="getgenderandcategoryproduct?gender=0&category=2">サンダル</a></li>
                        <li><a class="atag" href="getgenderandcategoryproduct?gender=0&category=3">サッカースパイク</a></li>
                      </ul>
                    </li>
                    <li>
                      <a class="atag" href="getgenderproduct?gender=1">レディース</a>
                      <ul class="sub">
                        <li><a class="atag" href="getgenderandcategoryproduct?gender=1&category=1">スニーカー</a></li>
                        <li><a class="atag" href="getgenderandcategoryproduct?gender=1&category=2">サンダル</a></li>
                        <li><a class="atag" href="getgenderandcategoryproduct?gender=1&category=3">サッカースパイク</a></li>
                      </ul>
                    </li>
                    <li>
                      <a class="atag" href="getgenderproduct?gender=2">キッズ</a>
                      <ul class="sub">
                        <li><a class="atag" href="">キッズ</a></li>
                      </ul>
                    </li>
                    <div class="setright">
                    <li>
                    <div class="searchbox">
                      <form id="form4" action="自分のサイトURL" method="get">
                          <input id="sbox4"  id="s" name="s" type="text" placeholder="フリーワードを入力" />
                          <button id="sbtn4" type="submit"><i class="fas fa-search"></i></button></form></div>
                      </li>
                      <li>
                          <div class="heartsvg" id="heartId"><a href="#" class="icon">
                            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 28 28" class="heart" id="heartSvg">
                              <title>iconHeartFill</title>
                              <path d="M14.014 27.166c-3.419-2.915-6.951-6.026-9.585-9.053s-4.428-6.026-4.428-8.745c0-2.046 0.841-3.952 2.242-5.353s3.307-2.242 5.409-2.242c1.317 0 2.579 0.364 3.672 0.925s2.046 1.457 2.691 2.466c0.645-1.009 1.598-1.878 2.691-2.466s2.354-0.925 3.672-0.925c2.102 0 4.008 0.841 5.409 2.242s2.242 3.307 2.242 5.353c0 3.279-1.794 6.222-4.428 9.137-1.317 1.457-2.831 2.915-4.484 4.344s-3.363 2.859-5.101 4.316z">

                            </path></svg></a>
                          </div>
                          </li>
                          <li>

                          <div class="cartsvg" id="cartId"><a href="showcart" class="icon">
                          <svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 28 28" class="cart" id="cartSvg">
						<title>icon</title>
                          <path d="M2.635 28.035h4.148l-3.784-3.756zM3.251 21.869l6.166 6.166h2.747l-8.688-8.632zM3.728 17.020l11.043 11.015h2.747l-13.537-13.509zM23.403 6.931h-3.363c0-3.335-2.691-6.026-6.026-6.026s-6.026 2.691-6.026 6.026h-3.363l-0.42 5.045 15.948 16.060h5.241l-1.99-21.105zM14.014 2.39c2.494 0 4.54 2.046 4.54 4.54h-9.053c0-2.494 2.018-4.54 4.512-4.54z">
                          </path></svg></a></div></li>
                          </div>

                  </ul>
                </nav>





  </header>
 </div>



<h1>商品サイズ一覧</h1>
<div class="flex">
	<div class = "products">
        <div class="product">

		<c:forEach var="product" items="${data}" varStatus="itemStatus">
		<form action="addcart?shoesid=${product.shoesid}&productid=${product.productid}" method="Post">
		<c:if test="${itemStatus.first || itemStatus.index % 2 == 0}">
	<ul class="showul">
	</c:if>
	<li class="showli">
			<table class="table">
  <tr>
  <td class="table-img">
  <img src="<%=request.getContextPath() %>/image/${product.shoespicture}" width="150px" height="150px"alt="sohes">
</td>
    <td class="table-txt">
       <p class="texttype">${product.shoesname}</p>
      <a class="texttype3">${product.shoesprice}円</a>
      <a class="texttype4"><c:out value="${product.shoesstock}"/>個</a>
     <a class="texttype2"> サイズ:${product.shoessize}</a><br>
		<input type="number" name="kosuu" value="1"min="1" max="${product.shoesstock}">
						<input type="submit" value="カートに入れる">

 </td>
  </tr>
</table>
</li>
<c:if test="${itemStatus.last || itemStatus.count % 2 == 0}">
	</ul>
	</c:if>
	</form>
		</c:forEach>

</div>

			</div>
			<a href="inputtop">top</a>

	</div>
</body>
</html>