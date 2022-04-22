<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
 <div class="craw">
     <input type="button" id="craw_hp_submit" name="craw_hp_submit" class="btn btn-warning" value="홈플러스 크롤링"/>  
     <input type="button" id="craw_em_submit" name="craw_em_submit" class="btn btn-warning" value="이마트 크롤링"/>  
     <input type="button" id="craw_cp_submit" name="craw_cp_submit" class="btn btn-warning" value="쿠팡 크롤링"/>  
 </div>
 <div class="content_craw">
 
 	<table border="1">
				<colgroup>
					<col style='width: 140px;'>
					<col style='width: 140px;'>
					<col style='width: 230px;'>
					<col style='width: 140px;'>
					<col style='width: 140px;'>
					<col style='width: 140px;'>
				</colgroup>
				<thead>
			        	<tr>
					        <th>상품명</th>
					        <th>상품가격</th>
				        </tr>
				 </thead>
				 <tbody  id="itemListTable">
				 </tbody>
			</table>
 
 </div>
 
 <script type="text/javascript">
 $(function() {
	 alert("실행")

     $("#craw_cp_submit").click(function(){
    	 alert("ㅎㅇ요 ")
         $.ajax({
             url :"/craw/craw_cp",
             data :{
             },
             dataType : "json",
             type : "get",
             success:function(resultMap){
                alert(resultMap.itemList);
                alert(resultMap.priceList);
                 $(".content_craw").append("<tr><th>"+resultMap.itemList+"</th><th>"+resultMap.priceList+"</th></tr>");    
                $.each(resultMap.itemList,resultMap.priceList, function (index, item) { 
                str +="<tr>"
				+"<td class='count'>"+resultMap.itemList +"</td>"
				+"<td class='prodInfoId'>" + resultMap.priceList+"</td>" 
				+"</tr>";
			
				$("#itemListTable").append(str)
                });
                
                
             },
             fail : function(resultMap){
            	 console.log(resultMap.itemList);
             }
         })
     })
 })
 </script>
