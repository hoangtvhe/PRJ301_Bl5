<%-- 
    Document   : home
    Created on : Nov 2, 2022, 11:08:47 AM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                margin:0;
                padding:0;
                background:#fafafa;
                color: black;
            }
            #bg {
                background-image: url('img/4907157.jpg');
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-size: cover;
                filter: blur(5px);
            }
            .main{
                position: relative;
                height:100vh;
                width:100%;
                top:0;
                left:0;
                right:0;
            }
            .main .navbar{
                position: absolute;
                height:auto;
                width:100%;
                margin:2% 0;
                display: flex;
                align-items: center;
                overflow: hidden;
                padding:10px 0;
            }
            .main .navbar .logo{
                position: relative;
                height:auto;
                width:20%;
                left:10%;
                float:left;
                font-family:'Lato',sans-serif;
                font-size:35px;
                font-weight:600;
                cursor: pointer;
                text-shadow:0px 0.5px 5px rgba(0, 0, 0, 0.2);
                transition: 0.1s ease-in-out;
            }
            .main .navbar .logo:hover{
                color:rgba(0, 0, 0, 0.4);
            }
            .main .navbar  ul{
                position: relative;
                float:right;
                width:50%;
                right:-40%;
                height:auto;
                margin:auto;
            }
            .main .navbar ul li{
                list-style-type: none;
                display: inline-block;
                height:100%;
                width:auto;
                border:1px solid rgba(255, 255, 255, 0.88);
                border-radius:2px ;
                cursor: pointer;
                padding:10px;
                box-shadow:0px 0.5px 5px rgba(0, 0, 0, 0.2);
                transition: 0.1s ease-in-out;
                box-sizing: border-box;
            }
            .main .navbar ul li a{
                color:black;
                text-align: center;
                text-decoration: none;
                font-family:'cinzel',sans-serif;
                font-size:15px;
                font-weight:300;
                display: block;
            }
            .main .navbar ul li:hover{
                background:rgba(0, 0, 0, 0.4);
            }
        </style>
    </head>
    <body>
           <div id="bg"></div>
        <div class="main">
            <div class="navbar">
                <div class="logo"><a href="student/timetablestu">TimeTable</a></div>
         <c:if test="${sessionScope.account ne null}">
             <ul>
             <li>Hello, Mr.${sessionScope.account.displayname}</li>
            <li><a href="logout">logout</a></li>
            </ul>
        </c:if>
            </div>
        <c:if test="${sessionScope.account eq null}">
            you are not logged in yet!
        </c:if>
            </div>
    </body>
</html>
