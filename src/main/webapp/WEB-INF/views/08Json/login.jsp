<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/bootstrap4.5.3/css/bootstrap.css" />
<script src="../common/jquery/jquery-3.5.1.js"></script>
</head>
<body>
<script type="text/javascript">
function loginValidate(f)
{
   if(f.id.value==""){
      alert("아이디를 입력하세요");
      f.id.focus();
      return false;
   }
   if(f.pass.value==""){
      alert("패스워드를 입력하세요"); 
      f.pass.focus();
      return false;
   } 
   
   $.ajax({
      url : "./loginAction.do",//요청할 경로
      type : "post",//전송방식
      //post방식일때의 컨텐츠 타입
      contentType : "application/x-www-form-urlencoded;charset:utf-8;",
      data : {//서버로 전송할 파라미터(JSON타입)
         id : $('#id').val(),
         pass : $('#pass').val()
      },
      dataType : "json",//콜백데이터의 형식
      
      success : function(d){//콜백 메소드
    	  /*
    	  콜백 데이터 타입이 json이므로 별도의 파싱없이 즉시 데이터를 읽을 수 있다.
    	  만약 json타입이 아니라면 JSONParse()를 호출해야 한다.
    	  */
         if(d.loginResult==0){
        	 //로그인 실패시...
            alert(d.loginMessage);
         }
         else{
        	 //성공시에는 list.do로 이동한다.
            alert(d.loginMessage);
            location.href='list.do';
         }
      },
      error : function(e){
         alert("실패"+e);
      }
   });
}
</script>
<div class="container"> 
   <h3>방명록(로그인)</h3> 
   <!-- 로그인이 될 경우에는 회원의 이름과 로그아웃버튼을 출력 -->
      <!-- 로그인이 된 상태라면 로그아웃 버튼을 출력한다. -->
   <c:choose>
      <c:when test="${not empty sessionScope.siteUserInfo }">
         <div class="row" style="border:2px solid #cccccc;padding:10px;">         
            <h4>아이디:${sessionScope.siteUserInfo.id }</h4>
            <h4>이름:${sessionScope.siteUserInfo.name }</h4>
            <br /><br />
            <button class="btn btn-danger" 
               onclick="location.href='logout.do';">
               로그아웃</button>
            &nbsp;&nbsp;
            <button class="btn btn-primary" 
               onclick="location.href='list.do';">
               방명록리스트</button>
         </div>
      </c:when>
      <c:otherwise>
       <!-- 로그아웃 상태에서는 로그인 폼을 출력한다. -->
         <span style="font-size:1.5em; color:red;">${LoginNG }</span>
         <form name="loginForm" method="post" action="./loginAction.do" onsubmit="return loginValidate(this);">
            <input type="hidden" name="backUrl" value="${param.backUrl }"/>
            <!-- input태그에 id속성을 부여하여jQuery에서 선택자를 통해 입력값을 얻어올 수 있게 수정한다.  -->
            <table class="table-bordered" style="width:50%;">
               <tr>
                  <td><input type="text" class="form-control" name="id" id="id" placeholder="아이디" tabindex="1"></td>
                  <td rowspan="2" style="width:80px;"><button type="submit" id="loginBtn" class="btn btn-primary" style="height:77px; width:77px;"  tabindex="3">로그인</button></td>
               </tr>
               <tr>
                  <td><input type="password" class="form-control" name="pass" id="pass" placeholder="패스워드" tabindex="2"></td>
               </tr>
            </table>
         </form>
      </c:otherwise>
   </c:choose>
</div>

</body>
</html>