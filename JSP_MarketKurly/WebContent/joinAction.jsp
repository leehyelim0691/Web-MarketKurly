<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userPassword1"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userPhone"/>
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Market Kurly</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null)
		userID = (String) session.getAttribute("userID");
	
	if (userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
 	if ( user.getUserID()==null || user.getUserPassword() == null || user.getUserPassword1() == null  || user.getUserName() == null  || user.getUserEmail() == null || user.getUserGender() == null || user.getUserPhone() == null) {
		PrintWriter script = response.getWriter();
 		script.println("<script>");
		script.println("alert('입력이 안 된 항목이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
 	/* if (user.getUserPassword() != user.getUserPassword1()) {
		PrintWriter script = response.getWriter();
 		script.println("<script>");
		script.println("alert('입력한 두 패스워드가 같지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} */
	else{
		PrintWriter script = response.getWriter();
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);	
		if (result == -1){
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} 
		else {
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
}
	%>
</body>
</html>
