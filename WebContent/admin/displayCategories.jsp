<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="hmsModels.*"  %>
     <%@ page import="hmsControllers.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	.form-control{
		margin: 5px;
	}
	.modal-body{
		height: 80px;
	}
	#addCategoryModal .modal-content, #updateCategoryModal .modal-content{
		width: 250px;
	}
</style>
</head>
<body>
<div id="categories" class="tab-pane fade in">
				<h3>카테고리</h3>
				<table class="table table-hover table-bordered" id="tblCategories">
					<thead>
						<tr>
							<th>
								카테고리 번호
							</th>
							<th>
								카테고리 이름 
							</th>
							<th>
								변경 / 삭제
							</th>
						</tr>
					</thead>
					<tbody id="catBody"></tbody>
				</table>
				<button type="button" class="btn btn-success" data-toggle="modal" data-target="#addCategoryModal">카테고리 추가</button>
				
				
				<!-- Add Category Modal-->
				<div id="addCategoryModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
					<form method="POST" id="addCategoryForm" action="../services/category">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title">카테고리 추가</h4>
				      </div>
				      <div class="modal-body">
						  <div class="form-group">
							   <div class="col-lg-12">
							  		<input type="text" class="form-control" name="catName" placeholder="Enter Category"  required/>
							  	</div>
						  </div>
						  
				      </div>
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-success">추가하기</button>
				      </div>
				    </div>
					</form>
				  </div>
				
			</div>
			
			
			
			<!-- Update Category Modal -->
			<div id="updateCategoryModal" class="modal fade" role="dialog">
				  <div class="modal-dialog">
					<form method="PUT" id="updateCategoryForm">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title">카테고리 변경</h4>
				      </div>
				      <div class="modal-body">
						  <div class="form-group">
						   <div class="col-lg-12">
						  		<input type="text" class="form-control" name="catName" placeholder="Enter Category"  required/>
						  	</div>
						  </div>
						  
				      </div>
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-success">변경하기</button>
				      </div>
				    </div>
					</form>
				  </div>
				
			</div>
		</div>
</body>
</html>