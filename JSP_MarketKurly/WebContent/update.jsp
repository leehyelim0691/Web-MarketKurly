<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/heml; charset="UTF-8">
<meta name="viewport" content="width=device-width" ,intial-scale="1">

<title>Market Kurly</title>
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
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	int bbsID = 0;
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID ==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
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
        <div class="header_menu">
            <li class="signUp"><a href="join.jsp">회원가입  |</a></li>
            <li class="logIn"><a href="login.jsp">  로그인 |</a></li>
            <li class="customer"><a href="bbs.jsp">  고객센터 |</li>
        </div>
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
    

	<div class="container">
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								수정 양식</th>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle() %>" ></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="bbsContent" maxlength="2048" style="height: 350px;"<%=bbs.getBbsContent() %>></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글 수정">

			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
          var availableTags = [
            "채소",
            "과일",
            "수산",
            "정육",
            "국",
            "샐러드",
            "면",
            "생수",
            "간식",
            "베이커리",
            "건강식품",
            "생활용품",
            "스킨케어",
            "헤어",
          ];
          $( "#search" ).autocomplete({
            source: availableTags
          });
        } );
        
        $( function() {
            function runEffect1() {
            var options =  { };
            $( ".sliderProduct1" ).effect( "bounce", options, 300, callback1 );
            };
        
            function callback1() {
                setTimeout(function() {
                    $( ".sliderProduct1" );
                }, 4000 );
            };
        
        $( ".product1" ).on( "mouseover", function() {
            runEffect1();
            return false;
        });
        } );

        $( function() {
            function runEffect2() {
            var options =  { };
            $( ".sliderProduct2" ).effect( "bounce", options, 300, callback2 );
            };
        
            function callback2() {
                setTimeout(function() {
                    $( ".sliderProduct2" );
                }, 4000 );
            };
        
        $( ".product2" ).on( "mouseover", function() {
            runEffect2();
            return false;
        });
        } );

        $( function() {
            function runEffect3() {
            var options =  {  };
            $( ".sliderProduct3" ).effect( "bounce", options, 300, callback3 );
            };
        
            function callback3() {
                setTimeout(function() {
                    $( ".sliderProduct3" );
                }, 4000 );
            };
        
        $( ".product3" ).on( "mouseover", function() {
            runEffect3();
            return false;
        });
        } );

        $( function() {
            function runEffect4() {
            var options =  { };
            $( ".sliderProduct4" ).effect( "bounce", options, 300, callback4 );
            };
        
            function callback4() {
                setTimeout(function() {
                    $( ".sliderProduct4" );
                }, 4000 );
            };
        
        $( ".product4" ).on( "mouseover", function() {
            runEffect4();
            return false;
        });
        } );

        $( function() {
            function runEffect5() {
            var options =  { };
            $( ".title" ).effect( "pulsate", options, 300, callback5 );
            };
        
            function callback5() {
                setTimeout(function() {
                    $( ".title" );
                }, 4000 );
            };
        
        $( ".title" ).on( "mouseover", function() {
            runEffect5();
            return false;
        });
        } );
        </script>
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
        
        function slideShow() {
            var i2;
            var slider2 = document.getElementsByClassName("sliderImage"); 
            for (i2 = 0; i2 < slider2.length; i2++) {
                slider2[i2].style.display = "none";   
            }
            index2++;

            if (index2 > slider2.length) {
                index2 = 1;  
            }   

            slider2[index2-1].style.display = "block";  

            setTimeout(slideShow, 2000);            
        }
    </script>		
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>