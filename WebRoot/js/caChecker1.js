/**
CopyRight(c) Ant Software Studio
time:09/07/14
Version:1.0.2
*/

var rightImagePath = "<span style='background:url(/styles/bz/wsbm/content/images/messageiconr1.png) no-repeat;width:250px;height:36px;_display:inline;padding-left:30px;margin-top:5px;'/>";
var wrongImagePath = "<span style='background:url(/styles/bz/wsbm/content/images/messageiconw1.png) no-repeat;width:250px;height:36px;_display:inline;padding-left:30px;margin-top:5px;'/>";

Namespace=new Object();
Namespace.register=function(fullNS){
	var nsArray=fullNS.split('.');
	var sEval="";
	var sNS="";
	for(var i=0;i<nsArray.length;i++){
		if(i!=0)
			sNS+=".";
		sNS+=nsArray[i];
		sEval+="if (typeof("+sNS+") == 'undefined') "+sNS+" = new Object();"
		}

	if(sEval!="")
		eval(sEval);
	};

Namespace.register("AntSoft.CHK");

AntSoft.CHK.caChecker=function(){
	this.CACF=new Array();
	this.cacfIdx=0;
	 };

	
	CACHK=new AntSoft.CHK.caChecker();

AntSoft.CHK.caChecker.prototype.addLoadEvent=function(func){
	var oldonload=window.onload;
	if(typeof window.onload!='function'){
		window.onload=func;
	}else{
		window.onload=function(){
			oldonload();
			func();
		}
	}
	};


AntSoft.CHK.caChecker.prototype.registElementEvent=function(event,elemObj,func,eventName){
	
	try{
		var oldEvent=eval("elemObj."+eventName);
		if(typeof eval("elemObj."+eventName)!='function'){
			eval("elemObj."+eventName+" = func;");
		}else{
			eval("elemObj."+eventName+" = function(event) {"+"if(func(event)){"+"return oldEvent(event);"+"}else{"+"return false;"+"}"+"}");
		}
	}catch(err){
			//var txt="本页中存在错误。\n\n"
   			//txt+="错误描述：" + err.description + "\n\n"
   			//txt+="点击“确定”继续。\n\n"
   			//alert(txt);
	}
};

AntSoft.CHK.caChecker.prototype.formCheckRole=function(formName,role){
	
	this.formName=formName;
	this.role=role;
};

AntSoft.CHK.caChecker.prototype.addCheckForm=function(formName,checkRole){
	this.CACF[this.cacfIdx++]=new this.formCheckRole(formName,checkRole);
};

AntSoft.CHK.caChecker.prototype.formSubmitProxy=function(event){
	var obj=CACHK.getElementByEvent(event);
	for(var i=0;i<CACHK.CACF.length;i++){
		var ca=CACHK.CACF[i];
		var formObj=CACHK.getFormObjectByName(ca.formName);
		if(formObj==obj){
			var roleList=CACHK.getRoleList(ca.role,formObj);
			var result=true;
			for(var j=0;j<roleList.length;j++){
				var rl=roleList[j];
				result=eval("CACHK.chk_"+rl.roleType.toLowerCase()+"(rl.elemObj,rl);");
				if(!result)
				//alert('c');
					return false;
				}
				//alert('c');

			return result;
			}
	}

	alert("Form:"+formName+" have not found!");
	return false;
};



AntSoft.CHK.caChecker.prototype.getFormObjectByName=function(formName){
	if(/^[0-9]/.test(formName)){
		return document.forms[formName];
		}else{
			var spName=formName.split("-");
			var target=null;
			if(spName.length==1){
				var forms=document.getElementsByName(spName);
				if(this.isNULL(forms)){
					return null;
					}else{
						return forms[0];
						}
				}else{
					var forms=document.getElementsByName(spName[0]);
					if(this.isNULL(forms)){
						return null;
						}else{
							var vv=forms[parseInt(spName[1])];
							if(this.isNULL(vv)){
								return null;
								}else{
									return vv;
									}
							}
					}
			}
	};

AntSoft.CHK.caChecker.prototype.getElementByFormAndElemNameOrIndex=function(formAndElemNameOrIndex,roleFormObj){
	if(this.isNULL(formAndElemNameOrIndex)){
		return null;
		}

	var spFNI_FN=formAndElemNameOrIndex.split("*");
	if(spFNI_FN.length==1){
		var result=/^[0-9]/.test(formAndElemNameOrIndex);
		if(result){
			eval("var elemObj = "+"roleFormObj.elements["+formAndElemNameOrIndex+"];");
			return elemObj;
			}else{
				var elemObj=CACHK.getElementByName(roleFormObj,formAndElemNameOrIndex);
				return elemObj;
				}
		}else if(spFNI_FN.length>2){
			alert("规则格式有误.");
			return null;
			}else{
				var formRoles=spFNI_FN[0].split("-");
				var elemRoles=spFNI_FN[1].split("-");
				if(formRoles.length==1&&elemRoles.length==1){
					var formObj=CACHK.getFormObjectByName(formRoles[0]);
					if(formObj!=null){
						var result=/^[0-9]/.test(elemRoles[0]);
						if(result){
							eval("var eObj = "+"formObj.elements["+elemRoles[0]+"];");
							return eObj;
							}else{
								eval("var eObj = formObj."+elemRoles[0]+";");
								return eObj;
								}
						}else{
							return null;
								}
					}else if(formRoles.length==1&&elemRoles.length==2){
						var formObj=CACHK.getFormObjectByName(formRoles[0]);
						if(formObj!=null){
							eval("var eObj = formObj."+elemRoles[0]+"["+elemRoles[1]+"]");
							return eObj;
							}else{
								return null;
								}
						}else if(formRoles.length==2&&elemRoles.length==2){
							var formObj=CACHK.getFormObjectByName(spFNI_FN[0]);
							if(formObj!=null){
								eval("var eObj = formObj."+elemRoles[0]+"["+elemRoles[1]+"]");
								return eObj;
								}else{
									return null;
									}
							}else if(formRoles.length==2&&elemRoles.length==1){var formObj=CACHK.getFormObjectByName(spFNI_FN[0]);if(formObj!=null){if(/^[0-9]/.test(elemRoles[0])){eval("var eObj = "+"formObj.elements["+elemRoles[0]+"];");return eObj;}else{eval("var eObj = "+"formObj."+elemRoles[0]+";");return eObj;}}else{return null;}}else{return null;}}};


AntSoft.CHK.caChecker.prototype.showErrorsMessage=function(elem,role,errString){
	var args=arguments[3];
	if(!CACHK.isNULL(args)&&!args)
		return;
	var msgInfo=role.elemDesc+errString;
	if(role.elemDesc.indexOf("!@")!=-1)msgInfo=role.elemDesc.replace("!@","");
	ymPrompt.alert(msgInfo,null,null,'重要提示','');
	
	elem.focus();
	elem.select();
	};


