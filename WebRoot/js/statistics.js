/*
 * zc:20140428修改
 */
var scripts = document.getElementsByTagName("script");
script = scripts[scripts.length-1]; 
src = script.src;
var param_arr = new Array();
param_arr = getUrlParam(src);
if(param_arr['domain'] != 'undefined' && param_arr['domain'] != null){
	DOMAIN_NAME = param_arr['domain'];
} 
if(param_arr['uid'] != 'undefined' && param_arr['uid'] != null){
	USERID = param_arr['uid']; //用户id
}

function getUrlParam(src){	
	var aQuery = src.split("?");//取得Get参数	
    var aGET = new Array();

    if(aQuery.length > 1)
    {
        var aBuf = aQuery[1].split("&"); 
        var iLoop = aBuf.length
        for(var i=0; i<iLoop; i++)
        {
            var aTmp = aBuf[i].split("=");//分离key与Value
            aGET[aTmp[0]] = aTmp[1];          
        }
    }
   return aGET;
}

function JSpost(action,values)
{
	document.write('<form id="stat_param" method="post"'+'>');
	for (var key in values) 
	{
	    document.write('<input type="hidden" name="' + key + '" value="' + values[key] + '" />');
    }
	   document.write('</form>');  
	   document.write('<iframe style="display: none" id="ifFrame"  name="ifFrame" src="about:blank"></iframe>');
	   document.getElementById('stat_param').target="ifFrame";  
	   document.getElementById('stat_param').action= action; 
	   document.getElementById('stat_param').submit();	
}

/**zc:2012-11-08璁＄畻椤甸潰鍋滅暀鏃堕棿**/

window.setInterval("trackTime()",1000);		
var sec = 0;
function trackTime()
{  
  sec++; 
}
window.onunload = function()
{
  setCookie('stay_time',sec);
}
/**椤甸潰鍋滅暀鏃堕棿缁撴潫**/

function userBrowser(){
    var browserName=navigator.userAgent.toLowerCase();
    if(/msie/i.test(browserName) && !/opera/.test(browserName)){
		return(browserName.match(/msie[^;]+/i))
        //return(/msie[\/ ].+\s/i.match(browserName));
    }else if(/firefox/i.test(browserName)){
		if(/firefox[^\s]*\s/i.test(browserName))
			return(browserName.match(/firefox[^\s]*\s/i));
		else if(/firefox[^\s]*$/i.test(browserName))
			return(browserName.match(/firefox[^\s]*$/i))
		else
			return('firefox')
    }else if(/chrome/i.test(browserName) && /webkit/i.test(browserName) && /mozilla/i.test(browserName)){
        if(/chrome[^\s]*\s/i.test(browserName))
			return(browserName.match(/chrome[^\s]*\s/i));
		else if(/chrome[^\s]*$/i.test(browserName))
			return(browserName.match(/chrome[^\s]*$/i))
		else
			return('chrome')
    }else if(/safari/i.test(browserName)){
        if(/safari[^\s]*\s/i.test(browserName))
			return(browserName.match(/safari[^\s]*\s/i));
		else if(/safari[^\s]*$/i.test(browserName))
			return(browserName.match(/safari[^\s]*$/i))
		else
			return('safari')
    }else if(/opera/i.test(browserName)){
        if(/opera[^\s]*\s/i.test(browserName))
			return(browserName.match(/opera[^\s]*\s/i));
		else if(/opera[^\s]*$/i.test(browserName))
			return(browserName.match(/opera[^\s]*$/i))
		else
			return('opera')
    }else if(/webkit/i.test(browserName) &&!(/chrome/i.test(browserName) && /webkit/i.test(browserName) && /mozilla/i.test(browserName))){
        if(/webkit[^\s]*\s/i.test(browserName))
			return(browserName.match(/webkit[^\s]*\s/i));
		else if(/webkit[^\s]*$/i.test(browserName))
			return(browserName.match(/webkit[^\s]*$/i))
		else
			return('webkit')
    }else{
        return("unKnow");
    }
}



function userBrowerScreen()
{
	return(screen.width+'*'+screen.height)
}

