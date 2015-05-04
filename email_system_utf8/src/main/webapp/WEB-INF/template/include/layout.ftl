<#include "/include.ftl" />  
<#macro standard title="" keywords="" description="">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="${sbsPathCss}/app/view/view-min.css?v=${jsCssVersion}"/>
<link rel="stylesheet" href="${sbsPathCss}/app/love/love-invite.css?v=${jsCssVersion}"/>
<link rel="stylesheet" href="${sbsPathCss}/app/love/love-blind.css?v=${jsCssVersion}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript">
    var AM_Config = {
        baseUrl: "${sbsPathJs}/forum",
        baseVersion:"?v=${jsCssVersion!}"
    };
    var pageLoadStartTime = parseInt((new Date()).getTime());
    var channel='hangzhou';
    </script>
<script type="text/javascript" src="${sbsPathJs}/forum/AM.js?v=${jsCssVersion!}"></script>
<#assign seoTitle=title>
<#assign seoDescription=description>
<#assign seoKeywords=keywords>

<title>${seoTitle}</title>
<meta name="keywords" content= "${seoKeywords}" />
<meta name="description" content="${seoDescription}" />
<script language="javascript">pageLoadStartTime=parseInt((new Date()).getTime());</script>
</head>

<body>
	<#-- header nav START  -->
 	<#if navHtml?exists>
 		${navHtml}
 	<#else>
 	</#if>
	 
 	<#-- header nav END -->
	<#-- content -->
	<#nested/>
	
	<#-- footer start -->
	${publish["11"]!}	
	<#-- footer end -->
	<#-- bottom js -->

    <script type="text/javascript" src="http://dm.19lou.com/dm2011_city.js"></script>
</body>
</html>
</#macro>