//显示错误信息
AntSoft.CHK.caChecker.prototype.showErrorsHTML=function(elem,role,errString){
	var args=arguments[3];
	if(!CACHK.isNULL(args)&&!args)
		return;
	var elemClsName="cachk_elem_error alert";
	var reClassName="cachk_elem_reset";
	var elemName=elem.getAttribute("className");
	var targetClassName="";
	elemName=CACHK.isNULL(elemName)?elem.getAttribute("class"):elemName;
	if(!CACHK.isNULL(elemName)){
		elemName=CACHK.trim(elemName.replace(reClassName,""));
		if(elemName.indexOf(elemClsName)==-1){
			targetClassName=elemName+" "+elemClsName;
			}else{
				targetClassName=elemName;
				}
		}else{
			targetClassName=" "+elemClsName;
		}
		
	CACHK.setElementClassName(elem,targetClassName);
	var infoLayout=CACHK.makeInfoLayoutElement(role);
	
	if(infoLayout){
		infoLayout.style.display="";
		infoLayout.className = "cachk_errorsLayout1";
	}
	var msgInfo=role.elemDesc+errString;
	if(role.elemDesc.indexOf("!@")!=-1){
		msgInfo=role.elemDesc.replace("!@","");
	}
	infoLayout.innerHTML= role.wrongImagePath + msgInfo;
	
	//弹出alert提示
	if(null != msgInfo && msgInfo.length >0){
		//ymPrompt.alert(msgInfo); 
		ymPrompt.alert(msgInfo,null,null,'重要提示','');
	}/*else{
		alert("成绩信息输入非法!");
	}*/
};

//显示正确信息
AntSoft.CHK.caChecker.prototype.showRightsHTML=function(elem,role){
	var args=arguments[3];
	if(!CACHK.isNULL(args)&&!args)
		return;
	var str  = role.elemObj.className;
	var temp = "";
	if(str.indexOf("size")!=-1){
		temp = str.substring(str.indexOf("size"),str.indexOf("size")+6);
	}
	if(role.elemObj.type != "select-one"){
		str = "inp "+ temp;
		
		if(role.elemObj.type=="textarea"||role.elemObj.type=='_moz'){
			CACHK.setElementClassName(elem,temp);//防止不同size的inp在验证时变更大小
		}else{
			CACHK.setElementClassName(elem,str);//防止不同size的inp在验证时变更大小
		}
		
	}else{
		CACHK.setElementClassName(elem,temp);//下拉框选择正确后不再显示错误样式 add by wangxinyi 20130531
	}
	var infoLayout=CACHK.makeInfoLayoutElement(role);
	if(infoLayout){
		infoLayout.style.display="";
		infoLayout.className = "";
	}
	var msgInfo= role.rightImagePath;
	infoLayout.innerHTML=msgInfo;
};

//显示初始化信息
AntSoft.CHK.caChecker.prototype.showInitHTML=function(elem,role){
	var args=arguments[3];
	if(!CACHK.isNULL(args)&&!args)
		return;
	if(role.elemObj.type != "select-one"){
	var str  = role.elemObj.className;
	var temp = "";
	if(str.indexOf("size")!=-1){
		temp = str.substring(str.indexOf("size"),str.indexOf("size")+6);
	}
	
		if(role.elemObj.type=="textarea"||role.elemObj.type=='_moz'){
			CACHK.setElementClassName(elem,temp);//防止不同size的inp在验证时变更大小
		}else{
			str = "inp "+ temp;
			CACHK.setElementClassName(elem,str);//防止不同size的inp在验证时变更大小
		}
		
	}
	var infoLayout=CACHK.makeInfoLayoutElement(role);
	if(infoLayout){
		infoLayout.style.display="";
		infoLayout.className = "";
	}
	var msgInfo= "";
	infoLayout.innerHTML=msgInfo;
};

AntSoft.CHK.caChecker.prototype.setElementClassName=function(elemObj,className){
	if("\v"=="v"){
		elemObj.setAttribute("className",className);
	}else{
		elemObj.setAttribute("class",className);
		}
	};


//--信息布局
AntSoft.CHK.caChecker.prototype.makeInfoLayoutElement=function(role){
	var elem=role.elemObj;
	var elemName,elemAlt;
	elemName=elem.getAttribute("name");

	if(CACHK.isNULL(elemName)){
		elemAlt=elem.getAttribute("alt");
	}

	var elemMaker=function(attrName,attrValue){
		var newElement=document.createElement('span');
		//CACHK.setElementClassName(newElement,className);
		newElement.setAttribute(attrName,attrValue);
		newElement.appendChild(document.createTextNode(""));
		return newElement;
	};
		
	if(CACHK.isNULL(elemAlt)&&CACHK.isNULL(elemName)){
				if(elem){
					var newElement=elemMaker("alt",role.elemDesc);
					elem.setAttribute("alt",role.elemDesc);
					CACHK.insertAfter(newElement,elem);
					return newElement;
				}
			  return null;
	}else if(!CACHK.isNULL(elemName)){//执行这里
				var targetLayoutId=elemName+"_InfoLayout";
				var nextObj=CACHK.getNextElement(elem.nextSibling);

				if(nextObj!=null&&nextObj.nodeName.toLowerCase()=="span"){
					var infoLayoutId=nextObj.getAttribute("id");
					if(!CACHK.isNULL(infoLayoutId)&&infoLayoutId==targetLayoutId){
						return nextObj;
					}else{
							var newElement=elemMaker("id",targetLayoutId);
							CACHK.insertAfter(newElement,elem);
							return newElement;
					}
			}else{
						var newElement=elemMaker("id",targetLayoutId);
						CACHK.insertAfter(newElement,elem);
						return newElement;
			}
					
	 }else if(!CACHK.isNULL(elemAlt)){
					var nextObj=CACHK.getNextElement(elem.nextSibling);
					if(nextObj!=null&&nextObj.nodeName.toLowerCase()=="span"){
						var altString=nextObj.getAttribute("alt");
						if(!CACHK.isNULL(altString)&&altString==elemAlt){
							return nextObj;
							}else{
								var newElement=elemMaker("alt",elemAlt);
								CACHK.insertAfter(newElement,elem);
								return newElement;
								}
						}else{
							var newElement=elemMaker("alt",elemAlt);
							CACHK.insertAfter(newElement,elem);
							return newElement;
					}				
		}
		};
		
		
AntSoft.CHK.caChecker.prototype.showErrors=CACHK.showErrorsMessage;

//错误信息设置
AntSoft.CHK.caChecker.prototype.ERROR_STYLE=0;
AntSoft.CHK.caChecker.prototype.setErrorStyle=function(errStyle){
	CACHK.showErrors=(CACHK.ERROR_STYLE=errStyle)==0?CACHK.showErrorsMessage:CACHK.showErrorsHTML;
};



AntSoft.CHK.caChecker.prototype.isNULL=function(obj){
	if(typeof(obj)=='undefined'||obj==null||(obj+"")==""){
		return true;
		}else{
			return false;
			}
	};



AntSoft.CHK.caChecker.prototype.initCACF=function(event){
	
	for(var i=0;i<CACHK.CACF.length;i++){
		var formObj=CACHK.getFormObjectByName(CACHK.CACF[i].formName);
		CACHK.registElementEvent(event,formObj,CACHK.formSubmitProxy,"onsubmit");
		if(CACHK.ERROR_STYLE==1){
			CACHK.initHtmlErrorStyle(CACHK.CACF[i],formObj,event);
			}
		}
	};



