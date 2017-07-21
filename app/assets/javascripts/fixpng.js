window.attachEvent("onload", fixpng);

function fixpng()
{
    var container = document.getElementById("feathered_container");
    var img = document.getElementById("feathered_image");
    var src = img.src;
    img.style.visibility = "hidden";
    var div = document.createElement("DIV");
    div.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + src + "', sizingMethod='image')";
    img.replaceNode(div);
}
