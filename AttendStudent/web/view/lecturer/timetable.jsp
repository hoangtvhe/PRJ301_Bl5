<%-- 
    Document   : timetable
    Created on : Oct 23, 2022, 10:47:50 AM
    Author     : DELL
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/TimetableStyle.css"/>
    </head>
    <body>
        <a href="http://localhost:9999/MyProject/home">Home</a> ||
        <a href="http://localhost:9999/MyProject/logout">Logout</a>
         <div style="text-align: center">
             Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>

         <table border="1px">
             <thead>
                 <tr>
                     <th> <form action="timetable" method="GET">
                        <input type="hidden" name="lid" value="${param.lid}"/>
                             From: <input type="date" name="from" value="${requestScope.from}"/><br>
                             To: <input type="date" name="to" value="${requestScope.to}"/>
                             <input type="submit" value="View"/> 
                         </form> 
                     </th>
                     <c:forEach items="${requestScope.dates}" var="d">
                         <th>${helper.getDayNameofWeek(d)}<br/>
                             <fmt:formatDate value="${d}" pattern="dd/MM"/></th>
                         </c:forEach>
                 </tr>
             </thead>
             <tbody>
                 <c:forEach items="${requestScope.slots}" var="slot">
                     <tr>
                         <td>Slot ${slot.id}
                             <br>
                             <a class="label label-success">(${slot.description})</a></td>
                             <c:forEach items="${requestScope.dates}" var="d">
                             <td>
                                 <c:forEach items="${requestScope.sessions}" var="ses">
                                     <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                               ${ses.group.name} <br>
                                             -${ses.group.subject.name} <br>
                                             at  ${ses.room.name}<br>
                                                   <c:if test="${(helper.getDaystoCurrent(ses.date) >0) and (helper.getDaystoCurrent(ses.date) <1)}"> 
                                             <a href="takeatt?id=${ses.id}"> Take Attendance</a> ||
                                                   </c:if>
                                             <c:if test="${helper.getDaystoCurrent(ses.date) >=1}"> 
                                             <a href="takeatt?id=${ses.id}"> Detail Attendance</a> ||
                                                   </c:if>
                                               <a href="status?gid=${ses.group.id}&lid=${ses.lecturer.id}&subid=${ses.group.subject.id}">Status</a>
                                             <c:if test="${ses.attended}">
                                             <a> <br>(<font color="Green">Attended</font>) </a>
                                             </c:if>
                                             <c:if test="${!ses.attended}">
                                             <a> <br><font color="black">(Not Yet)</font> </a>
                                             </c:if>

                                     </c:if>

                                 </c:forEach>
                             </td>
                         </c:forEach>
                     </tr>
                 </c:forEach>
             </tbody> 
         </table>
    </body>
</html>
