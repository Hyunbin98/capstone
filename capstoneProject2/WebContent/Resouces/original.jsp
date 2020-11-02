
    <%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "com.hanshin.capstoneProject.DBConn" %>
<%@ page import = "java.util.ArrayList" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">
<title>중급 수준의 영단어</title>
<style>

.nav {

  list-style-type: none;

  text-align: center;

  margin: 0;

  padding: 0;

}



.nav li {

  display: inline-block;

  font-size: 20px;

  padding: 20px;

}

</style>
</head>
<body>

			<div class="text-center">
    			<h1>Word 게시판</h1>
    			<p>아래 원하는 항목을 선택 해주십시오.</p>
			</div>					
				
				
						

<ul class="nav">

  <li><a href="original.jsp">중급 수준의 영단어 </a></li>

  <li><a href="Normal.jsp">상급 수준의 영단어 </a></li>



</ul>

	<!-- 데이터를 한 눈에 보기 편하게 열(row)로 구성 합니다 -->

<div class="jb-header-mobile-table-cell jb-header-mobile-table-cell-bars">
											<div class="jb-bars"><i class="xi-bars"></i></div>
										</div>

	<div class="container">

		<div class = "row">

			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd"> 

				<thead>
				
					<!-- 단어와 뜻을 가로줄로 구성해줌 -->
					<tr>
					<!-- 표의 제목을 디자인 해줍니다. -->
						<th style="background-color: #eeeeee; text-align: center;">단어</th>

						<th style="background-color: #eeeeee; text-align: center;">뜻</th>

					</tr>

				</thead>
				
				<%
				//1.connection
				Connection conn = DBConn.getMySqlConnection();
				
				//2.SQL문 객체 생성
				Statement stmt = conn.createStatement();
				String sql = "select * from project.bapstone";
				stmt.executeQuery(sql);
				
				//3.결과 rs 메모리 생성
				ResultSet rs = null;
				
				//4.쿼리 실행
				rs = stmt.executeQuery(sql);
				
				String dbEng = "";
				String dbKor = "";
				ArrayList engarray = new ArrayList();
				ArrayList korarray = new ArrayList();
				while(rs.next()) {
					dbEng = rs.getString("eng");
					dbKor = rs.getString("kor");
					engarray.add(dbEng);
					korarray.add(dbKor);
				
				} 
				
				%>

				<tbody>

					<tr>
					
							
						<td>
						<%
						for(int i=0; i<engarray.size(); i++)
						{
							out.println(engarray.get(i));
							out.print("<br>");
							out.print("<hr width = "+"100%"+" color = "+"black"+">");
						}
						
 						%>
						</td>
						<td>
						<% 
						for(int i=0; i<korarray.size(); i++)
						{
							out.println(korarray.get(i));
							out.print("<br>");
							out.print("<hr width = "+"100%"+" color = "+"black"+">");
						}
 						%>
						</td>
						

					</tr>
					
				
						
					

				</tbody>

			</table>	
			


		</div>

	</div>

	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>


</body>
</html>