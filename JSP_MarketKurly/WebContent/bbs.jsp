<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter"%>
 <%@ page import="bbs.BbsDAO"%>
 <%@ page import="bbs.Bbs"%>
 <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>MarketKurly</title>
<style>
        .header{
            grid-template-columns:  1.6fr 6.5fr 2fr;
            display:grid;
            margin-left : 280px;
            margin-right : 280px;
            margin-top:0px
        }
        .header_delivery{
            /* border:1px solid red; */
            padding-top:0px
        }
        .header_logo{
            /* border:1px solid orange; */
        }
        .header_menu{
            /* border:1px solid yellow; */
        }
        .header_logo{
            text-align : center; 
            margin-top: -20px;
        }
        .header_logo_image{
            width : 160px;
            height : 100px;
        }
        .header_delivery_text{
            border : 1px solid gray;
            border-radius: 10px;
        }
        .delivery_text1,.delivery_text2{
            font-size : 12px;
            font-family : "noto sans", "malgun gothic",;
            padding-left:8px;
        }
        .delivery_text1{
            color : #4c4c4c;
        }
        .delivery_text2{
            color : #5f0080;
            font-weight: bold;
        }
        .signUp{
            color : #5f0080;
            font-size : 12px;
        }
        .logIn,.customer{
            color : #4c4c4c;
            font-size : 12px;
        }
        .navBar{
            margin-left : 280px;
            margin-right : 280px;
            grid-template-columns: 2fr 1fr 1fr 1fr 1fr 4fr;
            /* border : 1px solid salmon; */
            display:grid;
        }
        .navBar_menu1,.navBar_menu2,.navBar_menu3,.navBar_menu4,.navBar_menu5{
            border : 1px solid blueviolet;
            text-align:  left; 
            font-size : 16px;      
            font-weight: bold;
            font-family: "Noto Sans";
            color : #4c4c4c; 
        }
        .searchBox {
            display: flex;
            flex-direction: row;
        }
        .search {
            width: 242px;
            height: 36px;
            border-radius: 30px;
            background-color: #f4f4f4;
            margin: 10px 0 0 25px;
            border: none;
            padding-left: 10px;
        }
        .searchIcon {
            width: 30px;
            height: 30px;
            margin: 13px 0 0 -35px;
        }
                .slider{
            margin-left: -10px;
            margin-right: -10px;
        }
        .sliderImage{
            width:100%;
            height:300px;
            margin-left: 0px;
        }

        .gnb {
            width: 1519.2px;
            height: 56px;
            background-color: white;
            box-shadow: 0 10px 10px -10px #ddd;
        }
        .gnb-fixed {
            position: fixed;
            top: 0px;
            left:0px;
        }
        .gnbMenu {
            width: 1050px;
            height: 56px;
            margin: 0 234.6px 0 234.6px;
            display: flex;
            flex-direction: row;
        }
        .gnbDetail{
            list-style: none;
            display: flex;
            flex-direction: row;
            margin: 0;
            padding: 17px 0 0 0;
            font-size: 15px;
            font-weight: bold;
        }

        .icon {
            width: 24px;
            height: 24px;
        }
        .menu1 {
            width: 208px;
            padding: 0;
            position: relative;
            cursor: pointer;
        }
        .menuName1 {
            padding-left: 10px;
        }
        .menu1_sub:hover {
            color :rgb(95, 0, 128);
        }

        .category {
            width: 219px;
            height: 590px;
            padding: 0;
            color: rgb(76, 76, 76);
            background-color: #fff;
            border: 1px solid #ddd;
            display: none;
            padding-bottom: 7px;
            margin-top: 19px;
        }
        .category_sub {
            height: 35px;
            list-style: none;
            z-index: 1;
            padding: 7px 0 0 14px;
        }
        .category_sub:hover {
            background-color: rgb(241, 241, 241);
            color: rgb(95, 0, 128);
        }
        .category_text {
            font-size: 14px;
            font-weight: 600;
        }
        .menu1:hover .category {
            display: block;
        }

        .menu2 {
            width: 124px;
            height: auto;
            cursor: pointer;
        }
        .menu2:hover {
            text-decoration: underline;
            text-underline-position: under;
        }
        .menu3 {
            width: 110px;
            height: auto;
            cursor: pointer;
        }
        .menu3:hover {
            text-decoration: underline;
            text-underline-position: under;
        }
        .menu4 {
            width: 116px;
            height: auto;
            cursor: pointer;
        }
        .menu4:hover {
            text-decoration: underline;
            text-underline-position: under;
        }
        .menu5 {
            width: 116px;
            height: auto;
            cursor: pointer;
        }
        .menu5:hover {
            text-decoration: underline;
            text-underline-position: under;
        }

        .searchBox {
            display: flex;
            flex-direction: row;
        }
        .search {
            width: 242px;
            height: 36px;
            border-radius: 30px;
            background-color: #f4f4f4;
            margin: 10px 0 0 25px;
            border: none;
            padding-left: 10px;
        }
        .searchIcon {
            width: 30px;
            height: 30px;
            margin: 13px 0 0 -35px;
        }
        .location {
            color: #333;
            margin: 15px 35px 0 35px;
            cursor: pointer;
        }
        .location:hover {
            color :rgb(95, 0, 128);
        }
        .cart {
            color: #333;
            margin-top: 15px;
            cursor: pointer;
        }
        .cart:hover {
            color :rgb(95, 0, 128);
        }
    </style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null)
			userID = (String) session.getAttribute("userID");
		
		int pageNumber = 1;
		
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="header">
        <div class="header_delivery">
            <div class="header_delivery_text">
                <span class="delivery_text1">그 외 지역</span>
                <span class="delivery_text2">택배배송 ></span>
            </div>
            <div class="header_delivery_text">
                <span class="delivery_text1">수도권·충청</span>
                <span class="delivery_text2">샛별배송 ></span>
            </div>
        </div>
        <div class="header_logo">
        <a href="./main.jsp"> <img class="header_logo_image" src="./image/market_kurly_logo.png"></a>
        </div>
			<%
				if(userID==null){
			%>
			<div class="header_menu">
            <span class="signUp"><a href="join.jsp">회원가입  |</a></span>
            <span class="logIn"><a href="login.jsp">  로그인 |</a></span>
            <span class="customer"><a href="bbs.jsp">  고객센터 |</a></span>
        </div>
			<%
				}else{
			%>
		<div class="header_menu">
            <span class="logIn"><a href="logoutAction.jsp">  로그아웃 |</a></span>
            <span class="customer"><a href="bbs.jsp">  고객센터 |</a></span>
        </div>
			<% 
				}
			%>
	 </div>
    
        <div class="gnb">
            <div class="gnbMenu">
                <ul class="gnbDetail">
                    <ul class="menu1">
                      <div class="menu1_sub">
                        <i class="fas fa-bars fa-lg"></i>
                        <span class="menuName1">전체 카테고리</span>                        
                      </div>
                      <ul class="category">
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_veggies.png">
                          <span class="category_text">채소</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_fruit.png">
                          <span class="category_text">과일·견과·쌀</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_seafood.png">
                          <span class="category_text">수산·해산·건어물</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_meat.png">
                          <span class="category_text">정육·계란</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_side.png">
                          <span class="category_text">국·반찬·메인요리</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_convenient.png">
                          <span class="category_text">샐러드·간편식</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_sauce.png">
                          <span class="category_text">면·양념·오일</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_snacks.png">
                          <span class="category_text">생수·음료·우유·커피</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_cookie.png">
                          <span class="category_text">간식·과자·떡</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_deli.png">
                          <span class="category_text">베이커리·치즈·델리</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_health.png">
                          <span class="category_text">건강식품</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_living.png">
                          <span class="category_text">생활용품·리빙</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_beauty.png">
                          <span class="category_text">스킨케어·메이크업</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_body.png">
                          <span class="category_text">헤어·바디·구강</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_kitchen.png">
                          <span class="category_text">주방용품</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_electronic.png">
                          <span class="category_text">가전제품</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_kids.png">
                          <span class="category_text">베이비·키즈</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="./icon/icon_pet.png">
                          <span class="category_text">반려동물</span>
                        </li>
                        <li class="category_sub">
                          <img class="icon" src="https://res.kurly.com/pc/service/common/1908/ico_recommend_on_v2.png">
                          <span class="category_text">컬리의 추천</span>
                        </li>                     
                      </ul>
                    </ul>
                    <li class="menu2">신상품</li>
                    <li class="menu3">베스트</li>
                    <li class="menu4">알뜰쇼핑</li>
                    <li class="menu5">특가/혜택</li>
                </ul>
                <div class="searchBox">
                  <input class="search">
                  <input type="image" class="searchIcon" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png">
                </div>
                <div class="location">
                  <i class="fas fa-map-marker-alt fa-lg"></i>
                </div>
                <div class="cart">
                  <i class="fas fa-shopping-cart fa-lg"></i>
                </div>
            </div>
        </div>
    </div>
    </div>

	
	<div class="main">
	  <div class="bbsText" style="margin-top:80px; color:#333333; font-size:24px; color:#333333; margin-left:460px; margin-right:470px;font-weight:bold;">공지사항</div>
        <hr style="border: solid 1px #5f0080; width:660px; margin-top: 40px; margin-left:460px;">
	
		<div class="row" style="width:610px; margin-top:15px; align-items: center; margin-left:460px; margin-right:470px;">
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<div style="grid-template-columns: 1fr 5fr 2fr 2fr;display:grid;">
						<div style="color:#4c4c4c; font-size:12px; font-family:'noto-sans';padding-left:10px">번호</div>
						<div style="color:#4c4c4c; font-size:12px; font-family:'noto-sans'">제목</div>
						<div style="color:#4c4c4c; font-size:12px; font-family:'noto-sans'">작성자</div>
						<div style="color:#4c4c4c; font-size:12px; font-family:'noto-sans'">작성일</div>
					</div>
				</thead>
				<hr style="border: solid 1px #999999; width:660px; margin-top: 15px;">
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
			if (pageNumber != 1) {
			%>
		<%-- 	<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">이전</a> --%>
			<input type="button" value="다음"  onclick="location.href='bbs.jsp?pageNumber=<%=pageNumber - 1%>'" style="width:70px; align-items: center; color:#ffffff; font-size:16px; background-color: #5f0080; border:none; border-radius: 3px; height:30px">
				
			<%
			}
			if (bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<%-- <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-left">다음</a> --%>
			<input type="button" value="다음"  onclick="location.href='bbs.jsp?pageNumber=<%=pageNumber + 1%>'" style="width:70px; align-items: center; color:#ffffff; font-size:16px; background-color: #5f0080; border:none; border-radius: 3px; height:30px">
				
			<%
			}
			%>

 		<div class="writeButton" style="margin-bottom: 5px;margin-left:570px">
            <input type="button" value="글쓰기"  onclick="location.href='./write.jsp'" style="width:90px; align-items: center; color:#ffffff; font-size:16px; background-color: #5f0080; border:none; border-radius: 3px; height:30px">
        </div>
		<div>
	</div>
	<script>
        var index1 = 0;   
        var index2 = 0;

        window.onload = function(){
            deliveryShow();
            slideShow();    
        }

        function deliveryShow() {
            var i1;
            var slider1 = document.getElementsByClassName("header_delivery_text"); 
            for (i1 = 0; i1 < slider1.length; i1++) {
                slider1[i1].style.display = "none";   
            }
            index1++;

            if (index1 > slider1.length) {
                index1 = 1;  
            }   

            slider1[index1-1].style.display = "block";  

            setTimeout(deliveryShow, 1000); 
            
        }
    </script>		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>