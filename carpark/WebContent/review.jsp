<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Bootstrap 101 Template</title>
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	
	<div class="container">
	
		<!-- ��� �޴��� -->
		<nav class="navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Ȩ</a>
				</div>
				
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
				
					<!-- �α��� ��ư -->
					<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myLogin">
						Sign in
					</button>
	         		
	         		<!-- �α��θ�� �˾� -->
			      	<div class="modal fade" id="myLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			        	<div class="modal-dialog">
			            	<div class="modal-content">
			               		<div class="modal-header">
			                  		<button type="button" class="close" data-dismiss="modal">
			                     		<span aria-hidden="true">��</span><span class="sr-only">Close</span>
			                  		</button>
			                  		<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			               		</div>
				                <div class="modal-body">
				                
						       		<form class="form-horizontal">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							    			<div class="col-sm-10">
							      				<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
							    			</div>
							  			</div>
										<div class="form-group">
										    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
										    <div class="col-sm-10">
										      <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
										    </div>
										</div>
										<div class="form-group">
										    <div class="col-sm-offset-2 col-sm-10">
										    	<div class="checkbox">
										        	<label>
										          		<input type="checkbox"> Remember me
										        	</label>
										    </div>
										    </div>
										</div>
										<div class="form-group">
										    <div class="col-sm-offset-2 col-sm-10">
										    	<button type="submit" class="btn btn-default">Sign in</button>
										    </div>
										</div>
									</form>
				                
			               		</div>
			            	</div>
			      		</div>
			    	</div>
				
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div><!-- /.container-fluid -->
				
			</div>
				
		</nav>
		<!-- ��� �޴��� -->
		
		<!-- ���� -->
		<div class="row">
		
			<!-- �����޴� -->
			<div class="col-md-2">
				�����޴�
				<ul class="nav nav-pills nav-stacked">
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
					<li><a href="">�޴�</a></li>
				</ul>
			</div>
			<!-- �����޴� -->
		
			<!-- �������� -->		
			<div class="col-md-10">
			
			
			<!-- ���� ��� -->
			<div class="row">
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#review">
					������
				</button>
			</div>
	         		
	        <!-- ������ �˾� -->
			<div class="modal fade" id="review" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			           	<div class="modal-header">
			               	<button type="button" class="close" data-dismiss="modal">
			                    <span aria-hidden="true">��</span><span class="sr-only">Close</span>
			                </button>
			                <center>
				                <h4 class="modal-title" id="myModalLabel">���� ���</h4>
			                </center>
			            </div>
			               	
				        <div class="modal-body">
						    <div class="row">
								<div class="col-md-2">
									<b>����</b>
								</div>
								<div class="col-md-10">
									<label class="radio-inline">
									  	<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 1
									</label>
									<label class="radio-inline">
									 	<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 2
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> 3
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option4"> 4
									</label>
									<label class="radio-inline">
										<input type="radio" name="inlineRadioOptions" id="inlineRadio5" value="option5"> 5
									</label>
								</div>
							</div><hr>
					
							<div class="row">
								<div class="form-group">
									<div class="col-md-2">
										<label for="form-title">����</label>
									</div>
									<div class="col-md-10">
										<input type="text" class="form-control" name="title" id="form-title" placeholder="������ �����ּ���.">
									</div>
								</div>
							</div><hr>
							
							<div class="row">
								<div class="form-group">
									<div class="col-md-2">
										<label for="form-author">����</label>
									</div>
									<div class="col-md-10">
										<textarea class="form-control" rows="10" name="description"  id="form-author" placeholder="������ �����ּ���."></textarea>
									</div>
								</div>
							</div><hr>	
						
							<div class="row">
								<center>
									<p>
					  					<button type="button" class="btn btn-primary btn-lg">���</button>
									</p>
								</center>
							</div>	
						</div>
						               		
					</div>
				</div>
			</div>
			<!-- ���� ��� -->
			
			<!-- ���� ��� -->
			
			
				
			</div><hr>
			<!-- �������� -->
			
		</div><hr>
		<!-- ���� -->
			
		
		<!-- �ϴ� -->
		<div class="row">
			<div class="text-center">�ϴ�</div>
		</div>
		<!-- �ϴ� -->
		
	</div>
	
	

	<!-- body�� ������ �κп� �־�� �� -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>