<%-- 
    Document   : attendance
    Created on : Nov 5, 2022, 6:37:41 PM
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
        <link rel="stylesheet" href="../css/AttendanceStu.css"/>
    </head>
    <body>
        <c:forEach items="${requestScope.sessions}" var="ses" begin="0" end="0">
            <b>   Status attendance of group: ${ses.group.name}</b><br/>
            Lecturer: ${ses.lecturer.name} <br/>
            Subject: ${ses.group.subject.name} <br/>
            Room: ${ses.room.name}
        </c:forEach>
         <table border="1px">
            <thead> 
               <tr>
                  <th>No.</th>
                 <th>Date</th>
                  <th>Slot</th>
                  <th>Room</th>
                  <th>Lecturer</th>
                  <th>Group Name</th>
                  <th>Attendance status</th>
                  <th>Lecturer's comment</th>
               </tr>
            </thead>
            <tbody>
                   <c:set var="total" value="0"/>
                    <c:set var="absent" value="0"/>
            <c:forEach items="${requestScope.sessions}" var="ses" varStatus="loop">               
                     <c:set var="total" value="${total+1}"/>
                <tr>
                    <td>${loop.index+1}</td>
                    <td>${ses.date}</td>
                    <td>${ses.timeslot.id}<br/><a class="label label-success">${ses.timeslot.description}</a></td>
                    <td>${ses.room.name}</td>
                    <td>${ses.lecturer.name}</td>
                    <td>${ses.group.name}</td>
                <c:if test="${ses.attended}">
                    <c:if test="${ses.attendances.get(0).present}">
                        <td>
                            <font color="green">Present</font>
                        </td>
                    </c:if>
                    <c:if test="${!ses.attendances.get(0).present}">
                        <td>
                            <font color="red">Absent</font>
                             <c:set var="absent" value="${absent+1}"/>
                        </td>
                    </c:if>
                </c:if>
                <c:if test="${ses.attended eq false}">
                    <td>
                        <font color="black">Future</font>
                    </td>
                </c:if>
                <td></td>
                </tr>
            </c:forEach>
                <tr style="text-align: center">
                    <td colspan="6">
                        ABSENT:    <c:if test="${absent/total <= 0.4}">
                            <span style="color:green"> ${absent/total*100}%</span> / ABSENT SO FAR (${absent} ABSENT ON ${total} TOTAL).
                                        </c:if>
                                        <c:if test="${absent/total >= 0.6}">
                                        <span style="color:red"> ${absent/total*100}%</span> / ABSENT SO FAR (${absent} ABSENT ON ${total} TOTAL).
                                   </c:if>
                    </td>
                </tr>
         </tbody>
    </table>
                <a style="font-size: 20px" href="timetablestu">Back</a>
    </body>
</html>
