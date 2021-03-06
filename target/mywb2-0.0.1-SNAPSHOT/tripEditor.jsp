<%@ page language="java" contentType="text/html; charset=windows-1255"
	pageEncoding="windows-1255"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@page import="javax.naming.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="Imgg.*"%>
<%@page import="Interf.*"%>
<%@page import="model3.TripSightseeing"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Travel Organizer</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="./css/FileOne.css">

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">
	<c:if test="${empty trips}"><jsp:forward
			page="/EditorController?myaction=listOftrips&init=true"></jsp:forward></c:if>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#myPage">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#about">ABOUT</a></li>
					<li><a href="#services">SERVICES</a></li>
					<li><a href="#portfolio">PORTFOLIO</a></li>
					<li><a href="#pricing">PRICING</a></li>
					<li><a href="#contact">CONTACT</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron text-center">
		<h1>Company</h1>
		<p>We specialize in blablabla</p>
		<form class="form-inline" action="EditorController" method="post">
			<div class="input-group">
				<!-- <input type="text" class="form-control" size="50" placeholder="your name" required> -->

				<select class="form-control" id='trvlr' name='triptoedt'>
					<option value="-1">Select traveler</option>
					<c:forEach items="${trips}" var="trip">
						<option value="${trip.idtrip}"
							${trip.idtrip eq tri? ' selected': ''}>
							${trip.nameCompat()}</option>
					</c:forEach>
				</select>
				<div class="input-group-btn">
					<button type="submit" class="btn btn-danger" name="action"
						value="tripd">Submit trip</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="row">
			<form action="EditorController" method="post">
				<div class="col-sm-4">
					<h2>Select sight</h2>
					<br>
					<h4>in the trip city ${!empty tripcity ? tripcity : '' }</h4>
					<br>
					<p>
						<label for="Inputselect">sight</label> <select
							class="form-control form-select-vidconvert" name="sightslct"
							required>

							<optgroup label="regitereg sights in trip">
								<option value="-1">Select sight</option>
								<c:forEach items="${tsig}" var="sight">
									<option value="${sight.idtripSightseeing}"
										${sight.idtripSightseeing eq chosensightind? ' selected': ''}>
										<c:out value="${sight}" />
									</option>
								</c:forEach>
							</optgroup>

							<optgroup label="new sights from city">
								<c:forEach items="${news}" var="nsight">
									<option value="n${nsight.idSightSeeings}">${nsight}</option>
								</c:forEach>
							</optgroup>

						</select>
					</p>
					<br> <input type="hidden" name="trp" value="${tri}">
					<button type="submit" name="action" value="trpsight"
						class="btn btn-default btn-lg">select sight</button>
					<button type="submit" name="action" value="dltsight"
						class="btn btn-default btn-lg">delete sight from trip</button>
					<button type="submit" name="action" value="dltsightcity"
						class="btn btn-default btn-link">delete sight from city
						also</button>
				</div>
			</form>
			<form action="EditorController" method="post">
				<div class="col-sm-4">
					<h2>Add sight</h2>
					<br>
					<h4>in city ${!empty tripcity ? tripcity : '' } of the trip</h4>
					<br>
					<p>
						<label for="Inputname">sight</label> <input class="form-control"
							id="sight" name="sight" placeholder="sight" type="text" required>
					</p>
					<br> <input type="hidden" name="trp" value="${tri}">
					<button class="btn btn-default btn-lg" type="submit" name="action"
						value="newsight">add sight</button>
				</div>

				<div class="col-sm-4">
					<span class="glyphicon glyphicon-signal logo"></span>
				</div>
			</form>
		</div>
	</div>

	<div class="container-fluid bg-grey" id="addpics">

		<form action="tripEditor.jsp" method="post">

			<div class="row">
				<div class="col-sm-4">
					<span class="glyphicon glyphicon-globe logo slideanim"></span>
				</div>


				<div class="col-sm-8">

					<h2>
						Add pictures to sight <strong>${!empty worksight ? worksight: ''}</strong>
					</h2>
					<br>
					<h4>
						<strong>Picture</strong> <label for="Inputname"> location
							Address</label> <input class="form-control" id="sight" name="item"
							placeholder="pic address" type="text">
						<button class="btn btn-default btn-link" type="submit" name="todo"
							value="AddItem">add picture</button>
						<INPUT type="submit" name="todo" value="ListItems"
							class="btn btn-default btn-link"> <INPUT type="submit"
							name="todo" value="ClearList" class="btn btn-default btn-link">
					</h4>

					<br>
					<div class="row">
						<div class="col-sm-3">

							<strong>Picture added:</strong>
						</div>
						<div class="col-sm-7">
