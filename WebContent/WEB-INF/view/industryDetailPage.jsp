<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/kakao.font.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!--그래프를 위한 스크립트-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script src="https://code.highcharts.com/modules/series-label.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
	<!-- Additional files for the Highslide popup effect -->
	<script src="https://www.highcharts.com/media/com_demo/js/highslide-full.min.js"></script>
	<script src="https://www.highcharts.com/media/com_demo/js/highslide.config.js" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="https://www.highcharts.com/media/com_demo/css/highslide.css">


	<style type="text/css">
		/*1row*/

      #industry_info{
         height: 350px;
         position: relative;
      }
      #card_detail{
         height: 300px;
         width: 300px;
         background-color: #FFFBEF;
         position : absolute;
         top: 0;
         left: 5px;
      }
      .card_left{
         position: absolute;
         /*left: 10%;*/
         margin-top: 25px;
         width: 300px;
         text-align: center;
      }
      .card_right{
         position: absolute;
         left: 13%;
         margin-top: 130px;
         width: 400px;
         text-align: center;
      }
      .card_table{
         border: 1px solid gray;
         height: 50px;
         width: 200px;
         /*background-color: pink;*/
         margin-left:15px;
         margin-top: 70px;
      }
      .card_table tr td{
         border: 1px solid gray;
         vertical-align: middle;
      }
      /*그래프 만들기...?*/
      #graph_company{
         height: 200px;
         width: 700px;
         /*background-color: green;*/
         position : absolute;
         top: 0;
         right:50px;
      }

      /*2row*/
      #company_info{
         min-height: 300px;
        /*background-color: yellow; */
         position: relative;
      }
      #company_detail{
         min-height: 300px;
         width: 650px;
        /*background-color: red; */
         position : absolute;
		 top: 0;
		 left: 0px;
      }
      #detail_header{
         min-height: 130px;
         width: 600px;
         position: relative; 
         /*background-color: purple;*/
         /*       position : absolute;
                   left:0px;*/
      }
      .company_left{
         position: absolute;
         left: 70px;
         top: 25px;
      }
      .company_center{
         position: absolute;
         left: 220px;
         top: 50px;
      }
      .company_right{
         position: absolute;
         right: 0;
         top: 25px;
      }
      .detail_table{
         height: 200px;
         width: 500px;
         /*background-color: pink;*/
         margin-left: 80px;

         /*position : absolute;
            left:0px;*/
         /*margin-top: 200px;*/
      }
      .detail_table tr td{
         border: 1px solid gray;
         vertical-align: middle;
         text-align: center;
      }
      #select_company{
         min-height: 300px;
         width: 200px;
         /*background-color: yellow;*/
        /* position : absolute;
         right:50px;
         top: 0;*/
         margin-left: 780px;

         padding: 20px;
         border: 1px solid #bcbcbc;
      }
    /*   #select_company_list {
         display: block;
         min-height: 300px;
          width: 200px;
          background-color: red;
      }

      #select_company_list li{
         width: 200px;
         height: 19px;
      } */
      /*그래프를 위한 가져온 css*/
      .highcharts-figure, .highcharts-data-table table {
         min-width: 360px;
         max-width: 800px;
         /*margin: 1em auto;*/
      }

      .highcharts-data-table table {
         font-family: Verdana, sans-serif;
         border-collapse: collapse;
         border: 1px solid #EBEBEB;
         text-align: center;
         width: 100%;
         max-width: 500px;
      }
      .highcharts-data-table caption {
         padding: 1em 0;
         font-size: 1.2em;
         color: #555;
      }
      .highcharts-data-table th {
         font-weight: 600;
         padding: 0.5em;
      }
      .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
         padding: 0.5em;
      }
      .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
         background: #f8f8f8;
      }
      .highcharts-data-table tr:hover {
         background: #f1f7ff;
      }

	</style>
	<script type="text/javascript">
		function company_checkbox(){
			var flag = false;
			var values = document.getElementsByName("companysel");
			var count = 0;
			for(var i=0; i<values.length;i++){
				if(values[i].checked){
					//alert(values[i].value);
					count++;
				}
			}
			if(count != 2){
				alert("2개를 골라주세요")
			}else{
				flag=true;
			}
			return flag;
			
		}
		
	
	</script>
