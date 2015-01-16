//È¥µô×Ö·û´®Á½±ßµÄ¿Õ¸ñ¡£Èç¹û×Ö·û´®Îªnull,Ôò·µ»Ø""
function trim(str){
    return rtrim(ltrim(str));
}
	//È¥µô×Ö·û´®×ó±ßµÄ¿Õ¸ñ
function ltrim(s){
    if(s == null) return "";
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(0)) != -1) {
        var j=0, i = str.length;
        while (j < i && whitespace.indexOf(str.charAt(j)) != -1){
            j++;
        }
        str = str.substring(j, i);
    }
    return str;
}
//È¥µô×Ö·û´®ÓÒ±ßµÄ¿Õ¸ñ
function rtrim(s){
    if(s == null) return "";
    var whitespace = new String(" \t\n\r");
    var str = new String(s);
    if (whitespace.indexOf(str.charAt(str.length-1)) != -1){
        var i = str.length - 1;
        while (i >= 0 && whitespace.indexOf(str.charAt(i)) != -1){
            i--;
        }
        str = str.substring(0, i+1);
    }
    return str;
}