<c:if test="${stp ne 1}">
							<%
								String action = request.getParameter("todo");
													Bla15 td = (Bla15) session.getAttribute("todo");
													if (td == null) {
														try {
															final Properties jndiProps = new Properties();

															jndiProps.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
															InitialContext ctx = new InitialContext(jndiProps);
															td = (Bla15) ctx.lookup("ejb:mywb2-0.0.1-SNAPSHOT/Bla11!Imgg.Bla11?stateful");
															//	td = new ImgB();
															session.setAttribute("todo", td);
														} catch (Exception ex) {
															ex.printStackTrace();
														}
													}
													if (action != null) {
														if (action.equals("AddItem")) {
															String item = request.getParameter("item");
															if (!item.equals("")) {
																td.addItem(item, (TripSightseeing) session.getAttribute("worksight"));
																/* 	out.println("item " + item + " added"); */
																request.setAttribute("scrollTo", "addpics");

															}
														} else if (action.equals("ListItems")) {
															Vector<Map> items = td.listItems();
															/* 		out.println("items: "); */
															for (int x = 0; x != items.size(); x++) {
																String addrspic = (String) items.elementAt(x).get("addr");
																out.println("<br>" + (x + 1) + ". " + items.elementAt(x).get("trs") + ", "
																		+ (addrspic.length() >= 6
																				? "..." + addrspic.substring(addrspic.length() - 5)
																				: addrspic));
																out.print("<a href=tripEditor.jsp?todo=remove&itemnum=" + x + ">remove</a>");
																request.setAttribute("scrollTo", "addpics");
															}
															request.setAttribute("scrollTo", "addpics");

														} else if ("ClearList".equals(action)) {
															td.clearItems();
															out.println("items Cleared");
															request.setAttribute("scrollTo", "addpics");

														} else if ("todb".equals(action)) {
															RequestDispatcher rd = request.getRequestDispatcher("/EditorController");
															request.setAttribute("td", td);
															request.setAttribute("action", action);
															/*    request.setAttribute("trp", (String)(session.getAttribute("tri")+""));
															*/ session.removeAttribute("todo");
															rd.forward(request, response);
														} else if ("remove".equals(action)) {
															String item = request.getParameter("itemnum");
															td.removeItem(item);
															request.setAttribute("scrollTo", "addpics");

														}

													}
							%>

