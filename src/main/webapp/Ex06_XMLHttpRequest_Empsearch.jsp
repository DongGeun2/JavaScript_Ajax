<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
      /*
         1. XMLHttpRequest 객체 얻기
         2. onreadystatechange 이벤트 핸들러 구현 (함수)
         3. 요청 정보 ( open() )
         4. 요청 보내기 (send() )
         5. 응답 처리 (Text(JSON), xml )
            (responseText, responseXML)
      */
      
      var httpReq = null;
      
      function getInstance() {
         if(window.XMLHttpRequest) {
            httpReq = new XMLHttpRequest();
         } else if(window.ActiveXObject) { //IE6 이하
            httpReq = new ActiveXObject("Msxml2.XMLHTTP");
         } else {
            throw new Error("AJAX 지원하지 않습니다.");
         }
         return httpReq;
      }
      
      function handlerStateChange() {
         if(httpReq.readyState == 4) { // 1. 서버에서 응답이 왔다면
            if(httpReq.status >= 200 && httpReq.status < 300) {
               
               // 가공
               // Text
               // Xml
               
               document.getElementById("txtdata").innerHTML = httpReq.responseText;
               
            } else {
               alert("status Text : " + httpReq.status);
            }
         }
      }
      
      function sendData() {
          httpReq = getInstance();
          httpReq.onreadystatechange = handlerStateChange;
          
          let empno = document.getElementById("emp").value;
          
          httpReq.open("GET", "Ex06_EmpSearch.jsp?empno=" + empno); // form태그 구성이랑 같음
          httpReq.send(); // form submit 과 같음
       }
      
</script>
</head>
<body>
   <h3>사원 검색하기(비동기)</h3>
   <select name="emp" id="emp" onchange="sendData()">
      <option value="0000">SELECT EMPNO</option>
      <option value="7788">SCOTT</option>
      <option value="7902">FORD</option>
      <option value="7521">WORD</option>
   </select>
   <hr>
   <div id="txtdata">EMP DATA LOAD</div>
   
   <hr>
   <h3>사원 검색하기(동기)</h3>
   <a href="Ex06_EmpSearch.jsp?empno=7788">사원검색</a>
</body>
</html>