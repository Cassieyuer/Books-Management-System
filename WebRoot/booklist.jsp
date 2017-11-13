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
    <link href="css/bootstrap-table.css" rel="stylesheet">
    <style type="text/css">
    	.btn-primary{
    		background-color: dimgray;
    		border-color: dimgray;
    	}
    	.btn-primary:hover, .btn-primary:focus, .btn-primary.focus, .btn-primary:active, .btn-primary.active, .open>.dropdown-toggle.btn-primary {
    		background-color: darkslategray;
    		border-color: darkslategray;
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
  	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="headingOne">
	      <h4 class="panel-title">
	        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	          	条件查询
	        </a>
	      </h4>
	    </div>
	    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
	      <div class="panel-body">
	        <form class="form-horizontal" role="form" method="post">
		   		<input type="hidden" name="method" value="addCa"/>
			  <div class="form-group">
			    <label for="name" class="col-sm-2 control-label">书籍名字:</label>
			    <div class="col-sm-8">
			      <input type="text" class="form-control" id="name" name="name" placeholder="请输入名字">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="caid" class="col-sm-2 control-label">所在类别:</label>
			    <div class="col-sm-8">
			      <select id="caid" name="caid" class="form-control"></select>
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="button" id="cx" class="btn btn-default">查询</button>
			      <button type="button" onclick="exportToExcel()" class="btn btn-default">导出到Excel</button>
			    </div>
			  </div>
			</form>
	      </div>
	    </div>
	  </div>
	</div>
   	<table id="tb" class="table table-bordered table-hover table-striped table-condensed">
   		
   	</table>
   	<!-- 模态框 -->
   	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">书籍详情</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" role="form" action="book" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <label for="name" class="col-sm-2 control-label">书籍名字:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="name1" name="name" >
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="price" class="col-sm-2 control-label">书籍价格:</label>
			    <div class="col-sm-10">
			      <input type="number" class="form-control" id="price" name="price">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="author" class="col-sm-2 control-label">书籍作者:</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="author" name="author">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="categoryid" class="col-sm-2 control-label">所属类别:</label>
			    <div class="col-sm-10">
			    	<input type="text" class="form-control" id="categoryid" name="categoryid">
			      <!-- <select id="categoryid" name="categoryid" class="form-control">
			      	
			      </select> -->
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="status" class="col-sm-2 control-label">状态:</label>
			    <div class="col-sm-10">
			      <select id="status" name="status">
			      	<option value="1">上架</option>
			      	<option value="0">下架</option>
			      </select>
			    </div>
			  </div>
			  <div class="form-group">
			          请选择:<input type="file" name="pic" id="pic" />
			    <button type="button" onclick="addpic()" class="btn btn-primary">添加图片</button>
			    <div class="col-sm-10">
			      <div class="row" id="pics">
						  
				  </div>
			    </div>
			 </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- ending -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-table.js"></script>
    <script src="js/bootstrap-table-zh-CN.js"></script>
    <script src="js/ajaxfileupload.js"></script>
    
    <script type="text/javascript">
	    
    	$(function(){
    		queryAllCas();
    		queryData();
    		$("#cx").on("click",function(){
    			//重新请求
    			suibian.bootstrapTable("refresh");
    		});
    		
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
    				$("#caid").html(ops);
    			}
    		});
    	}
    	
    	var suibian="";
    	var os = "";
    	var os1 = "";
    	
    	function queryData(){
		   	suibian = $("#tb").bootstrapTable({
		   		url:"querySome_book.action",
		   		pagination:true,
		   		pageSize:5,
		   		pageList:[5,10,20],
		   		sidePagination:"server",
		   		queryParamsType:"undefined",
		   		queryParams:function(msg){
		   			os = msg.pageNumber;
		   			os1 = msg.pageSize;
		   			console.log(msg);
		   			var params = {
		   					currentPage:msg.pageNumber,
		   					pageSize:msg.pageSize,
		   					name:$("#name").val(),
		   					caid:$("#caid").val()
		   			}
		   			console.log(params);
		   			return params;
		   		},
		   		columns:[{
		   			//field:"id",
		   			title:"编号",
		   			formatter:function(value,row,index){
		   				//return suibian.bootstrapTable("getPage")+index+1;
		   				return (os-1)*os1+index+1;
		   			}
		   		},{
		   			field:"name",
		   			title:"书名"
		   		},{
		   			field:"price",
		   			title:"价格"
		   		},{
		   			field:"author",
		   			title:"作者"
		   		},{
		   			field:"publishdate",
		   			title:"出版日期"
		   		},{
		   			field:"status",
		   			title:"状态"
		   		},{
		   			field:"category.name",
		   			title:"所属类别"
		   		},{
		   			title:"操作",
		   			formatter:function(value,row,index){
		   				var ops = "<button id='del' class='btn btn-danger' href='javascript:void(0)'>删除</button>"+
		   				"&nbsp;&nbsp;<button id='up' class='btn btn-success' onclick=\"queryBookInfo('"+row.id+"')\">显示详情</button>";
		   				return ops;
		   			},
		   			align:"center",
		   			events:etevents
		   		}],
		   		//onClickRow:function(row,element,field){
		   		//	alert("点击"+field+"了");
		   		//}
		   	});
    	}
    	window.etevents={
       			'click #del':function(event,value,row,index){
       				console.log(event);
       				console.log(value);
       				console.log(row);
       				console.log(index);
       				alert("您确定要删除:"+row.id+"记录吗?");
       				$.ajax({
       	    			url:"delbook_book.action",
       	    			type:"post",
       	    			data:"bid="+row.id,
       	    			dataType:"json",
       	    			success:function(msg){
       	    				console.log(msg);
       	    				$("#del").on("click",function(){
       	    	    			//重新请求
       	    	    			suibian.bootstrapTable("refresh");
       	    	    		});
       	    			}
       	    		});
       			},
    	    	'click #up':function(event,value,row,index){
    				
    			}	
        	};
    	
    	var bookid;
    	function queryBookInfo(id){
    		bookid = id;
    		$.post("queryBookInfo_book.action",
    				"queryid="+id,
    				showbook,
    				"json");
    	}
    	
    	function showbook(msg){
    		console.log(msg);
    		$("#name1").val(msg.b.name);
    		$("#author").val(msg.b.author);
    		$("#price").val(msg.b.price);
    		$("#status").val(msg.b.status);
    		$("#categoryid").val(msg.b.category.name);
    		
    		var ss="";
    		$.each(msg.bps,function(i,bp){bp.savepath
    			ss += "<div class='col-sm-6 col-md-4'>"+
    					"<div class='thumbnail'>"+
    						"<img src='<%=path%>"+bp.savepath+"'>"+
   							"<div class='caption'>"+
   								"<button type='button' class='btn btn-primary' onclick=\"setfm('"+bp.id+"')\">设置为封面</button>"+
   								"<button type='button' class='btn btn-danger' onclick=\"delpic('"+bp.id+"')\">删除</button>"+
   							"</div>"+
    					"</div>"+
    				"</div>";
    		});
    		$("#pics").html(ss);
    		
    		$("#myModal").modal("show");
    	}
    	
    	function delpic(id){
    		$.post("deletePic_book.action",
    				"pid="+id,
    				function(msg){
		    			if(msg.flag=="success"){
		    				queryBookInfo(bookid);
		    			}
		    		},
    				"json");
    	}
    	
    	
    </script>
  </body>
</html>
