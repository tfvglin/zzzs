//去掉字符串两边的空格。如果字符串为null,则返回""
function trim(str){
    return rtrim(ltrim(str));
}

//去掉字符串左边的空格
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

//去掉字符串右边的空格
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

//校验是否为空
function isEmpty (s) {
  if (s == null || trim(s) == "") return true;
  return false;
}

//校验是否为整数
//sign - 如果要校验的对象为空，返回该值(必须为boolean型)，默认为false
function isInt(s,sign) {
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
	var re = new RegExp("^-?\\d+$");
	return re.test(s);
}

//校验是否为浮点数
//sign - 如果要校验的对象为空，返回该值(必须为boolean型)，默认为false
function isFloat(s,sign) {
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
	var re = new RegExp("^-?\\d+\\.?\\d*$");
	return re.test(s);
}

//校验是否全部由数字组成
//sign - 如果要校验的对象为空，返回该值(必须为boolean型)，默认为false
function isDigit(s,sign){
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
	var re = new RegExp("^-?\\d+\\.?$");
	return re.test(s);
}

//校验是否全部由字母，数字，下划线组成
//sign - 如果要校验的对象为空，返回该值(必须为boolean型)，默认为false
function isChar(s,sign) {
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
	var re = new RegExp("^[A-Za-z0-9_]*$");
	return re.test(s);
}

//校验是否为email地址
//sign - 如果要校验的对象为空，返回该值(必须为boolean型)，默认为false
function isEmail(s,sign) {
	if (isEmpty(s)) return (arguments.length == 2 && sign == true);
  var emailPat=/^(.+)@(.+)$/;
  var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
  var validChars="\[^\\s" + specialChars + "\]";
  var quotedUser="(\"[^\"]*\")";
  var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
  var atom=validChars + '+';
  var word="(" + atom + "|" + quotedUser + ")";
  var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
  var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");
  var matchArray=s.match(emailPat);
  if (matchArray == null)  return false;
  var user=matchArray[1];
  var domain=matchArray[2];
  if (user.match(userPat) == null)   return false;
  var IPArray = domain.match(ipDomainPat);
  if (IPArray != null) {
    for (var i = 1; i <= 4; i++) {
      if (IPArray[i] > 255) return false;
    }
    return true;
  }
  var domainArray=domain.match(domainPat);
  if (domainArray == null)  return false;
  var atomPat=new RegExp(atom,"g");
  var domArr=domain.match(atomPat);
  var len=domArr.length;
  if ((domArr[domArr.length-1].length < 2) || (domArr[domArr.length-1].length > 3)) {
    return false;
  }
  if (len < 2) return false;
  return true;
}                     

//判断两个值是否相等
//两个参数都必须为数字型（整型或浮点型），否则返回false
function isEqual(one,two){
	if (!isFloat(one) && !isFloat(two)) return false;
	var p1 = parseFloat(one);
	var p2 = parseFloat(two);
	return (p1 == p2);
}

//判断第一个值是否大于第二个值，第一个是要被比较的值，第二个是参照物
//两个参数都必须为数字型（整型或浮点型），否则返回false
function isGreaterThan(one,two){
	if (!isFloat(one) && !isFloat(two)) return false;
	var p1 = parseFloat(one);
	var p2 = parseFloat(two);
	return (p1 > p2);
}

//判断第一个值是否大于第二个值，第一个是要被比较的值，第二个是参照物
//两个参数都必须为数字型（整型或浮点型），否则返回false
function isGreaterEqual(one,two){
	if (!isFloat(one) && !isFloat(two)) return false;
	var p1 = parseFloat(one);
	var p2 = parseFloat(two);
	return (p1 >= p2);
}

//计算字符串的长度，一个汉字算两个字符
String.prototype.realLength = function()
{
  return this.replace(/[^\x00-\xff]/g,"**").length;
}