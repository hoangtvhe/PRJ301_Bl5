<%-- 
    Document   : statusattend
    Created on : Oct 23, 2022, 10:49:29 AM
    Author     : DELL
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/StatusStyle.css"/>
    </head>
    <body>
            <c:forEach  items="${requestScope.group.sessions}" var="ses"  begin="0" end="0">
                <b>   Status attendance of group: ${ses.group.name}</b> <br/>
                Lecturer: ${ses.lecturer.name} <br/>
                Subject: ${ses.group.subject.name} <br/>
                Room: ${ses.room.name}
            </c:forEach>

            <table class="table" border="1px">
                <thead>
                <tr class="thead">
                    <th>No.</th>
                    <th>Group</th>
                    <th>Student ID</th>
                    <th>Full Name</th>
                    <c:forEach items="${requestScope.group.sessions}" var="ses" varStatus="loop">
                    <th> Session ${loop.index+1} <br>
                           <fmt:formatDate value="${ses.date}" pattern="dd/MM/yyy"/>
                        </th>
                    </c:forEach>
                    <th>Absent</th>                         
                </tr>
</thead>
                <c:forEach items="${requestScope.group.students}" var="std" varStatus="loop"> 
                     
                    <tr>
                        <c:set var="total" value="0"/>
                    <c:set var="absent" value="0"/>
                        <td>${loop.index+1}</td>
                        <td>${requestScope.group.id}</td>
                        <td>${std.id}</td>
                         <input type="hidden" name="stdid" value="${a.student.id}"/>
                        <td>${std.name}</td> 
                        <!-- need a loop -->    
                        <c:forEach items="${requestScope.group.sessions}" var="a">  
                               <c:set var="total" value="${total+1}"/>
                            <c:forEach items="${a.attendances}" var="b">               
                                <c:if test="${b.student.id eq std.id}">
                                    <td style="font-weight: bold">
                                        <c:choose>
                                            <c:when test="${b.present}">
                                                <p style="color: green"> P </p>
                                            </c:when> 
                                            <c:when test="${!a.attended}">
                                                <p> Not yet </p>
                                            </c:when> 
                                            <c:otherwise>
                                                <p  style="color: red"> A </p>
                                                <c:set var="absent" value="${absent+1}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </c:if>
                            </c:forEach>
                        </c:forEach>   
                                    <c:if test="${absent/total <= 0.4}">
                                       <td style="color:green"> ${absent/total*100}/100%</td>
                                        </c:if>
                                        <c:if test="${absent/total >= 0.6}">
                                        <td style="color:red"> ${absent/total*100}/100%</td>
                                        </c:if>
                                       
                                    
                    </c:forEach>    
                </tr>   
            </table>
                <c:forEach  items="${requestScope.group.sessions}" var="ses"  begin="0" end="0">
                <a style="font-size: 20px" href="timetable?lid=${ses.lecturer.id}">Back</a>
                     </c:forEach>
    </body>
</html>
