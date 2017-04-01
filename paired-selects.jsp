<%@ include file="Header.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Demo</title>
<link rel="stylesheet" href="css/ex.css" type="text/css" />
<style type="text/css">

form.demoForm {
    margin: 2em 0 3em;
}

form.demoForm select {
    vertical-align: top;
    margin-right: 1em;
}

select#choices {
    min-width: 140px;
}

</style>
</head>
<body>
    
<h1>Register</h1>

<form action="register1.jsp" method="post" id="demoForm" class="demoForm">

<table><tr>
	<td><h3>Name :</h3></td>
	<td><input type="text" name="nm"></td>
</tr>
<tr>
	<td><h3>Username :</h3></td>
	<td><input type="text" name="unm"></td>
</tr>
<tr>
	<td><h3>Password:</h3></td>
	<td><input type="password" name="pwd"></td>
</tr>
<tr>
	<td><h3>Gender :</h3></td>
	<td><select  name="gen" style="width: 150px">
	<option value="Male">Male</option>
	<option value="FeMale">FeMale</option></td>
</tr>
<tr>
	<td><h3>Date of Join :</h3></td>
	<td><input type="date" name="date"></td>
</tr>
<tr>
	<td><h3>Experience :</h3></td>
	<td><input type="text" name="exp"></td>
</tr>
<tr>
	<td><h3>Branch :</h3></td>
	<td><select  name="branch" style="width: 150px">
	<option value="mumbai">Mumbai</option>
	<option value="delhi">Delhi</option>
	<option value="pune">Pune</option></td>
</tr>
<tr>
	<td><h3>Department :</h3></td>
	<td><!-- <select >
	<option value="eng">Engineering</option>
	<option value="acnt">Accounting</option>
	<option value="mrkt">Marketing</option></select>
 -->
<select name="category">
    <option value="eng">Engineering</option>
    <option value="acnt">Accounting</option>
    <option value="mrkt">Marketing</option> 
</select></td></tr>
<tr>
	<td><h3>SubDepartment :</h3></td>
	<td>
<select name="choices[]" id="choices" >
    <!-- js populates -->
</select>
</td></tr></table>


</form>


<script type="text/javascript">
/*
From JavaScript and Forms Tutorial at dyn-web.com
Find information and updates at http://www.dyn-web.com/tutorials/forms/
*/

// removes all option elements in select list 
// removeGrp (optional) boolean to remove optgroups
function removeAllOptions(sel, removeGrp) {
    var len, groups, par;
    if (removeGrp) {
        groups = sel.getElementsByTagName('optgroup');
        len = groups.length;
        for (var i=len; i; i--) {
            sel.removeChild( groups[i-1] );
        }
    }
    
    len = sel.options.length;
    for (var i=len; i; i--) {
        par = sel.options[i-1].parentNode;
        par.removeChild( sel.options[i-1] );
    }
}

function appendDataToSelect(sel, obj) {
    var f = document.createDocumentFragment();
    var labels = [], group, opts;
    
    function addOptions(obj) {
        var f = document.createDocumentFragment();
        var o;
        
        for (var i=0, len=obj.text.length; i<len; i++) {
            o = document.createElement('option');
            o.appendChild( document.createTextNode( obj.text[i] ) );
            
            if ( obj.value ) {
                o.value = obj.value[i];
            }
            
            f.appendChild(o);
        }
        return f;
    }
    
    if ( obj.text ) {
        opts = addOptions(obj);
        f.appendChild(opts);
    } else {
        for ( var prop in obj ) {
            if ( obj.hasOwnProperty(prop) ) {
                labels.push(prop);
            }
        }
        
        for (var i=0, len=labels.length; i<len; i++) {
            group = document.createElement('optgroup');
            group.label = labels[i];
            f.appendChild(group);
            opts = addOptions(obj[ labels[i] ] );
            group.appendChild(opts);
        }
    }
    sel.appendChild(f);
}

// anonymous function assigned to onchange event of controlling select list
document.forms['demoForm'].elements['category'].onchange = function(e) {
    // name of associated select list
    var relName = 'choices[]';
    
    // reference to associated select list 
    var relList = this.form.elements[ relName ];
    
    // get data from object literal based on selection in controlling select list (this.value)
    var obj = Select_List_Data[ relName ][ this.value ];
    
    // remove current option elements
    removeAllOptions(relList, true);
    
    // call function to add optgroup/option elements
    // pass reference to associated select list and data for new options
    appendDataToSelect(relList, obj);
};

// object literal holds data for optgroup/option elements
var Select_List_Data = {
    
    // name of associated select list
    'choices[]': {
        
        // names match option values in controlling select list
        eng: {
            // optgroup label
            'Free Scripts': {
                text: ['Slider Control', 'Scrollers', 'Banner Rotator'],
                value: ['slider', 'scrollers', 'banner']
            },
            'License': {
                text: ['Scrolling Divs', 'Tooltips', 'Rotate Images'],
                value: ['scroll', 'tooltips', 'rotate']
            }
        },
       acnt: {
            // example without optgroups
            text: ['Random Image', 'Rotate Images', 'Form Class', 'Table Class', 'Order Form'],
            value: ['random', 'rotate', 'form', 'table', 'order']
        },
        mrkt: {
            'Download Demos': {
                // example without values
                text: ['Iframes', 'PHP to JS', 'Unobtrusive JS']
            },
            
            'No Download': {
                text: ['Object Literals', 'Initializing JS', 'JS Errors']
            }
        }
    }
    
};

// populate associated select list when page loads
window.onload = function() {
    var form = document.forms['demoForm'];
    
    // reference to controlling select list
    var sel = form.elements['category'];
    sel.selectedIndex = 0;
    
    // name of associated select list
    var relName = 'choices[]';
    // reference to associated select list
    var rel = form.elements[ relName ];
    
    // get data for associated select list passing its name
    // and value of selected in controlling select list
    var data = Select_List_Data[ relName ][ sel.value ];
    
    // add options to associated select list
    appendDataToSelect(rel, data);
};

</script>

<p>Back to <a href="index.html">index</a> for more demos and information.</p>

</body>
</html>