</head>
<body>
	<div id="header">
		<div id="logoBox">
			<h1>
				<a href="" title="vanilla stock">
					<img src="${pageContext.request.contextPath}/img/vs-logo2.PNG" alt="vanilla stock"/>
				</a>
			</h1>

		</div><!--//#logoBox -->
		<div class="aux">
			<div id="gnb">
				<h2 class="screen_out">주요 서비스</h2>
				<ul>
					<li class="nav on"><a href=""> 종목</a> </li>
					<li class="nav"><a href=""> 투기장 </a></li>
					<li class="nav"><a href="">랭킹</a> </li>
				</ul>

			</div><!--//#gnb -->

			<div id="searchBox">
				<label class="screen_out">찾을 회사 입력</label>
				<input class="inp_txt" type="text" placeholder="회사명을 입력해주세요" />
				<span class="btn_search"> <i class="fa fa-search"></i></span>
			</div><!--//#searchBox -->

		</div><!--//.aux -->
		<div id="loginBox">
			<div id="loginBtn" class="btn hidden">
				로그인
			</div><!--//loginBtn -->
			<div id="profileBox" class="">
				<h2 class="screen_out">유저정보</h2>
				<img src="${pageContext.request.contextPath}/profile/profile.png"
					 class="profile_on"  width="60" height="60"
					 alt="테스터"
					 title="테스터"/>
				<div id="profilePopup" class="profile_on">
					<ul id="profileList">
						<li class="profile"><a href="/user.jsp?no=3"><span class="open_door" >문</span>
							<!--관리자는 관리자 페이지로 바꾸기 -->
							마이페이지</a></li><!--//.profile -->
						<li class="profile"><a href="/logout.do"><span class="close_door" >문</span> 로그아웃</a></li><!--//.profile -->
					</ul><!--//profileList -->
				</div><!--//#profilePopup -->
			</div><!--#profileBox -->
			<script>
				const $profile = $("#profileBox img");
				const $profileTarget = $("#profilePopup");

				$profile.click(function () {
					$profileTarget.toggle();
				});// profileBox click end

				$("html").click(function(e){
					if(!$(e.target).hasClass("profile_on")){
						$profileTarget.hide();
					}
				});//
			</script>

		</div>

	</div><!--//#header -->
	<div id="content">
		<div class="aux">
			<div id="industry_info"><!--1row-->
				<div id="card_detail">
				<c:forEach var="comlist" items="${comlist}">
					<c:forEach var="cardData" items="${cardDataMap }">
					<c:if test="${comlist.industryNo==cardData.key}">
					 <div class="card_left">
						<ul>
							<li>
								<a href="" title="testicon">
								<img style="width: 50%; max-width: 600px; height: 50%; vertical-align: middle" 
										src="${pageContext.request.contextPath}/icon/<c:out value="${comlist.industryNo}"/>.png">
								</a>
							</li>
						</ul>
						
						<ul>
							<li style="text-align: center; font-size: large; margin-top: 15px" >
								<c:out value="${cardData.value.getIndustryName()}"/>
							</li>
						</ul>
					</div>
					<div class="card_right">
					<!-- c태그(if,foreach)이용 -->
						<table class="card_table">
							<tr style="height: 30px">
								<td colspan="4" style="color : <c:choose>
									<c:when test="${cardData.value.getChangeRate() < 0}">blue</c:when>
									<c:when test="${cardData.value.getChangeRate() > 0}">red</c:when>
									<c:otherwise>#669</c:otherwise>
									</c:choose>">
									전일 대비 :<c:out value="${String.format('%.02f', cardData.value.getChangeRate()) }"/>%
								</td>
							</tr>
							<tr>
								<td>전체</td>
								<td>상승</td>
								<td>보합</td>
								<td>하락</td>
							</tr>
							<tr>
								<td><c:out value="${cardData.value.totalCnt}"/></td>
								<td><c:out value="${cardData.value.incCnt}"/></td>
								<td><c:out value="${cardData.value.totalCnt-cardData.value.incCnt-cardData.value.decCnt}"/></td>
								<td><c:out value="${cardData.value.decCnt}"/></td>
							</tr>
						</table>
					</div>
					</c:if>
					</c:forEach>
					</c:forEach>
				</div><!--card_detail-->
				<!--그래프내용-->
				<div id="graph_company">
					<figure class="highcharts-figure">
						<div id="container" style="height: 300px"></div>
						<script>
							Highcharts.chart('container', {

								chart: {
									scrollablePlotArea: {
										minWidth: 700
									}
								},

								data: {
									csvURL: 'https://cdn.jsdelivr.net/gh/highcharts/highcharts@v7.0.0/samples/data/analytics.csv',
									beforeParse: function (csv) {
										return csv.replace(/\n\n/g, '\n');
									}
								},

								title: {
									text: null
								},

								/*subtitle: {
									text: 'Source: Google Analytics'
								},*/

								xAxis: {
									tickInterval: 7 * 24 * 3600 * 1000, // one week
									tickWidth: 0,
									gridLineWidth: 1,
									labels: {
										align: 'left',
										x: 3,
										y: -3
									}
								},

								yAxis: [{ // left y axis
									title: {
										text: null
									},
									labels: {
										align: 'left',
										x: 3,
										y: 16,
										format: '{value:.,0f}'
									},
									showFirstLabel: false
								}, { // right y axis
									linkedTo: 0,
									gridLineWidth: 0,
									opposite: true,
									title: {
										text: null
									},
									labels: {
										align: 'right',
										x: -3,
										y: 16,
										format: '{value:.,0f}'
									},
									showFirstLabel: false
								}],

								legend: {
									align: 'left',
									verticalAlign: 'top',
									borderWidth: 0
								},

								tooltip: {
									shared: true,
									crosshairs: true
								},

								plotOptions: {
									series: {
										cursor: 'pointer',
										point: {
											events: {
												click: function (e) {
													hs.htmlExpand(null, {
														pageOrigin: {
															x: e.pageX || e.clientX,
															y: e.pageY || e.clientY
														},
														headingText: this.series.name,
														maincontentText: Highcharts.dateFormat('%A, %b %e, %Y', this.x) + ':<br/> ' +
																this.y + ' sessions',
														width: 200
													});
												}
											}
										},
										marker: {
											lineWidth: 1
										}
									}
								},

								series: [{
									name: 'All sessions',
									lineWidth: 4,
									marker: {
										radius: 4
									}
								}, {
									name: 'New users'
								}]
							});
						</script>
					</figure>
				</div>

			</div><!--industry_info-->
			<div id="company_info"><!--2row-->
				<div id="company_detail">
					<!--회사세부내용 타이틀-->
					<div id="detail_header">
						<div class="company_left">
							<img>
							<div><span style="font-size: xx-large">아시아경제</span></div>
							<div><span>등락%</span></div>
						</div>
						<div class="company_center">
							<img src="${pageContext.request.contextPath}/img/vsline.PNG" alt="vanilla stock" width="200px" height="20"/>
						</div>
						<div class="company_right">
							<img>
							<div><span style="font-size: xx-large">디앤씨미디어</span></div>
							<div><span>등락%</span></div>
							
						</div>
					</div><!--detail_header-->
					<!--회사세부내용표-->
					<div>
						<table class="detail_table">
							<tr>
								<td>값</td>
								<td style="background: white">전일비</td>
								<td>값</td>
							</tr>
							<tr>
								<td>값</td>
								<td style="background: white">매수호가</td>
								<td>값</td>
							</tr>
							<tr>
								<td>값</td>
								<td style="background: white">매도호가</td>
								<td>값</td>
							</tr>
							<tr>
								<td>값</td>
								<td style="background: white">거래량</td>
								<td>값</td>
							</tr>
							<tr>
								<td>값</td>
								<td style="background: white">거래대금</td>
								<td>값</td>
							</tr>
							<tr>
								<td>값</td>
								<td style="background: white">전일거래량</td>
								<td>값</td>
							</tr>
						</table>
					</div>
				</div><!--company_detail-->
				<div id="select_company">
					<form method="get" action="액션넣기">
						<p>종목 선택하기</p><hr>
						 <c:forEach var="comlist" items="${comlist}"> 
						<ul id="select_company_list"><!--name과 value수정하기-->
							<li><label><input type="checkbox" name="companysel" value="blue"><c:out  value="${comlist.getCompany()}"/></label></li>
							<!-- <li><label><input type="checkbox" name="companysel" value="red"> 회사이름2</label></li> -->
						</ul>
						</c:forEach> 	
						<ul>
							<hr><li style="margin-left: 120px"><input type="button" onclick="return company_checkbox()" value="보기" id="go"></li>
						</ul>
						 
					</form>
				</div><!-- select_company -->
				<!-- checkbox를 위한 제이쿼리 -->
				<script>
				$(document).ready(function(){
					$('#go').click(function(){
						var cnt=$('.cb:checked').length;
						$('#result').html(cnt+"개 선택됨").css("color","blue");
					});
				});
				</script>
			</div><!--company_info-->
		</div><!--//.aux -->
	</div><!--//#content -->


	<div id="footer">
			<div id="policy">
		<h4 class="screen_out">정책 및 약관</h4>
		<ul>
		<li><a href="">회사소개</a></li><!--
	 --><li><a href="">광고</a></li><!--
	 --><li><a href="">검색등록</a></li><!--
	 --><li><a href="">제휴제안</a></li><!--
	 --><li><a href="">이용약관</a></li><!--
	 --><li><a href=""><strong>개인정보이용약관</strong></a></li><!--
	 --><li><a href="">청소년보호정책</a></li><!--
	--><li><a href="">고객센터</a></li>
	</ul>
	</div><!--//policy -->
	<address>&copy; 2020 <a href="">NackEGG.com</a></address>

	</div><!--//#footer -->
	<script  src="${pageContext.request.contextPath}/js/fix-footer.js"></script>

</body>
</html>