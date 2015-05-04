<#macro page pageInfo url key location="right">
<#assign displayPages = 7 selectedIndex = 3 />
<#assign prePage = pageInfo.currentPage - 1 />
<#assign nextPage = pageInfo.currentPage + 1 />
<#assign startIndex = pageInfo.currentPage + 1 - selectedIndex />
<#if (startIndex < 2)>
	<#assign startIndex = 2 />
</#if>
<#assign endIndex = displayPages - 2 + startIndex - 1 />
<#if (endIndex > pageInfo.maxPage-1)>
	<#assign endIndex = pageInfo.maxPage-1 />
</#if>
<#if (endIndex > pageInfo.maxPage-2)>
	<#assign startIndex = endIndex - displayPages +3 />
</#if>
<#if (startIndex < 2)>
	<#assign startIndex = 2 />
</#if>

<#if (pageInfo.maxPage > 1)>
<div class="page-mod<#if location=='right'> fr<#elseif location=='left'> fl</#if>">
	<#if (prePage > 0)>
		<#assign submitUrl1 = url?replace("{page}", prePage) />
		<a href='javascript:submit("${submitUrl1}")' class="page-prev">上一页</a>
	</#if>
	<@pageTagWrap 1 url pageInfo.currentPage>1<#if (startIndex > 2)>...</#if></@pageTagWrap>
	<#if (startIndex <= endIndex)>
	<#list startIndex..endIndex as i>
  		<@pageTagWrap i url pageInfo.currentPage>${i}</@pageTagWrap>
	</#list>
	</#if>
	<#if (pageInfo.maxPage > 1)>
		<@pageTagWrap pageInfo.maxPage url pageInfo.currentPage><#if (endIndex < pageInfo.maxPage-1)>...</#if>${pageInfo.maxPage}</@pageTagWrap>
	</#if>
	<#if (nextPage <= pageInfo.maxPage)>
		<#assign submitUrl2 = url?replace("{page}", nextPage) />
		<a href='javascript:submit("${submitUrl2}")' class="page-next">下一页</a>
	</#if>
	<#if (pageInfo.maxPage !=pageInfo.currentPage)>
		<#assign submitUrl3 = url?replace("{page}", pageInfo.maxPage) />
		<a href='javascript:submit("${submitUrl3}")' class="page-last">最后页</a>
	</#if>
	<#if (pageInfo.maxPage > 7)>
		<span class="page-go"><em>到第</em><input name="pageNumber" value="${pageInfo.currentPage}" type="text" class="txt" />
		<em>页</em><button type="button" onclick="pageOKButton(this)">确定</button><input name="maxpage" value="${pageInfo.maxPage}" type="hidden" class="txt" /></span>
	</#if>
</div>
</#if>
<script type="text/javascript">
//分页确认按钮	
	function pageOKButton(obj){
		var pageNumber = $(obj).prev().prev().val();
		var maxNumber = $(obj).next().val();		
		pageNumber = $.trim(pageNumber);				
		if(pageNumber != parseInt(pageNumber)){
			App.tips({type: "error", message: "跳转页码必须为数值", autoclose: 3});
			$(obj).prev().prev().focus();
			return false;
		}
		if( parseInt(pageNumber) >parseInt(maxNumber) ){
			App.tips({type: "error", message: "跳转页码大于最大页数", autoclose: 3});
			$(obj).prev().prev().focus();
			return false;
		}
		
		if(pageNumber < 1){
			pageNumber = 1;
		}
		var url = "${url}";
		url = url.replace("\{page\}", pageNumber);
		if ("${key}" != ""){
			url = url + "&key="+encodeURIComponent(key);
		}
		window.location = url;
	}
	
	function submit(url){
		if ("${key}" != ""){
			url = url + "&key="+encodeURIComponent("${key}");
		}
		window.location = url;
	}
</script>
</#macro>

<#macro pageUrl page url>
${url?replace("{page}", page)}
</#macro>

<#macro pageTagWrap page url currentPage>
<#assign submitUrl=url?replace("{page}", page)>
<#if page == currentPage>
<strong><#nested /></strong>
<#else>
<a href='javascript:submit("${submitUrl}")'><#nested /></a>
</#if>
</#macro>