AntSoft.CHK.caChecker.prototype.initHtmlErrorStyle=function(formRoles,formObj,event){
	var roleList=CACHK.getRoleList(formRoles.role,formObj);
		for(var i=0;i<roleList.length;i++){
			CACHK.registElementEvent(event,roleList[i].elemObj,CACHK.proxyCheckFunction,"onblur");
			CACHK.registElementEvent(event,roleList[i].elemObj,CACHK.resetCheckState,"onfocus");
		}
	};


AntSoft.CHK.caChecker.prototype.getRoleByEvent=function(event){
		var obj=CACHK.getElementByEvent(event);
		var formObj=null;
		for(var i=0;i<CACHK.CACF.length;i++){
			var ca=CACHK.CACF[i];
			formObj=CACHK.getFormObjectByName(ca.formName);
			if(formObj==obj){
				break;
			}
		}
		var roleList=CACHK.getRoleList(ca.role,formObj);
		var curRoleList=[];
		for(var i=0;i<roleList.length;i++){
			var rl=roleList[i];
			if(obj==rl.elemObj){
				curRoleList[curRoleList.length]=rl;
			}
		}
		return curRoleList;
	}


AntSoft.CHK.caChecker.prototype.resetCheckState=function(event){
	
	if(CACHK.ERROR_STYLE == 0)
		return;
	
	var curRole=(event&&event.elemDesc&&event.formObj&&event.elemObj)?event:CACHK.getRoleByEvent(event)[0];
	//alert(CACHK.getRoleByEvent(event)[0]);
	var chkInfoLayout=CACHK.makeInfoLayoutElement(curRole);
	
	chkInfoLayout.className="cachk_initsLayout1";
	chkInfoLayout.innerHTML=curRole.infoMessage;
	chkInfoLayout.style.display="inline";
	
	if(curRole.elemObj.type != "select-one"){
	
	var str  = curRole.elemObj.className;
	
	if(str.indexOf("cachk_elem_reset")!=-1){//del alert by wangxinyi 20130531
		str = str.replace("inp","inp cachk_elem_reset");
	}
	
	CACHK.setElementClassName(curRole.elemObj,str);
		
	
	}
	
	/*
	var curElem=curRole.elemObj;
	if(!event||!event.elemDesc||!event.formObj||!event.elemObj)
		curElem.select();
	var reClassName="cachk_elem_reset";
	var elemClsName="cachk_elem_error";
	var targetClassName="";
	var curClsName=curElem.getAttribute("className");
	curClsName=CACHK.isNULL(curClsName)?curElem.getAttribute("class"):curClsName;
	if(CACHK.isNULL(curClsName)){
		targetClassName=" "+reClassName;
	}else{
			curClsName=CACHK.trim(curClsName.replace(elemClsName,""));
			if(curClsName.indexOf(reClassName)==-1){
				targetClassName=curClsName+" "+reClassName;
				}else{
					targetClassName=curClsName;
					}
	}
	CACHK.setElementClassName(curElem,targetClassName);*/
};



AntSoft.CHK.caChecker.prototype.proxyCheckFunction=function(event){
	
	var curRoles=CACHK.getRoleByEvent(event);
	var result=true;
	for(var i=0;i<curRoles.length;i++){
		result=eval("CACHK.chk_"+curRoles[i].roleType.toLowerCase()+"(curRoles[i].elemObj,curRoles[i]);");
		if(!result)
			return result;
		}
		return result;
	};


AntSoft.CHK.caChecker.prototype.getElementByEvent=function(ev){
	var ee=window.event?window.event:ev;
	var elem=ee.srcElement?ee.srcElement:ee.target;
	return elem;
	};



AntSoft.CHK.caChecker.prototype.ROLE=function(elemObj,roleType,roleIf,elemDesc,formObj,infoMessage,rightImagePath,wrongImagePath){
	this.elemObj=elemObj;
	this.roleType=roleType;
	this.roleIf=roleIf;
	this.elemDesc=elemDesc;
	this.formObj=formObj;
	this.infoMessage=infoMessage;
	this.rightImagePath=rightImagePath;
	this.wrongImagePath=wrongImagePath;
};


AntSoft.CHK.caChecker.prototype.getRoleList=function(aryRole,formObj){
	var lst=[];
	var loop=0;
	for(var i=0;i<aryRole.length;i++){
		var spRole=aryRole[i].split("|");
		var elemIndex=spRole[0];
		var roleType=spRole[1];
		var roleIf=spRole[2];
		var elemDesc=spRole[3];
		var elemObj=spRole[0];
		var infoMessage=spRole[4];
		var rightImagePath=spRole[5];
		var wrongImagePath=spRole[6];
		if(/^[0-9]/.test(elemIndex)){
			elemObj=eval("formObj.elements["+elemIndex+"]");
			}else{
				elemObj=this.getElementByName(formObj,elemIndex);
				}
		lst[loop++]=new this.ROLE(elemObj,roleType,roleIf,elemDesc,formObj,infoMessage,rightImagePath,wrongImagePath);
		}
	return lst;
	};


AntSoft.CHK.caChecker.prototype.getElementByName=function(formObj,elemName){
	if(formObj==null)
		return -1;
	var elems=formObj.elements;
	var enSp=elemName.split("-");
	if(enSp.length==1){
		eval("var elObj = formObj."+elemName+";");
		return elObj;
		}else if(enSp.length==2){
			eval("var elObj = formObj."+enSp[0]+"["+enSp[1]+"];");
			return elObj;
			}
	};

	
	
AntSoft.CHK.caChecker.prototype.CreateXmlHttpRequest=function (){
		if (window.ActiveXObject){
		  var activexName = ["MSXML2.XMLHTTP","Microsoft.XMLHTTP"];
        	for (var i = 0; i < activexName.length; i++) {
           	 try{
                //取出一个控件名进行创建，如果创建成功就终止循环
                //如果创建失败，回抛出异常，然后可以继续循环，继续尝试创建
                return   new ActiveXObject(activexName[i]);
                break;
            } catch(e){
             alert("e==="+e);
            }
        }
			return new ActiveXObject("Microsoft.XMLHTTP");
		}else if (window.XMLHttpRequest){
			return new XMLHttpRequest();
		}
	};

//验证姓名是否已经被注册
AntSoft.CHK.caChecker.prototype.chk_existuser=function(elem,role){
	while(CACHK.ajaxCheckUser(elem,role)){
		return true;
		break;
	}
  	return false;
} ;
AntSoft.CHK.caChecker.prototype.ajaxCheckUser=function(elem,role){
		var flag = false;
		var xmlHttpRequest = CACHK.CreateXmlHttpRequest();
    	var username = elem.value ;
 		var url = "/bz/wsbm/servlet/CheckUserNameServlet?id="+username;
 		xmlHttpRequest.onreadystatechange = function(){
 				try{
					if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200 ){
						var result = xmlHttpRequest.responseText ;//responseXML
						if(result=="false"){
							CACHK.showErrors(elem,role,"已经被注册！",arguments[2]);
				 		}
				 		if(result=="true"){
				 			CACHK.showRightsHTML(elem,role);
				 			flag = true;
				 		}
				 	}
				 }catch(e){
			 	 	alert("e="+e.message);
			     }
 		}
 		xmlHttpRequest.open("get",url,true);
 		xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  		xmlHttpRequest.send(null);
  		return flag;
}