</c:if>

						</div>
						<div class="col-sm-2">
							<button class="btn btn-default btn-info" type="submit"
								name="todo" value="todb">submit to db</button>

						</div>

					</div>
				</div>

			</div>

		</form>
	</div>




	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center">
		<h2>SERVICES</h2>
		<h4>What we offer</h4>
		<br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-off logo-small"></span>
				<h4>POWER</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-heart logo-small"></span>
				<h4>LOVE</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-lock logo-small"></span>
				<h4>JOB DONE</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
		</div>
		<br> <br>
		<div class="row slideanim">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-leaf logo-small"></span>
				<h4>GREEN</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-certificate logo-small"></span>
				<h4>CERTIFIED</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-wrench logo-small"></span>
				<h4 style="color: #303030;">HARD WORK</h4>
				<p>Lorem ipsum dolor sit amet..</p>
			</div>
		</div>
	</div>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<h2>Portfolio</h2>
		<br>
		<h4>What we have created</h4>
		<div class="row text-center slideanim">
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="paris.jpg" alt="Paris" width="400" height="300">
					<p>
						<strong>Paris</strong>
					</p>
					<p>Yes, we built Paris</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="newyork.jpg" alt="New York" width="400" height="300">
					<p>
						<strong>New York</strong>
					</p>
					<p>We built New York</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="thumbnail">
					<img src="sanfran.jpg" alt="San Francisco" width="400" height="300">
					<p>
						<strong>San Francisco</strong>
					</p>
					<p>Yes, San Fran is ours</p>
				</div>
			</div>
		</div>
		<br>

		<h2>What our customers say</h2>
		<div id="myCarousel" class="carousel slide text-center"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<h4>
						"This company is the best. I am so happy with the result!"<br>
						<span>Michael Roe, Vice President, Comment Box</span>
					</h4>
				</div>
				<div class="item">
					<h4>
						"One word... WOW!!"<br> <span>John Doe, Salesman, Rep
							Inc</span>
					</h4>
				</div>
				<div class="item">
					<h4>
						"Could I... BE any more happy with this company?"<br> <span>Chandler
							Bing, Actor, FriendsAlot</span>
					</h4>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<!-- Container (Pricing Section) -->
	<div id="pricing" class="container-fluid">
		<div class="text-center">
			<h2>Pricing</h2>
			<h4>Choose a payment plan that works for you</h4>
		</div>
		<div class="row slideanim">
			<div class="col-sm-4 col-xs-12">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Basic</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>20</strong> Lorem
						</p>
						<p>
							<strong>15</strong> Ipsum
						</p>
						<p>
							<strong>5</strong> Dolor
						</p>
						<p>
							<strong>2</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$19</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-xs-12">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Pro</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>50</strong> Lorem
						</p>
						<p>
							<strong>25</strong> Ipsum
						</p>
						<p>
							<strong>10</strong> Dolor
						</p>
						<p>
							<strong>5</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$29</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-xs-12">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h1>Premium</h1>
					</div>
					<div class="panel-body">
						<p>
							<strong>100</strong> Lorem
						</p>
						<p>
							<strong>50</strong> Ipsum
						</p>
						<p>
							<strong>25</strong> Dolor
						</p>
						<p>
							<strong>10</strong> Sit
						</p>
						<p>
							<strong>Endless</strong> Amet
						</p>
					</div>
					<div class="panel-footer">
						<h3>$49</h3>
						<h4>per month</h4>
						<button class="btn btn-lg">Sign Up</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
				<p>Contact us and we'll get back to you within 24 hours.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> Chicago, US
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> +00 1515151515
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>
					myemail@something.com
				</p>
			</div>
			<div class="col-sm-7 slideanim">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<button class="btn btn-default pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Google Maps -->
	<div id="googleMap" style="height: 400px; width: 100%;"></div>
	<script>
		function myMap() {
			var myCenter = new google.maps.LatLng(41.878114, -87.629798);
			var mapProp = {
				center : myCenter,
				zoom : 12,
				scrollwheel : false,
				draggable : false,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document.getElementById("googleMap"),
					mapProp);
			var marker = new google.maps.Marker({
				position : myCenter
			});
			marker.setMap(map);
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCwHq23WcDuRdLYKkxKC-fqeGB4LWtlQD8&callback=myMap"></script>
	<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

	<footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
		<p>
			Bootstrap Theme Made By <a href="https://www.w3schools.com"
				title="Visit w3schools">www.w3schools.com</a>
		</p>
	</footer>

	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {
								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {
									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});

					$(window).scroll(function() {
						$(".slideanim").each(function() {
							var pos = $(this).offset().top;

							var winTop = $(window).scrollTop();
							if (pos < winTop + 600) {
								$(this).addClass("slide");
							}
						});
					});

					var scrollTo = "${scrollTo}";

					if (scrollTo !== "" && scrollTo !== null
							&& scrollTo !== undefined) {
						$('html, body').animate({
							scrollTop : $("#" + scrollTo).offset().top
						}, 50);
					}
				})
	</script>
</body>
</html>
