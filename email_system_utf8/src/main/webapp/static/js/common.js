function Element()
{
}

Element.ShowById=function(id)
{
    var obj=document.getElementById(id);
    if(obj)
        obj.style.display="block";
}

Element.Show=function(obj)
{
    obj.style.display="block";
}

Element.HideById=function(id)
{
    var obj=document.getElementById(id);
    if(obj)
        obj.style.display="none";
}

Element.Hide=function(obj)
{
    obj.style.display="none";
}



Element.GetE=function(id)
{
    return document.getElementById(id);
}

Element.CreE=function(tagName)
{
    return document.createElement(tagName);
}