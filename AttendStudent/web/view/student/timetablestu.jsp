<%-- 
    Document   : timetablestu
    Created on : Nov 3, 2022, 3:55:43 PM
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
        <link rel="stylesheet" href="../css/TableStyle.css"/>
    </head>
    <body>
         <a href="http://localhost:9999/MyProject/homestu">Home</a> ||
        <a href="http://localhost:9999/MyProject/logout">Logout</a>
             <h2>Activities for
                                    <span>${requestScope.student.id} (${requestScope.student.name})</span>
             </h2>
             <p><b>Note:</b> These activities do not include extra-curriculum activities, such as club activities ...</p>
             <p><b> Chú thích:</b> Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa, ví dụ như hoạt động câu lạc bộ ...</p>
             <p> Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br/>
                Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br/>
               Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br/>
               Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br/>
                Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br/>
                Little UK (LUK) thuộc tầng 5 tòa nhà Delta</p>
         <table border="1px">
             <thead>
                 <tr>
                     <th> <form action="timetablestu" method="GET">
                        <input type="hidden" name="stdid" value="${param.stdid}"/>
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
                                         <a href="status?stdid=${requestScope.student.id}&gid=${ses.group.id}">${ses.group.name} <br>
                                             -${ses.group.subject.name} <br>
                                             at  ${ses.room.name}<br></a> 
                                   
                                     <c:if test="${ses.attended}">
                                                        <c:if test="${ses.attendances.get(0).present}">

                                                            (<font color="green">Present</font>)
                                                            </c:if>
                                                            <c:if test="${!ses.attendances.get(0).present}">
                                                            (<font color="red">Absent</font>)
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${!ses.attended}">
                                                        <font color="black">(Not yet)</font>
                                                        </c:if> 
                                       </c:if>                   
                                 </c:forEach>
                             </td>
                         </c:forEach>
                     </tr>
                 </c:forEach>
             </tbody> 
         </table>
             <b>More note / Chú thích thêm</b>
             <ul>
                 <li>(<font color="green">attended</font>): ${requestScope.student.id} had attended this activity / ${requestScope.student.name} đã tham gia hoạt động này</li>
                 <li>(<font color="red">absent</font>): ${requestScope.student.id} had NOT attended this activity / ${requestScope.student.name} đã vắng mặt buổi này</li> 
                 <li>(-): no data was given / chưa có dữ liệu</li> 
             </ul>
    </body>
</html>
