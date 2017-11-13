<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
  	<style>
  		.page-header{
  			margin:2px 0;
  			padding-bottom:1px;
  		}
  		
  		.list-group-item.active, .list-group-item.active:hover, .list-group-item.active:focus {
  			background-color: dimgray;
  		}
  	</style>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="page-header">
	  <img src="image/header.jpg" width="100%" height="280px"/>
	</div>
	
	
	
	
	<nav class="navbar navbar-inverse" role="navigation">
	 <div class="container-fluid">
	   <!-- Brand and toggle get grouped for better mobile display -->
	   <div class="navbar-header">
	     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	       <span class="sr-only">Toggle navigation</span>
	       <span class="icon-bar"></span>
	       <span class="icon-bar"></span>
	       <span class="icon-bar"></span>
	     </button>
	     <a class="navbar-brand" href="#">书籍管理系统</a>
	   </div>
	
	   <!-- Collect the nav links, forms, and other content for toggling -->
	   <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	     <ul class="nav navbar-nav">
	       <li class="active"><a href="#">首页</a></li>
	     </ul>
	     
	     <ul class="nav navbar-nav navbar-right">
	       <li class="dropdown">
	         <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多 <span class="caret"></span></a>
	         <ul class="dropdown-menu" role="menu">
	           <li><a href="#">登录</a></li>
	           <li class="divider"></li>
	           <li><a href="#">注册</a></li>
	         </ul>
	       </li>
	     </ul>
	   </div><!-- /.navbar-collapse -->
	 </div><!-- /.container-fluid -->
	</nav>
	
	
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4">
				<div class="list-group">
				  <a href="welcome.jsp" class="list-group-item active" target="et">
				    书籍管理系统
				  </a>
				  <a href="addca.jsp" class="list-group-item" target="et">添加类别</a>
				  <a href="addbook.jsp" class="list-group-item" target="et">添加书籍</a>
				  <a href="booklist.jsp" class="list-group-item" target="et">书籍列表</a>
				</div>
			</div>
			<div class="col-md-8">
				<iframe name="et" frameborder="0" height="1000px" width="100%" src="welcome.jsp"></iframe>
			</div>
		</div>
	</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