AntSoft.CHK.caChecker.prototype.RegularChecker=function(pattern,chkStr){
	chkStr=CACHK.trim(chkStr);
	var result=pattern.test(chkStr);
	return result;
	};


AntSoft.CHK.caChecker.prototype.isArray=function(object){
	return object!==null&&typeof object==='object'&&object.splice&&object.join&&object.sort;
	};


AntSoft.CHK.caChecker.prototype.splat=function(object){
	return CACHK.isArray(object)?object:[object];
	};

//----验证规则 start	
AntSoft.CHK.caChecker.prototype.checkDate=function(targetStr,roleStr){
	var v=targetStr;
	var format=roleStr||'y-m-d';format=CACHK.splat(format).join('-');
	var k=format.replace(/[^ymd]/g,'');
	var t=['\\','\\\\','/','\\/','.','\\.','d','(\\d{2})','y','(\\d{4})','m','(\\d{2})'];
	for(var i=0,c=t.length;i<c;i+=2){
		format=format.replace(t[i],t[i+1]);
		}
	var result=true;
	var m=v.match(new RegExp('^'+format+'$'));
	if(!m){
		result=false;
		}else{
			var posy=k.indexOf('y');
			var posm=k.indexOf('m');
			var posd=k.indexOf('d');
			var year=posy!=-1?m[posy+1]:0;
			var month=posm!=-1?m[posm+1]:0;
			var day=posd!=-1?m[posd+1]:0;
			var now=new Date();
			if(year&&year.length==2){
				year=2000+year;
				year=year>now.getFullYear()?year-1000:year;
				}
			year&&now.setFullYear(year);
			month&&now.setMonth(month-1);
			day&&now.setDate(day);
			if(year&&now.getFullYear()!=year||month&&now.getMonth()!=month-1||day&&now.getDate()!=day){
				result=false;
				}
			}
	return result;
	};

AntSoft.CHK.caChecker.prototype.checkTime=function(targetStr){
	var v=targetStr;
	var m=v.match(/^(\d{1,2}):(\d{1,2})(:(\d{1,2}))?$/);
	var result=true;
	if(!m){
		result=false;
	}else{
		result=parseInt(m[1])<24&&parseInt(m[2])<60&&(!m[4]||parseInt(m[4])<60);
		}
	return result;
	};
	
AntSoft.CHK.caChecker.prototype.chk_len=function(elem,role){
	//如果为空
	if(CACHK.trim(elem.value) == null || CACHK.trim(elem.value).length == 0){
		CACHK.showInitHTML(elem,role);
		return true;
	}
	//eval("var result = CACHK.trim(elem.value).replace(/[^\\x00-\\xff]/g,'**').length "+role.roleIf+";");
	eval("var result = CACHK.trim(elem.value).length "+role.roleIf+";");
	var prefixs=["==","<=",">=","!=",">","<"];
	var prefixsValue=["等于","小于或等于","大于或等于","不等于","大于","小于"];
	var strRoleIf=role.roleIf;
	for(var i=0;i<prefixs.length;i++){
		strRoleIf=strRoleIf.replace(prefixs[i],prefixsValue[i]);
	}
	if(!result){
		CACHK.showErrors(elem,role,"长度必须"+strRoleIf+"字符",arguments[2]);
		return false;
	}else{
		CACHK.showRightsHTML(elem,role);
		return true;
	}	
};
	
AntSoft.CHK.caChecker.prototype.chk_select=function(elem,role){
	eval("var result = CACHK.trim(elem.value).length "+role.roleIf+";");
	var prefixs=["==","<=",">=","!=",">","<"];
	var prefixsValue=["等于","小于或等于","大于或等于","不等于","大于","小于"];
	var strRoleIf=role.roleIf;
	for(var i=0;i<prefixs.length;i++){
		strRoleIf=strRoleIf.replace(prefixs[i],prefixsValue[i]);
		}
	if(!result){
		CACHK.showErrors(elem,role,"长度必须"+strRoleIf,arguments[2]);
		return false;
		}
	return true;
	};

AntSoft.CHK.caChecker.prototype.chk_url=function(elem,role){
	var _str=elem.value;
	if(CACHK.trim(_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?\/?/i,_str);
	if(!result){
		CACHK.showErrors(elem,role,"无效",arguments[2]);
		return false;
		}
	return true;
	};

AntSoft.CHK.caChecker.prototype.chk_mail=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"无效",arguments[2]);
	}else{
		CACHK.showRightsHTML(elem,role);
	}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_empty=function(elem,role){
	if(role.roleIf==1){
		if(CACHK.trim(elem.value)!=''){
			CACHK.showErrors(elem,role,"只能为空",arguments[2]);
			return false;
			}
		}else{
			if(CACHK.trim(elem.value)==''){
				CACHK.showErrors(elem,role,"不能为空",arguments[2]);
				return false;
				}
			}
			
	CACHK.showRightsHTML(elem,role);		
	return true;
	};
	
//20101029 lvx add	bszzsqEmpty
AntSoft.CHK.caChecker.prototype.chk_bszzsqempty=function(elem,role){
	if(role.roleIf==1){
			//alert(elem.value);
			if(CACHK.trim(elem.value)!=''){
				CACHK.showErrors(elem,role,"只能为空",arguments[2]);
				return false;
			}
	}else{
			//保送自主下自主申请类别.不判断必填项是否为空.
			if('2' != document.getElementById("sqlbm").value){
				if(CACHK.trim(elem.value)==''){
					CACHK.showErrors(elem,role,"不能为空",arguments[2]);
					return false;
				}
			}
	}
			
	CACHK.showRightsHTML(elem,role);		
	return true;
};
	

//20090909 lvx add中学验证规则
AntSoft.CHK.caChecker.prototype.chk_school=function(elem,role){
	if(role.roleIf==1){
		if(CACHK.trim(elem.value)!=''){
			CACHK.showErrors(elem,role,"",arguments[2]);
			return false;
		}
	}else{
		if(CACHK.trim(elem.value)==''){
			CACHK.showErrors(elem,role,"",arguments[2]);
			return false;
		}
	}		
	CACHK.showRightsHTML(elem,role);		
	return true;
};
	
AntSoft.CHK.caChecker.prototype.chk_emptynovar=function(elem,role){
	if(role.roleIf==1){
		if(CACHK.trim(elem.value)!=''){
			CACHK.showErrors(elem,role,"只能为空",arguments[2]);
			return false;
			}
		}else{
			if(CACHK.trim(elem.value)==''){
				CACHK.showErrors(elem,role,"",arguments[2]);
				return false;
				}
			}
			
	CACHK.showRightsHTML(elem,role);		
	return true;
	};
