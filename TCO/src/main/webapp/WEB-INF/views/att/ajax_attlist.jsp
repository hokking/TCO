<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${list.get(0).empNm eq list.get(1).empNm }">
<c:forEach var="i" begin="0" end="${list.size()-5}" step="5">
   <tr>
    	<td>${list.get(i).empNm}</td>
    	<td>${list.get(i).sumtm}</td>
       	<td>출근: ${list.get(i).worksttsBgngTm} <br> 퇴근: ${list.get(i).worksttsEndTm} </td> 
    	<td>출근: ${list.get(i+1).worksttsBgngTm} <br> 퇴근: ${list.get(i+1).worksttsEndTm} </td> 
    	<td>출근: ${list.get(i+2).worksttsBgngTm} <br> 퇴근: ${list.get(i+2).worksttsEndTm} </td> 
    	<td>출근: ${list.get(i+3).worksttsBgngTm} <br> 퇴근: ${list.get(i+3).worksttsEndTm} </td> 
    	<td>출근: ${list.get(i+4).worksttsBgngTm} <br> 퇴근: ${list.get(i+4).worksttsEndTm} </td> 
    </tr>
</c:forEach>
</c:if>
<c:if test="${list.get(0).empNm ne list.get(1).empNm }">
<c:forEach var="i" begin="0" end="${list.size()-1}" step="1">
   <tr>
   		<td>${list.get(i).empNm}</td>
   		<td>${list.get(i).sumtm}</td>
       	<td>출근: <br> 퇴근:  </td> 
    	<td>출근: <br> 퇴근:  </td> 
    	<td>출근: <br> 퇴근:  </td> 
    	<td>출근: <br> 퇴근:  </td> 
    	<td>출근: <br> 퇴근:  </td> 
    </tr>
</c:forEach>
</c:if>