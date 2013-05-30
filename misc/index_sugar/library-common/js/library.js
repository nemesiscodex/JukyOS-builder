var selectedSection;
var selectedBundle;

function $(id) { return document.getElementById(id); }

function getElementByClass(searchClass, node, tag)
{
	if (node == null) node = document;
	if (tag == null) tag = '*';
	
	var elements = node.getElementsByTagName(tag);
	var pattern = new RegExp('(^|\\s)'+searchClass+'(\\s|$)');
	
	for (i = 0, j = 0; i < elements.length; i++)
		if(pattern.test(elements[i].className))
			return elements[i];

	return null;
}

function getElementsByClass(searchClass, node, tag)
{
	var results = new Array();
	
	if (node == null) node = document;
	if (tag == null) tag = '*';
	
	var elements = node.getElementsByTagName(tag);
	var pattern = new RegExp('(^|\\s)'+searchClass+'(\\s|$)');
	
	for (i = 0, j = 0; i < elements.length; i++)
	{	
		if(pattern.test(elements[i].className))
			results.push(elements[i]);
	}		

	return results;
}

function selectSection(section, color)
{
    var submenus = getElementsByClass('submenu');
    var submenu;
    for (i = 0; i < submenus.length; i++) {
        submenu = submenus[i];
        submenu.style.display = "none";
    }

    var submenu = $('submenu-' + section);
    submenu.style.display = "block";

    var oldSelectedSection = selectedSection;
    selectedSection = section;
    if (oldSelectedSection) dim($('menu-' + oldSelectedSection));
    //highlight($('menu-' + section),
}

function selectBundle(bundle)
{
    var oldBundle = selectedBundle;
    selectedBundle = bundle;
    if (oldBundle) dim($('submenu-item-' + oldBundle));
    //highlight($('menu-' + section),
}


function highlight(element, newColor)
{
    element.style.background = newColor;
    element.style.color = "#FFF";
}

function dim(element)
{
    if (!(element.id == 'menu-' + selectedSection))
    {
        element.style.background = "#CCC";
        element.style.color = "#000";
    }
}

function subdim(element)
{
    if (!(element.id == 'submenu-item-' + selectedBundle)) {
        element.style.background = "#FFF";
        element.style.color = "#000";
    }
}