//20101111 zhy add	bsempty
AntSoft.CHK.caChecker.prototype.chk_bsempty=function(elem,role){
	if(role.roleIf==1){
			//alert(elem.value);
			if(CACHK.trim(elem.value)!=''){
				CACHK.showErrors(elem,role,"只能为空",arguments[2]);
				return false;
			}
	}else{
			//保送申请类别.判断必填项是否为空.
			if('1' == document.getElementById("sqlbm").value){
				if(CACHK.trim(elem.value)==''){
					CACHK.showErrors(elem,role,"成绩信息不能为空",arguments[2]);
					return false;
				}
			}
			if( 9 < document.getElementById("sqlbm").value && document.getElementById("sqlbm").value <14){
				if(CACHK.trim(elem.value)==''){
					CACHK.showErrors(elem,role,"成绩信息不能为空",arguments[2]);
					return false;
				}
			}			
	}
			
	CACHK.showRightsHTML(elem,role);		
	return true;
};
//20101111 zhy add	bsempty
AntSoft.CHK.caChecker.prototype.chk_bsjtempty=function(elem,role){
	if(role.roleIf==1){
			//alert(elem.value);
			if(CACHK.trim(elem.value)!=''){
				CACHK.showErrors(elem,role,"只能为空",arguments[2]);
				return false;
			}
	}else{
			//保送申请类别.判断必填项是否为空.
			if('1' == document.getElementById("sqlbm").value){
				if(CACHK.trim(elem.value)==''){
					CACHK.showErrors(elem,role,"家庭情况不能为空",arguments[2]);
					return false;
				}
			}
			if( 9 < document.getElementById("sqlbm").value && document.getElementById("sqlbm").value <14){
				if(CACHK.trim(elem.value)==''){
					CACHK.showErrors(elem,role,"家庭情况不能为空",arguments[2]);
					return false;
				}
			}
											
	}
			
	CACHK.showRightsHTML(elem,role);		
	return true;
};
AntSoft.CHK.caChecker.prototype.chk_number=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^\d+(\.\d+)?$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"非数字",arguments[2]);
		}else{
			CACHK.showRightsHTML(elem,role);
			}
	return result;
	};
	
AntSoft.CHK.caChecker.prototype.chk_nonumber=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[^0-9０-９]+$/g,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"不能含有数字",arguments[2]);
		}
		else{
			CACHK.showRightsHTML(elem,role);
			}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_color=function(elem,role){
	var temp=CACHK.trim(elem.value);
	if(temp==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=true;
	if(temp==""){
		result=false;
		}
	if(temp.length!=7){
		result=false;
		}
	result=(temp.search(/\#[a-fA-F0-9]{6}/)!=-1);
	if(!result){
		CACHK.showErrors(elem,role,"非颜色值",arguments[2]);
		}
	return result;
	};

//验证身份证是否已注册
AntSoft.CHK.caChecker.prototype.chk_idsearchcard=function(elem,role){
	var chkInfoLayout=CACHK.makeInfoLayoutElement(role);
	chkInfoLayout.className="cachk_initsLayout";
	chkInfoLayout.innerHTML="<img src = 'images/bz/wsbm/student/loading.gif' alt = '查询' height = '16'/>";
	var v=CACHK.trim(elem.value);
	//1.为空较验
	if(v==""){
		CACHK.showErrors(elem,role,"不能为空!",arguments[2]);
		return false;
	}
	//2.规则验证较验
	if(!(/^\d{17}(\d|x)$/i.test(v)||/^\d{15}$/i.test(v))){
		CACHK.showErrors(elem,role,"输入不合法!",arguments[2]);
		return false;
	}
	var provinceCode=parseInt(v.substr(0,2));
	if(provinceCode<11||provinceCode>91){
		CACHK.showErrors(elem,role,"输入不合法!",arguments[2]);
		return false;
		}
	var forTestDate=v.length==18?v:v.substr(0,6)+'19'+v.substr(6,15);
	var birthday=forTestDate.substr(6,8);
	if(!new Date(birthday.substr(0,4)+'/'+birthday.substr(4,2)+'/'+birthday.substr(6,2))){
		CACHK.showErrors(elem,role,"输入不合法!",arguments[2]);
		return false;
		}
	if(v.length==18){v=v.replace(/x$/i,'a');
	var verifyCode=0;
	for(var i=17;i>=0;i--){
		verifyCode+=(Math.pow(2,i)%11)*parseInt(v.charAt(17-i),11);
		}
	if(verifyCode%11!=1){
		CACHK.showErrors(elem,role,"输入不合法!",arguments[2]);
		return false;
		}
	}
	
	CACHK.showRightsHTML(elem,role);
	return true;
};	

//验证身份证是否已注册(或者是管理员修改身份证号时)
AntSoft.CHK.caChecker.prototype.chk_idcard=function(elem,role){
	var chkInfoLayout=CACHK.makeInfoLayoutElement(role);
	chkInfoLayout.className="cachk_initsLayout";
	chkInfoLayout.innerHTML="<img src = 'images/bz/wsbm/student/loading.gif' alt = '查询' height = '16'/>";
	var v=CACHK.trim(elem.value);
	//1.为空较验
	if(v==""){
		CACHK.showErrors(elem,role,"不能为空",arguments[2]);
		return false;
	}
	//2.规则验证较验
	if(!(/^\d{17}(\d|x)$/i.test(v)||/^\d{15}$/i.test(v))){
		CACHK.showErrors(elem,role,"不正确",arguments[2]);
		return false;
	}
	var provinceCode=parseInt(v.substr(0,2));
	if(provinceCode<11||provinceCode>91){
		CACHK.showErrors(elem,role,"不正确",arguments[2]);
		return false;
		}
	var forTestDate=v.length==18?v:v.substr(0,6)+'19'+v.substr(6,15);
	var birthday=forTestDate.substr(6,8);
	if(!new Date(birthday.substr(0,4)+'/'+birthday.substr(4,2)+'/'+birthday.substr(6,2))){
		CACHK.showErrors(elem,role,"不正确",arguments[2]);
		return false;
		}
	if(v.length==18){v=v.replace(/x$/i,'a');
	var verifyCode=0;
	for(var i=17;i>=0;i--){
		verifyCode+=(Math.pow(2,i)%11)*parseInt(v.charAt(17-i),11);
		}
	if(verifyCode%11!=1){
		CACHK.showErrors(elem,role,"不正确",arguments[2]);
		return false;
		}
	}
	//3.数据库较验
	var flag = false;
	var xmlHttpRequest = CACHK.CreateXmlHttpRequest();
   	var sfzh = elem.value ;
 	var url = "/bz/wsbm/servlet/CheckIdCardServlet";
 	xmlHttpRequest.onreadystatechange = function(){
 		try{
 			//alert("xmlhttpRequest状态"+xmlHttpRequest.readyState);
			if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200 ){
				var result = xmlHttpRequest.responseText ;//responseXML
				if(result=="false"){
					CACHK.showErrors(elem,role,"已经被注册，请联系招办，传真010-62782061，邮箱zsb@mail.tsinghua.edu.cn",arguments[2]);
				}
				if(result=="true"){
				 	CACHK.showRightsHTML(elem,role);
				 	flag = true;
				 }
			}
		}catch(e){
			 alert("javaScript出现异常:" + e.message);
		}
 	}
 	xmlHttpRequest.open("POST",url,false);
 	xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  	xmlHttpRequest.send("sfzh="+sfzh+"&ksbh="+elem.id);
	return flag;
};
AntSoft.CHK.caChecker.prototype.chk_existname=function(elem,role){
	var chkInfoLayout=CACHK.makeInfoLayoutElement(role);
	chkInfoLayout.className="cachk_initsLayout";
	chkInfoLayout.innerHTML="<img src = 'images/bz/wsbm/student/loading.gif' alt = '查询' height = '16'/>";
	var v=CACHK.trim(elem.value);
	//1.为空较验
	if(v==""){
		CACHK.showErrors(elem,role,"不能为空",arguments[2]);
		return false;
	}
	
	var result=CACHK.RegularChecker(/^[a-zA-Z0-9_]*$/g,v);
	if(!result){
		CACHK.showErrors(elem,role,"只能是数字、英文字母或下划线",arguments[2]);
		return false;
	};
	
	var result=CACHK.RegularChecker(/^[0-9]*$/g,v);
	if(result){
		CACHK.showErrors(elem,role,"至少包含一位字母",arguments[2]);
		return false;
	};
	
	//2.数据库较验
	var flag = false;
	var xmlHttpRequest = CACHK.CreateXmlHttpRequest();
   	var username = elem.value ;
 	var url = "bz/wsbm/servlet/CheckUserNameServlet";
 	xmlHttpRequest.onreadystatechange = function(){
 		try{
			if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200 ){
				var result = xmlHttpRequest.responseText ;//responseXML
				if(result=="false"){
					CACHK.showErrors(elem,role,"已经被注册！",arguments[2]);
				}
				if(result=="true"){
				 	CACHK.showRightsHTML(elem,role);
				 	flag = true;
				 }
			}
		}catch(e){
			 alert("javaScript出现异常:" + e.message);
		}
 	}
 	xmlHttpRequest.open("POST",url,false);
 	xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  	xmlHttpRequest.send("id="+username);
	return flag;
};

AntSoft.CHK.caChecker.prototype.chk_ip=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"不正确",arguments[2]);
		}
	return result;
	};
	
