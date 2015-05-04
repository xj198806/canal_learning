

//如果带该关键字，则表示该链接已经进行mapping
var UrlMapKey=StarConfig.UrlMapKey;
//如果带该关键字，则表示将对该链接进行demapping
var UrlDeMapKey=StarConfig.UrlDeMapKey;

var UrlMappedSignal=StarConfig.UrlMappedSignal;
var MappedUrl=StarConfig.UrlMapTo;

function Track(content)
{
    var div=document.createElement("div");
    div.innerHTML=content;
    var aList=div.getElementsByTagName("a")

    var trackAll=document.getElementById("cbxTrack");
    var A,href,innerText, encodedHref,decodedHref,imgList,img,imgSrc,isImg;
    var fileUrlPtn=/file:\/\/.+?/i;
    var mailToPtn=/mailto/i;

    var href;
    for(var i=0;i<aList.length;i++)
    {
        A=aList[i];
        href=decodeURI(A.href);

        if( A.innerHTML=="")
            continue;

        if(href=="")
            continue;

//        //带自定义标签的不作处理
//        if(href.indexOf("{{{")>-1)
//            continue;

        //链接地址是file://...
        if(href.match(fileUrlPtn))
            continue;

        //mailto:...
        if(href.match(mailToPtn))
            continue;

        if(trackAll.checked)
        {
            //选了跟踪，但已跟踪过
            if(href.indexOf(UrlMapKey)>-1 || (href.indexOf(UrlMappedSignal)>-1 && href.indexOf(UrlDeMapKey)==-1) )
                continue;

            UrlMap(A);
        }
        else
        {
            //选了未跟踪，但原先也未跟踪
            if(href.indexOf(UrlDeMapKey)>-1 || (href.indexOf(UrlMappedSignal)==-1 && href.indexOf(UrlMapKey)==-1))
                continue;

            UrlDeMap(A);
        }
    }

    var areaList=div.getElementsByTagName("area");
    var area;
    for(i=0;i<areaList.length;i++)
    {
        area=areaList[i];
        href=decodeURI(area.href);

        if(trackAll.checked)
        {
            if(href.indexOf(UrlMapKey)>-1 || (href.indexOf(UrlMappedSignal)>-1 && href.indexOf(UrlDeMapKey)==-1) )
               continue;
            UrlMap(area);
        }
        else
        {
            if(href.indexOf(UrlDeMapKey)>-1 || (href.indexOf(UrlMappedSignal)==-1 && href.indexOf(UrlMapKey)==-1))
               continue;
            UrlDeMap(area);
        }
    }

    return div.innerHTML;
}


function UrlMap(a)
{
    var innerHtml=a.innerHTML;
    var href=decodeURI(a.href);

    if(href.indexOf(UrlDeMapKey)>-1)
    {
        href=href.replace("&"+UrlDeMapKey,"");
        href=href.replace("?"+UrlDeMapKey,"");
    }
    else
    {
        if(href.indexOf(UrlMapKey)==-1)
        {
            if(HasQuestionMark(href))
                href+="&"+UrlMapKey;
            else
                href+="?"+UrlMapKey;
        }
    }
    a.href=href;
    if(a.tagName=="A")
        a.innerHTML=innerHtml;
}

function UrlDeMap(a)
{
    var href=decodeURI(a.href);
    if(href.indexOf(UrlMapKey)>-1)
    {
        href=href.replace("&"+UrlMapKey,"");
        href=href.replace("?"+UrlMapKey,"");
    }
    else
    {
        if(href.indexOf(UrlDeMapKey)==-1)
        {
            if(HasQuestionMark(href))
                href=href+"&"+UrlDeMapKey;
            else
                href=href+"?"+UrlDeMapKey;
        }
    }
    a.href=href;
}

//判断一个超链接的最后有没有?号,http://www.baidu.com/a.b?
function HasQuestionMark(a)
{
    var i=a.lastIndexOf("/");
    if(i==-1)
        return false;

    var last=a.substring(i);
    if(last.indexOf("?")>-1)
        return true;
    else
        return false;
}