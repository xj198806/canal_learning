<script type="text/javascript"> 
function sethash(){
    hashH = document.body.scrollHeight;
    urlC = request("returnUrl"); 
    document.getElementById("iframeC").src=urlC+"#"+hashH; 
}
function request(paras){ 
	var url = window.location.href;
	var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
	var paraObj = {}  
	for (i=0; j=paraString[i]; i++){  
		paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
	}  
	var returnValue = paraObj[paras.toLowerCase()];  
	if(typeof(returnValue)=="undefined"){  
		return "";  
	}else{  
		return returnValue; 
	}
}
window.onload=sethash;

</script>
