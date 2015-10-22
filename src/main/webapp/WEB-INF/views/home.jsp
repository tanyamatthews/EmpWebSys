<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Login</title>
	
	
	
<style type="text/css">

/* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

html{
	font-size: 62.5%;
}


body{
	background-color: #3b4664;
	font-family: 'Roboto', 'Open Sans', sans-serif';
}

.container{
	width:960px;
	margin: 0 auto;
	margin-top:30px;
}

.centerText{
	text-align:center;
}

.login h1{
	color:white;
	font-size: 3.6em;
	font-weight:800;
	
}

form{
	margin-left:23%;
	display:block;
	background-color: white;
	border: 1px solid rgba(9,9,9,0.12);
	box-shadow: 0px 6px 9px 0px rgba(0,0,0,0.40);
	border-radius: 8px;
	padding: 30px 30px;
	margin-top:35px;
	width: 450px;
	max-width:450px;
}

label, input, .btn{
	font-size: 1.7em;
}

label{
	display:block;
	color: rgba(0,0,0,0.7);
}

input{
	box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.13);
	border: 1px solid rgba(150,150,150,0.76);
	border-radius: 2px;
	padding-left: 25px;
	margin-top: 25px;
	color: rgba(0,0,0,0.8);
	transition: all 0.5s ease-in-out;
	margin-bottom:5px;
}

input:focus, input:active{
	box-shadow: 0px 1px 3px 0px rgba(0,0,0,0.63);
	border: 1px solid 3b4664;
}

input, .btn{
	width: 100%;
	padding: 12px 12px;
}

.btn{
	background-color: #b6da4d;
	color: white;
	transition: all 0.3s ease-in-out;
	border-radius:4px;
	text-align:center;
	font-weight:800;
	border:none;
	font-size: 2.0em;
}

.btn:hover{
	background-color: #87B933;
}

.form__group{
	margin: 20px 0;
}

.sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}

/*Clearfix */
.clearfix:after {
     visibility: hidden;
     display: block;
     font-size: 0;
     content: " ";
     clear: both;
     height: 0;
     }
.clearfix { display: inline-block; }
/* start commented backslash hack \*/
* html .clearfix { height: 1%; }
.clearfix { display: block; }
/* close commented backslash hack */

</style>

</head>
<body>

<div class="container login">

	<div class="centerText">
	
		<h1>Login</h1>
	
	</div>

	
	
	<form action="login-process" method="POST">
		<fieldset>
			<legend class="sr-only">Login form</legend>
			<div class="form__group clearfix">
				<label for="username">Username</label>
				<input id="username" type="text" name="username">
			</div>
			<div class="form__group clearfix">
				<label for="password">Password</label>
				<input id="password" type="password" name="password">
			</div>
			<input type="submit" name="submit" value="Login" class="btn"/>
		</fieldset>
	</form>

</div>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,100' rel='stylesheet' type='text/css'>

</body>
</html>