function detectOS() {  

    var sUserAgent = navigator.userAgent;  

    var isWin = (navigator.platform == "Win32") || (navigator.platform == "Windows");  

    var isMac = (navigator.platform == "Mac68K") || (navigator.platform == "MacPPC") || (navigator.platform == "Macintosh") || (navigator.platform == "MacIntel");  

    if (isMac) return "Mac";  

    var isUnix = (navigator.platform == "X11") && !isWin && !isMac;  

    if (isUnix) return "Unix";  

    var isLinux = (String(navigator.platform).indexOf("Linux") > -1);  

    if (isLinux) return "Linux";  

    if (isWin) {  

        var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1 || sUserAgent.indexOf("Windows 2000") > -1;  

        if (isWin2K) return "Win2000";  

        var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1 || sUserAgent.indexOf("Windows XP") > -1;  

        if (isWinXP) return "WinXP";  

        var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1 || sUserAgent.indexOf("Windows 2003") > -1;  

        if (isWin2003) return "Win2003";  

        var isWinVista= sUserAgent.indexOf("Windows NT 6.0") > -1 || sUserAgent.indexOf("Windows Vista") > -1;  

        if (isWinVista) return "WinVista";  

        var isWin7 = sUserAgent.indexOf("Windows NT 6.1") > -1 || sUserAgent.indexOf("Windows 7") > -1;  

        if (isWin7) return "Win7";  

    }  

    return "other";  

}  
var userinfo = {'OS':detectOS(),'Browser':userBrowser(),'Screen':userBrowerScreen()}


function record()
{	
	
	var url = window.location.href;  //璁块棶鐨剈rl
	var formerurl = getformerurl();  //杞藉叆涓婃璁块棶鐨剈rl
	var pagetitle =  document.title;  //璁块棶鐨勯〉闈㈠悕绉�
	var formerpagetitle = getformerpage();    //杞藉叆涓婃璁块棶鐨勯〉闈㈠悕绉�
	addurl(url,formerurl,pagetitle,formerpagetitle);
	refresh(url,pagetitle);		

}
//zc:2012-09-29 鍐檆ookie
function setCookie(name,value)
{	
	document.cookie = name + "=" + escape(value) + ";path=/";  
}


//zc:2012-09-29 璇籧ookie
function getCookie(name)
{
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg)) return unescape(arr[2]);
	else return null;
}


//杞藉叆涓婃璁块棶鐨剈rl
function getformerurl()
{
  if(getCookie('formerurl')==null || typeof(getCookie('formerurl'))=='undefined')
	  setCookie('formerurl','BLANKURL');
  return getCookie('formerurl'); 
}

//杞藉叆涓婃璁块棶鐨勯〉闈㈠悕绉�
function getformerpage()
{	 
	if(getCookie('formerpagetitle')== null || typeof(getCookie('formerpagetitle'))=='undefined')
		  setCookie('formerpagetitle','BLANKPAGE'); 
	return getCookie('formerpagetitle'); 
	
}


//鍒锋柊椤甸潰锛屼笉鏀瑰彉cookie
function refresh(url,pagetitle)
{

   setCookie('formerurl',url);
   setCookie('formerpagetitle',pagetitle);
}


function addurl(url,formerurl,pagetitle,formerpagetitle) //鍙戦�缁欏悗鍙版坊鍔犺嚦鏁版嵁搴�
{
	var browser = userBrowser();
	
	if("undefined" != typeof (DOMAIN_NAME))
	{		
		if("undefined" == typeof (USERID))
		{
			USERID = "0";  
		}	
		if("undefined" == typeof (PLACE))
		{
			PLACE = "0";
		}
		if("undefined" == typeof (OBJ))
		{
			OBJ = "0";
		}
		
		//zc:椤甸潰鍋滅暀鏃堕棿
	    time = getCookie('stay_time');
		if(time >1800) {
			 time = 1800;	
		} 		 
		JSpost(
				'http://sns.join-tsinghua.edu.cn/crontab/statistics/get_visitdata.php',{
				//'http://166.111.3.183/crontab/statistics/get_visitdata.php',{
				'domainname':DOMAIN_NAME,
			    'userid':USERID,
			    'url':url,
			    'formerurl':formerurl,
			    'pagetitle':escape(pagetitle),
			    'formerpagetitle':escape(formerpagetitle),
			    'stay_time':time,
			    'OS':detectOS(),
			    'Browser':browser[0],
			    'Screen':userBrowerScreen(),
			    'place':PLACE,
			    'obj':OBJ,
			    'url_domainname': window.location.host
		});
	}
	
}

record();