AntSoft.CHK.caChecker.prototype.chk_chinese=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[\u4e00-\u9fa5]+$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"只允许中文",arguments[2]);
		}
	return result;
	};
	
AntSoft.CHK.caChecker.prototype.chk_mobile=function(elem,role){
	var _str=elem.value;
	if(CACHK.trim(_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/(^0?[1][358][0-9]{9}$)/,_str);
	if(!result){
		CACHK.showErrors(elem,role,"无效",arguments[2]);
		return false;
		}
	return true;
	};


AntSoft.CHK.caChecker.prototype.chk_telephone=function(elem,role){
	var str=elem.value;
	if(CACHK.trim(str)==""){
		CACHK.showInitHTML(elem,role);
		return true;
	}
	
	var result=CACHK.RegularChecker(/(^((0[0-9]{3})?(0[12][0-9])?-?)?\d{6,8}$)|(^0?[1][358][0-9]{9}$)/,str);
	if(!result){CACHK.showErrors(elem,role,"无效",arguments[2]);
	}else{
			CACHK.showRightsHTML(elem,role);
			}
	return result;
	};
AntSoft.CHK.caChecker.prototype.chk_telephonenovar=function(elem,role){
	var str=elem.value;
	if(CACHK.trim(str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
	}
	var result=CACHK.RegularChecker(/(^((0[0-9]{3})?(0[12][0-9])?-?)?\d{6,8}$)|(^0?[1][358][0-9]{9}$)/,str);
	if(!result){CACHK.showErrors(elem,role,"",arguments[2]);
	}else{
			CACHK.showRightsHTML(elem,role);
			}
	return result;
	};
	
AntSoft.CHK.caChecker.prototype.chk_telephonenull=function(elem,role){
	var str=elem.value;
	if(CACHK.trim(str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/(^((0[0-9]{3})?(0[12][0-9])?-?)?\d{6,8}$)|(^0?[1][358][0-9]{9}$)/,str);
	if(!result){
		CACHK.showErrors(elem,role,"",arguments[2]);
	}else{
			CACHK.showRightsHTML(elem,role);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_zip=function(elem,role){
	var str=elem.value;
	if(CACHK.trim(str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[0-9]\d{5}$/,str);
	if(!result){
		CACHK.showErrors(elem,role,"无效",arguments[2]);
	}else{
		CACHK.showRightsHTML(elem,role);
	}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_qq=function(elem,role){
	var str=elem.value;
	if(CACHK.trim(str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[1-9]\d{4,8}$/,str);
	if(!result){
		CACHK.showErrors(elem,role,"无效",arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_equals=function(elem,role){
	var elemObj=CACHK.getElementByFormAndElemNameOrIndex(role.roleIf,role.formObj);
	if(elemObj==null){
		alert("根据规则无法取到代象.请检查规则书写是否有误.");
		return false;
	}

	if(CACHK.trim(elem.value)==CACHK.trim(elemObj.value)){
		CACHK.showRightsHTML(elem,role);
		return true;
	}else{
		CACHK.showErrors(elem,role,"不相符",arguments[2]);
		return false;
	}
};

//高中入学时间格式校验
AntSoft.CHK.caChecker.prototype.chk_gzrxsj=function(elem,role){
	var gzrxsj=elem.value;
	if(CACHK.trim(gzrxsj) == ""){
		CACHK.showInitHTML(elem,role);
		return true;
	}
	var patt1 = /^[1-2]\d{3}\-[0|1][0-9]$/;
	if(!patt1.test(gzrxsj)){
		CACHK.showErrors(elem,role,"高中入学时间格式不对。正确格式为2000-01",arguments[2]);
		return false;
	}
	var ar = gzrxsj.split("-");
	if(ar.length == 2){
		if(ar[1]>12 || ar[1] < 0){
			CACHK.showErrors(elem,role,"高中入学时间月份格式不对。正确格式为2000-01",arguments[2]);
			return false;
		}
	}
	return true;
};
	
//年级名次/人数格式校验
AntSoft.CHK.caChecker.prototype.chk_mcrsgz=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str) == ""){
		CACHK.showInitHTML(elem,role);
		return true;
	}
	var result = new Array();
	result = tmp_str.split("/");
	if(result.length<2){
		CACHK.showErrors(elem,role,"输入中必须含有‘/’字符",arguments[2]);
		return false;
	}
	if(result.length>2){
		CACHK.showErrors(elem,role,"输入中只能含有一个‘/’字符",arguments[2]);
		return false;
	}
	
	if(!CACHK.RegularChecker(/^[-+]?[\d]+$/,result[0])){
		CACHK.showErrors(elem,role,"名次只能是整数",arguments[2]);
		return false;
	}
	if(!CACHK.RegularChecker(/^[-+]?[\d]+$/,result[1])){
		CACHK.showErrors(elem,role,"总人数只能是整数",arguments[2]);
		return false;
	}
	if(parseInt(result[0])>parseInt(result[1])){
		CACHK.showErrors(elem,role,"名次不能大于总人数",arguments[2]);
		return false;
	}
	return true;
};
//就读时间格式校验
AntSoft.CHK.caChecker.prototype.chk_jdsjgz=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str) == ""){
		CACHK.showInitHTML(elem,role);
		return true;
	}
	var result = new Array();
	result = tmp_str.split("-");
	if(result.length<2){
		CACHK.showErrors(elem,role,"输入中必须含有‘-’字符",arguments[2]);
		return false;
	}
	if(result.length>2){
		CACHK.showErrors(elem,role,"输入中只能含有一个‘-’字符",arguments[2]);
		return false;
	}
	result_front = result[0].split(".");
	result_end = result[1].split(".");
	if(result[0].length!=7||result[1].length!=7||result_front.length!=2||result_end.length!=2){
		CACHK.showErrors(elem,role,"时间格式不对",arguments[2]);
		return false;
	}
	if(!CACHK.RegularChecker(/^\d+(\.\d+)?$/,result_front[0])||!CACHK.RegularChecker(/^\d+(\.\d+)?$/,result_front[1])||!CACHK.RegularChecker(/^\d+(\.\d+)?$/,result_end[0])||!CACHK.RegularChecker(/^\d+(\.\d+)?$/,result_end[1])){
		CACHK.showErrors(elem,role,"年月只能是数字",arguments[2]);
		return false;
	}
	return true;
};	

//成绩/满分值格式校验
AntSoft.CHK.caChecker.prototype.chk_cjzfgz=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str) == ""){
		CACHK.showInitHTML(elem,role);		
		return true;
	}
	var result = new Array();
	result = tmp_str.split("/");
	if(result.length<2){
		CACHK.showErrors(elem,role,"输入中必须含有‘/’字符",arguments[2]);
		return false;
	}
	if(result.length>2){
		CACHK.showErrors(elem,role,"输入中只能含有一个‘/’字符",arguments[2]);
		return false;
	}
	if(result[1].length>3){
		CACHK.showErrors(elem,role,"满分值不能超过3位数",arguments[2]);
		return false;
	}
	if(!CACHK.RegularChecker(/^[-+]?[\d]+$/,result[0])){
		CACHK.showErrors(elem,role,"成绩只能是整数",arguments[2]);
		return false;
	}
	if(!CACHK.RegularChecker(/^[-+]?[\d]+$/,result[1])){
		CACHK.showErrors(elem,role,"满分值只能是整数",arguments[2]);
		return false;
	}
	if(parseInt(result[0])>parseInt(result[1])){
		CACHK.showErrors(elem,role,"成绩不能大于满分值",arguments[2]);
		return false;
	}
	CACHK.showRightsHTML(elem,role);//正确之后样式未还原 add by wangxinyi 20130531		
	return true;
};	

AntSoft.CHK.caChecker.prototype.chk_integer=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str) == ""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[-+]?[\d]+$/,tmp_str);
		CACHK.showInitHTML(elem,role);
	if(!result){
		CACHK.showErrors(elem,role,"非整数",arguments[2]);
		}
	return result;
};

