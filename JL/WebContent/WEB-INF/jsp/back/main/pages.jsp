<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	function jumpPage(pages) {
		$("#pages").val(pages);
		$("#pageForm").submit();
	}
</script>
<form id="pageForm" action="${url }" method="post">
	<input id="pages" name="pages" type="hidden">
	<input value="${u_name }" name="u_name" type="hidden">
	<input value="${u_power }" name="u_power" type="hidden">
	<input value="${cli_level }" name="cli_level" type="hidden">
	<input value="${cli_name }" name="cli_name" type="hidden">
	<input value="${brand_state }" name="brand_state" type="hidden">
	<input value="${brand_name }" name="brand_name" type="hidden">
	<div class="row m-b-sm m-t-sm">
		<div class="col-md-2">
			<span style="line-height: 30px;">当前第${pages }页，共 ${sumPage }页</span>
		</div>
		<div class="col-md-5 col-md-offset-5">
			<span class="input-group-btn">
				<button type="button" onclick="jumpPage(1)"
					class="btn btn-sm btn-white">首页</button>
				<button type="button" onclick="jumpPage(${(pages-1>0)?(pages-1):1})"
					class="btn btn-sm btn-white">上一页</button>
				<button type="button"
					onclick="jumpPage(${(pages+1>sumPage)?sumPage:(pages+1)})"
					class="btn btn-sm btn-white">下一页</button>
				<button type="button" onclick="jumpPage(${sumPage})"
					class="btn btn-sm btn-white">尾页</button>
			</span>
		</div>
	</div>
</form>