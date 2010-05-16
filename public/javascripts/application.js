// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function add_selected_ingredient(id, name)
{
	var ing_ids = document.getElementById('ing_ids');
	var ids = ing_ids.value.split(',');
	for(var i in ids)
	{
		if(ids[i] == id)
			return;
	}
	ing_ids.value += id + ',';
	
	var div = document.getElementById('selected_ing');
	var new_div = document.createElement('div');
	new_div.innerHTML = name;
	new_div.setAttribute('class', 'sel_ing');
	new_div.setAttribute('id', 'ing'+id);
	
	var del_link = document.createElement('a');
	del_link.setAttribute('class', 'del_ing');
	del_link.setAttribute('href', '#');
	del_link.setAttribute('onclick', 'remove_ingredient('+id+')');
	del_link.innerHTML = 'X';
	new_div.appendChild(del_link);
	div.appendChild(new_div);
}

function remove_ingredient(id)
{
	var ings = document.getElementById('selected_ing').childNodes;
	var to_remove = null;
	for(var i in ings)
	{
		if(ings[i].id == 'ing'+id)
		{
			to_remove = ings[i];
		}
	}
	if(to_remove != null)
	{
		document.getElementById('selected_ing').removeChild(to_remove);
	}
	
}
