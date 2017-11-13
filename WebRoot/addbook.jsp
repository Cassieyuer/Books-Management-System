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
    
  	

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   	<form class="form-horizontal" role="form" action="addbook_book" method="post" enctype="multipart/form-data">
	  <div class="form-group">
	    <label for="name" class="col-sm-2 control-label">书籍名字:</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="name" name="book.name" placeholder="请输入名字">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="price" class="col-sm-2 control-label">书籍价格:</label>
	    <div class="col-sm-10">
	      <input type="number" class="form-control" id="price" name="book.price">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="author" class="col-sm-2 control-label">书籍作者:</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="author" name="book.author">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="categoryid" class="col-sm-2 control-label">所属类别:</label>
	    <div class="col-sm-10">
	      <select id="categoryid" name="book.categoryid" class="form-control">
	      	
	      </select>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="publishdate" class="col-sm-2 control-label">出版日期:</label>
	    <div class="col-sm-10">
	      <input type="date" class="form-control" id="publishdate" name="book.publishdate">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="status" class="col-sm-2 control-label">状态:</label>
	    <div class="col-sm-10">
	      <select id="status" name="book.status">
	      	<option value="1">上架</option>
	      	<option value="0">下架</option>
	      </select>
	    </div>
	  </div>
	  <div class="form-group">
	    <button type="button" onclick="addpic()" class="btn btn-primary">添加图片</button>
	    <div class="col-sm-10" id="pics">
	      
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-default">提交</button>
	    </div>
	  </div>
	</form>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script>
    	$(function(){
    		queryAllCas();
    	});
    	
    	function queryAllCas(){
    		$.ajax({
    			url:"queryAllCas_category.action",
    			type:"post",
    			data:"",
    			dataType:"json",
    			success:function(msg){
    				console.log(msg);
    				var ops = "<option value='-1'>===请选择===</option>";
    				$.each(msg,function(i,op){
    					ops += "<option value='"+op.id+"'>"+op.name+"</option>";
    				});
    				$("#categoryid").html(ops);
    			}
    		});
    	}
    
    	var i=0;
    	function addpic(){
    		var ss = "请选择：<input type='file' name='pic'/> 是否是封面：<input type='radio' name='fm' value='"+(i++)+"'>";
    		$("#pics").append(ss);
    	}
    </script>
  </body>
</html>
