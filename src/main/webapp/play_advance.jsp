<%@page import="util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String stoneTotal = request.getParameter("stoneTotal");
	
	String itidoStr = request.getParameter("stoneMax");
	int itido = Integer.parseInt(itidoStr);
	
	session.setAttribute("itido", itido);
	
	
	int stoneMaxInt = Integer.parseInt(stoneTotal);
	
    String totalNumStr = (String) session.getAttribute("totalNum");
    
    int totalNum = 0;
    
    if (Utility.isNullOrEmpty(totalNumStr)){
    	totalNumStr = stoneTotal;
    }else {
    totalNum = Integer.parseInt(totalNumStr);
    }
    
	String pickStr = request.getParameter("num");
    if (Utility.isNullOrEmpty(pickStr)){
    	pickStr = "0";
    }
    
    int pick = Integer.parseInt(pickStr);

    String player1 = "A";
    String player2 = "B";

 	String playerName;
     
    playerName = (String)session.getAttribute("player");
	if(Utility.isNullOrEmpty(playerName)){
		playerName = player1;
	}
	int newNum = stoneMaxInt - pick;  
	
    if (newNum <= 0){
    	response.sendRedirect("finish_advance.jsp");
    } else{
    	if (playerName.equals(player1)){
    		session.setAttribute("player", player2);
    	}else {
    		session.setAttribute("player", player1);
    	}
    }

    String a = Utility.getStoneDisplayHtml(stoneMaxInt);
    
	String newNumStr = "" + newNum;
    session.setAttribute("totalNum", newNumStr); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java基礎課題</title>
<link href="css/styles.css" rel="stylesheet">
</head>
<body>
  <h1>石取りゲーム</h1>

  <div class="info">
    <h2>
      残り：<%= stoneMaxInt %>個
    </h2>
    <p class="stone">
      <%out.println(a);%>
    </p>
  </div>
  <div class="info">
    <h2>
      プレイヤー<%= playerName %>の番
    </h2>

    <form action="play_advance.jsp">
      <p>
        石を
        <input type="number" name="num" min="1" max="<%=itido %>"  required>
        個取る<br> ※1度に<%=itido %>個取れます。
      </p>
      <button class="btn" type="submit">決定</button>
    </form>
  </div>
</body>
</html>