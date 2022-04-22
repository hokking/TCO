  var $menuDiv = $(".menuDiv");
  var $billDiv = $(".billDiv");
  var $list = ("#list");
  
  var allMenu = orderManager.getAllMenus();//6.Js에서 받아온 menus 참조 값을 allMenu변수에 넣어줌
  var addOrder= "";
  var str = "";
  
  //6.문자열로 html로 화면에 출력
  for(var i=0; i<allMenu.length; i++){
      str += "<div data-mno='" + allMenu[i].mno + "'><p class='name'>"+allMenu[i].title+
              "</p><img src = '"+ allMenu[i].mno +".jpg'><p class='money'>" +
              allMenu[i].price + "원</p></div>";
  }
  
  $menuDiv.html(str);
  
  //
  $(".menuDiv").on("click","div",function (event) {
  
      var $this = $(this);
      var mno = $this.data("mno");
  
      orderManager.addOrder(mno);
  
      // console.log(mno);
  
      addOrder = orderManager.getAllOrders();
  
      var getTotalPrice = orderManager.getTotalPrice();
      var str="<colgroup><col><col style='width:100px;'><col style='width:70px;'></colgroup><tr style='text-align: center'><th>상품</th><th>수량</th><th>가격</th></tr>";
  
      for(var i=0; i<addOrder.length; i++){
          str += "<tr data-mno='" + addOrder[i].mno + "'>"
                  + "<td>" + addOrder[i].menu.title + "</td><td>"+ addOrder[i].amount + "</td><td>"
                  + addOrder[i].getTotal()+"</td></tr>";
      }
  
      $("#list").html(str);
      $("#total").html(getTotalPrice+"원");
  
  });
  
  
  $("#clear").on("click",function (event) {
      var allClear = orderManager.allClear();
      $("#list, #total").html(allClear);
  });
  
  
  $("#list").on("click", "tr", function (event) {
  
      var $this = $(this);
      var mno = $this.data("mno");
  
      orderManager.cancleOrder(mno);
  
      addOrder = orderManager.getAllOrders();
  
      var getTotalPrice = orderManager.getTotalPrice();
  
      //console.log(mno);
  
      var str="<colgroup><col><col style='width:100px;'><col style='width:70px;'></colgroup><tr style='text-align: center'><th>상품</th><th>수량</th><th>가격</th></tr>";
  
      for(var i=0; i<addOrder.length; i++){
          str += "<tr data-mno='" + addOrder[i].mno + "'>"
                  + "<td>" + addOrder[i].menu.title + "</td><td>"+ addOrder[i].amount + "</td><td>"
                  + addOrder[i].getTotal()+"</td></tr>";
      }
  
      $("#list").html(str);
      $("#total").html(getTotalPrice+"원");
  });


출처: https://til0804.tistory.com/3 []