AntSoft.CHK.caChecker.prototype.chk_float=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[-+]?\d+(\.\d+)?$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"非小数",arguments[2]);
		}

	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_alpha=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[a-zA-Z]+$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"非英文字母",arguments[2]);
		}

	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_alphanum=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[a-zA-Z0-9]+$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"非英文字母或数字",arguments[2]);
		}

	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_identifier=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.RegularChecker(/^[_a-zA-Z]\w*$/,tmp_str);
	if(!result){
		CACHK.showErrors(elem,role,"非英文字母、数字或下划线",arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_lessthan=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=parseFloat(tmp_str)<parseFloat(role.roleIf);
	if(!result){
		CACHK.showErrors(elem,role,"必须少于"+role.roleIf,arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_greatthan=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=parseFloat(tmp_str)>parseFloat(role.roleIf);
	if(!result){
		CACHK.showErrors(elem,role,"必须大于"+role.roleIf,arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_between=function(elem,role){
	var checkType="int";
	var checkNumber=role.roleIf;
	checkType=role.roleIf.indexOf("->")!=-1?role.roleIf.split("->")[0]:checkType;
	checkNumber=role.roleIf.indexOf("->")!=-1?role.roleIf.split("->")[1]:checkType;
	var chkNums=checkNumber.split("&");
	var tmp_str=CACHK.trim(elem.value);
	if(CACHK.trim(tmp_str)==""){
		CACHK.showInitHTML(elem,role);
		return true;
	}
	var result=true;
	if(checkType=="int"){
		if(CACHK.RegularChecker(/^[-+]?[\d]+$/,tmp_str)){
			result=parseInt(tmp_str)>=parseInt(chkNums[0])&&parseInt(tmp_str)<=parseInt(chkNums[1]);
			CACHK.showInitHTML(elem,role);
			}else{
				result=false;
				}
		}else if(checkType=="float"){
			result=parseFloat(tmp_str)>=parseFloat(chkNums[0])&&parseFloat(tmp_str)<=parseFloat(chkNums[1]);
			CACHK.showInitHTML(elem,role);
			}else if(checkType=="len"){
				result=tmp_str.length>=parseInt(chkNums[0])&&tmp_str.length<=parseInt(chkNums[1]);
				CACHK.showInitHTML(elem,role);
				}

	if(!result){
		if(checkType=="len"){
			CACHK.showErrors(elem,role,"",arguments[2]);
			}else{
				CACHK.showErrors(elem,role,"",arguments[2]);
				}
		}

	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_file=function(elem,role){
	var tmp_str=elem.value;
	if(CACHK.trim(tmp_str)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var exts=role.roleIf.split(",");
	var result=false;
	for(var i=0;i<exts.length;i++){
		result=CACHK.RegularChecker(new RegExp('\\.'+exts[i]+'$','i'),tmp_str);
		if(result)
			break;
		}
	if(!result){
		CACHK.showErrors(elem,role,"只允许"+role.roleIf+"类型的文件",arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_date=function(elem,role){
	var v=CACHK.trim(elem.value);
	if(CACHK.trim(v)==""){
		CACHK.showInitHTML(elem,role);
		return true;
	}
	var result=CACHK.checkDate(v,role.roleIf);
	if(!result){
		CACHK.showErrors(elem,role,"输入不正确.",arguments[2]);
	}else{
			CACHK.showRightsHTML(elem,role);
	}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_time=function(elem,role){
	var v=CACHK.trim(elem.value);
	if(CACHK.trim(v)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=CACHK.checkTime(v);
	if(!result){
		CACHK.showErrors(elem,role,"格式不对,正确格式：hh:mm或hh:mm:ss",arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_datetime=function(elem,role){
	var v=CACHK.trim(elem.value);
	if(CACHK.trim(v)==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var result=true;
	var parts=v.split(/\s+/);
	if(parts.length!=2){
		result=false;
		}else{
			result=CACHK.checkDate(parts[0],null)&&CACHK.checkTime(parts[1]);
			}
	if(!result){
		CACHK.showErrors(elem,role,"格式不对,正确格式：y-m-d h:i:s",arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_any=function(elem,role){
	var roleIf=role.roleIf;
	var spRoleIf=roleIf.split(":");
	if(spRoleIf.length==1){
		alert("分析验证规则失败,请检查验证规则书写是否有误!");
		return;
		}
	var rootRole=spRoleIf[0].split("@");
	var rootRoleIf=rootRole[1];
	

	var rootMethodName=rootRole[0];
	var spv=spRoleIf[1].split("^^");
	var elemDescs=role.elemDesc;
	var result=false;
	var rootRoleObj=new CACHK.ROLE(role.elemObj,rootMethodName,rootRoleIf,elemDescs,role.formObj);
	result=eval("CACHK.chk_"+rootRoleObj.roleType+"(rootRoleObj.elemObj,rootRoleObj,false)");
	for(var i=0;i<spv.length;i++){
		if(result)
			break;
		var newRole=spv[i].split("@");
		var spNewRole=newRole[0].split("->");
		var newRoleMethodName=spNewRole[0];
		var newRoleElementName=spNewRole[1];
		var newRoleIf=newRole[1];
		var targetElem=CACHK.getElementByFormAndElemNameOrIndex(newRoleElementName,role.formObj);
		var targetRole=new CACHK.ROLE(targetElem,newRoleMethodName,newRoleIf,elemDescs,role.formObj);
		result=eval("CACHK.chk_"+newRoleMethodName+"(targetElem,targetRole,false)");
		if(result)
			break;
		}
	if(result)
		CACHK.resetCheckState(rootRoleObj);
	if(!result){
		CACHK.showErrors(elem,rootRoleObj,"验证失败",arguments[2]);
		}

	
	return result;};

AntSoft.CHK.caChecker.prototype.chk_within=function(elem,role){
	var v=CACHK.trim(elem.value);
	if(v==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var chks=role.roleIf.split("&");
	var result=false;
	for(var i=0;i<chks.length;i++){
		result=v==chks[i];
		if(result)
			break;
		}
	if(!result){
		CACHK.showErrors(elem,role,"只允许输入“"+CACHK.replaceAll(role.roleIf,"&","，")+"”其中一个",arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_notwithin=function(elem,role){
	var v=CACHK.trim(elem.value);
	if(v==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var chks=role.roleIf.split("&");
	var result=true;
	for(var i=0;i<chks.length;i++){
		result=!(v==chks[i]);
		if(!result)
			break;
		}
	if(!result){
		CACHK.showErrors(elem,role,"不允许输入“"+CACHK.replaceAll(role.roleIf,"&","，")+"”其中一个",arguments[2]);
		}
	return result;
	};

AntSoft.CHK.caChecker.prototype.chk_multi=function(elem,role){
	var v=CACHK.trim(elem.value);
	if(v==""){
	CACHK.showInitHTML(elem,role);
		return true;
		}
	var spRoleIf=role.roleIf.split("$");
	var methodRoleIf=spRoleIf[0].split("@");
	var methodName=methodRoleIf[0];
	var roleIf=methodRoleIf[1];
	var spPrefix=spRoleIf[1];
	var spV=v.split(spPrefix);
	var result=true;
	for(var i=0;i<spV.length;i++){
		elem.value=spV[i];
		var newRole=new CACHK.ROLE(role.elemObj,methodName,roleIf,role.elemDesc,role.formObj);
		result=eval("CACHK.chk_"+newRole.roleType+"(newRole.elemObj,newRole)");
		if(!result)
			break;
		}
	elem.value=v;
	return result;
	};
//验证用户注册邀请码是否正确
AntSoft.CHK.caChecker.prototype.chk_zcyqm=function(elem,role){
	var chkInfoLayout=CACHK.makeInfoLayoutElement(role);
	chkInfoLayout.className="cachk_initsLayout";
	chkInfoLayout.innerHTML="<img src = 'images/bz/wsbm/student/loading.gif' alt = '查询' height = '16'/>";
	var v=CACHK.trim(elem.value);
	//1.为空较验
	if(v==""){
		CACHK.showErrors(elem,role,"不能为空",arguments[2]);
		return false;
	}
	//2.数据库较验
	var flag = false;
	var xmlHttpRequest = CACHK.CreateXmlHttpRequest();
   	var zcyqm = elem.value ;
 	var url = "bz/wsbm/servlet/CheckZcyqmServlet?sqlbm="+role.roleIf;
 	xmlHttpRequest.onreadystatechange = function(){
 		try{
			if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200 ){
				var result = xmlHttpRequest.responseText ;//responseXML
				if(result=="false"){
					CACHK.showErrors(elem,role,"注册码无效或者已经被使用！",arguments[2]);
					elem.value = "";
					var bmxx = document.getElementById("bmxx");
				 	bmxx.style.display = "none";
				 	document.getElementById("zcyqm").readonly="false";
				}
				if(result=="true"){
				 	CACHK.showRightsHTML(elem,role);
				 	var bmxx = document.getElementById("bmxx");
				 	bmxx.style.display = "block";
				 	document.getElementById("zcyqm").readonly="true";
				 	flag = true;
				 }
			}
		}catch(e){
			 alert("javaScript出现异常:" + e.message);
		}
 	}
 	xmlHttpRequest.open("POST",url,false);
 	xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  	xmlHttpRequest.send("zcyqm="+zcyqm);
	return flag;
};	
//----验证规则 end	
	

//----通用函数 start
AntSoft.CHK.caChecker.prototype.ltrim=function(s){
	return s.replace(/^\s*/,"");
	};

AntSoft.CHK.caChecker.prototype.rtrim=function(s){
	return s.replace(/\s*$/,"");
	};

AntSoft.CHK.caChecker.prototype.trim=function(s){
	return CACHK.rtrim(CACHK.ltrim(s));
	};

AntSoft.CHK.caChecker.prototype.replaceAll=function(oldStr,AFindText,ARepText){
	raRegExp=new RegExp(AFindText,"g");
	return oldStr.replace(raRegExp,ARepText)
	};

AntSoft.CHK.caChecker.prototype.insertAfter=function(newElement,targetElement){
	var parent=targetElement.parentNode;
	if(parent.lastChild==targetElement){
		parent.appendChild(newElement);
		}else{
			parent.insertBefore(newElement,targetElement.nextSibling);
			}
	};

AntSoft.CHK.caChecker.prototype.getNextElement=function(node){
	if(node&&node.nodeType==1){
		return node;
		}
	if(node&&node.nextSibling){
		return CACHK.getNextElement(node.nextSibling);
		}
	return null;
	};

AntSoft.CHK.caChecker.prototype.CheckFormRole=function(){
	this.roleList=[];
	this.addRole=function(elemName,checkerType,checkIf,elemDesc,infoMessage,rightImagePath,wrongImagePath){
		var spElemName=elemName.split(">");
		var spElemDesc=elemDesc.split(">");
		if(spElemName.length!=spElemDesc.length){
			alert("添加规则失败,请检查规则书写是否写误!");
			return;
		}
		for(var i=0;i<spElemName.length;i++){
			var roleString=spElemName[i];
			roleString+="|";
			roleString+=checkerType;
			roleString+="|";
			roleString+=checkIf;
			roleString+="|";
			roleString+=spElemDesc[i];
			roleString+="|";
			roleString+=infoMessage;
			roleString+="|";
			roleString+=rightImagePath;
			roleString+="|";
			roleString+=wrongImagePath;
			this.roleList[this.roleList.length]=roleString;
		}
	};
	
	//添加规则
	this.getRoleList=function(){
		return this.roleList;
	};
};
//----通用函数 end	
		
CACHK.addLoadEvent(CACHK.initCACF);