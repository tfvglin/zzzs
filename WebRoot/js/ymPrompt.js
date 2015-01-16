/**
 * ymPrompt.js 消息提示组件
 * @author netman8410@163.com
 */
var ymPrompt={
	version:'3.1',
	pubDate:'2008-12-12',
	initFn:{},
	createFn:function(fn){
		if(!fn) return;
		if(!(fn instanceof Array))fn=[fn];
		for(var i=0,l=fn.length;i<l;i++){
			ymPrompt[fn[i]]=(function(o){return function(){ymPrompt.initFn[o]=arguments}})(fn[i]);
		}
	},
	apply:function(o,c,d){
		if(d)ymPrompt.apply(o,d);
		if (o && c && typeof c == 'object')for(var p in c)o[p] = c[p];
		return o;
	}
};
//初始化可能调用的方法
ymPrompt.createFn(['getPage','resizeWin','doHandler','close','setDefaultCfg','show']);
//<meta http-equiv="X-UA-Compatible" content="IE=7" />  IE8透明度解决方案
(function(){
	var d=document,db=d.body,y=ymPrompt;
	var browser=function(s){return navigator.userAgent.toLowerCase().indexOf(s)!=-1}; //浏览器类型判断
	var isOpera=browser('opera'),isIE=browser('msie')!=-1&&(d.all&&!isOpera);
	//元素事件绑定
	var addEvent=(function(){return eval(['1,function(env,fn,obj){obj=obj||d;',isIE?"obj.attachEvent('on'+env,fn)":'obj.addEventListener(env,fn,false)','}'].join(''))})();
	//等待页面加载完成
	if(!db||typeof db!='object')return addEvent('load',arguments.callee,window);

	/*以下代码为公用函数及变量*/
	var curCfg={};	//当前配置
	/*---------纯函数操作---------*/
	var rootEl=d.compatMode=='CSS1Compat'?d.documentElement:db; //根据html Doctype获取html根节点，以兼容非xhtml的页面
	var c=[],$=function(id){var cc=c[id];return cc&&cc.parentNode?cc:c[id]=d.getElementById(id);};
	var $height=function(obj){return parseInt(obj.style.height)||obj.offsetHeight};	//获取元素高度
	//为元素添加css。obj:要添加css的对象，css:css文本
	var setCSS=(function(){return eval(['1,function(obj,css){if(!obj)return;',isOpera?"obj.setAttribute('style',css)":'obj.style.cssText=css','}'].join(''))})();
	//为元素的特定样式属性设定值
	var setStyle=function(el,n,v){
		if(!el)return;
		if(typeof n=='object'){
			for(var i in n)setStyle(el,i,n[i]);
			return;
		}
		if(el instanceof Array){
			for(var i=0;i<el.length;i++)setStyle(el[i],n,v);
			return;
		}
		el.style[n]=v;
	};
	/*----------------和业务有关的公用函数-----------------*/
	var btnIndex=0,btnCache,seed=0; //当前焦点的按钮的索引、当前存在的按钮、id种子
	//创建单个按钮
	var mkBtn=function(txt,sign,autoClose,id){
		if(!txt) return;
		if(txt instanceof Array){
			for(var i=0,t=[],l=txt.length;i<l;i++) t[i]=mkBtn.apply(window,txt[i])
			return t;
		}
		id=id||'ymPrompt_btn_'+seed++;
		autoClose=typeof autoClose=='undefined'?'undefined':!!autoClose;
		return {
			id:id,
			//html:"<input type='button' id='"+id+"' onclick='ymPrompt.doHandler(\""+sign+"\","+autoClose+")' style='cursor:pointer' class='btnStyle' value='"+txt+"' />"
			html:"<a id='"+id+"' onclick='ymPrompt.doHandler(\""+sign+"\","+autoClose+")' class='rightbtn linkbtn'  style='background:url(../images/btnbg.png) repeat-x;height:28px;line-height:28px;font-weight:bold;display:inline-block;padding:0 22px;color:#4d4d4d;border:1px solid #ccc;border-radius:2px;font-family: Arial, Helvetica, sans-serif;;font-size:12px;' href='javascript:;'>"+txt+"</a>"
		};     
	}
	//生成按钮组合的html
	var useBtn=function(btn){
		if(!btn) return btnCache='';
		if(!(btn instanceof Array))btn=[btn];
		btnCache=btn;
		var html=[];
		for(var i=0;i<btn.length;i++) html[i]=btn[i].html;
		return html.join('&nbsp;&nbsp;');
	}
	
	var listenKeydown=function(e){  //弹出消息框时监听键盘事件
		//无弹出框或弹出框隐藏则不屏蔽操作
		if(!btnCache||!ym_win||ym_win.style.display=='none') return true;
		var e=e||event,l=btnCache.length;
		if(e.keyCode==13) return true;  //允许回车键
		if(l==1){   //一个按钮就不用麻烦了
			$(btnCache[0].id).focus();
		}else{
			//tab键/左右方向键切换焦点
			if(e.keyCode==9||e.keyCode==39)$(btnCache[++btnIndex==l?(--btnIndex):btnIndex].id).focus();
			if(e.keyCode==37)$(btnCache[--btnIndex<0?(++btnIndex):btnIndex].id).focus();
		}
		//屏蔽所有键盘操作包括刷新等
		try{
			e.keyCode=0;
			e.cancelBubble=true;
			e.returnValue=false;
		}catch(ex){
			e.stopPropagation();
			e.preventDefault();
		}
	}
	//拖放
	var dragVar={},setDrag=function(e){
		e=e||window.event;
		y.apply(dragVar,{startDrag:true,startX:e.x||e.pageX,startY:e.y||e.pageY,containX:ym_win.offsetLeft,containY:ym_win.offsetTop});
	};
	//保存窗口定位信息
	var _locWin=function(){y.apply(dragVar,{containX:ym_win.offsetLeft,containY:ym_win.offsetTop,sX:rootEl.scrollLeft,sY:rootEl.scrollTop});};
	addEvent("mousemove",function(e){
		if(dragVar&&dragVar.startDrag){
			e=e||window.event;
			var sLeft=dragVar.containX+(e.x||e.pageX)-dragVar.startX;
			var sTop=dragVar.containY+(e.y||e.pageY)-dragVar.startY;
			if(!curCfg.dragOut){
				var sl=rootEl.scrollLeft,st=rootEl.scrollTop;
				sLeft=Math.min(Math.max(sLeft,sl),rootEl.clientWidth-ym_win.offsetWidth+sl);
				sTop=Math.min(Math.max(sTop,st),rootEl.clientHeight-ym_win.offsetHeight+st);
			}
			try{setStyle(ym_win,{left:sLeft+"px",top:sTop+"px"})}catch(e){}
		}
	});
	addEvent("mouseup",function(){dragVar.startDrag=null;_locWin()});

	//默认显示配置
	var dftCfg={
		fixPosition:false,
		dragOut:true,
		autoClose:true,
		maskAlphaColor:'#000',	//遮罩透明色
		maskAlpha:0.1,	//遮罩透明度
		title: '标题', //消息框标题
		message: '内容', //消息框按钮
		width: 430, //宽
		height: 200, //高
		iframe:false,
		btn:null,
		icoCls:'',
		handler: function(){}	//回调事件
	}
	/*-------------------------创建弹窗html-------------------*/
	var maskStyle='position:absolute;top:0;left:0;display:none;text-align:center';
	var div=document.createElement('div');
	div.innerHTML+=[
		//遮罩
		"<div id='maskLevel' style=\'"+maskStyle+';z-index:10000;\'></div>',
		isIE?("<iframe id='maskIframe' style='"+maskStyle+";z-index:9999;filter:alpha(opacity=0);opacity:0'></iframe>"):'',
		//窗体
		"<div id='ym-window' style='position:absolute;z-index:10001;display:none'>",
		"<div class='ym-tl' id='ym-tl'><div class='ym-tr'><div class='ym-tc' style='cursor:move;'><div class='ym-header-text'></div><div class='ym-header-tools'></div></div></div></div>",
		"<div class='ym-ml' id='ym-ml'><div class='ym-mr'><div class='ym-mc'><div class='ym-body'></div></div></div></div>",
		"<div class='ym-ml' id='ym-btnl'><div class='ym-mr'><div class='ym-btn'></div></div></div>",
		"<div class='ym-bl' id='ym-bl'><div class='ym-br'><div class='ym-bc'></div></div></div>",
		"</div>"
	].join('');
	db.appendChild(div);
	div=null;
	//mask、window
	var maskLevel=$('maskLevel');
	var maskIframe=$('maskIframe');
	var ym_win=$('ym-window');
	//header
	var ym_headbox=$('ym-tl');
	var ym_head=ym_headbox.firstChild.firstChild;
	var ym_hText=ym_head.firstChild;
	var ym_hTool=ym_hText.nextSibling;
	//content
	var ym_body=$('ym-ml').firstChild.firstChild.firstChild;
	//button
	var ym_btn=$('ym-btnl');
	var ym_btnContent=ym_btn.firstChild.firstChild;
	//bottom
	var ym_bottom=$('ym-bl');

	//绑定事件
	addEvent('mousedown',setDrag,ym_head);
	addEvent("keydown",listenKeydown);  //键盘按下事件
	function resizeMask(){if(maskLevel&&maskLevel.style.display!="none")showMask()} //重新计算遮罩大小
	addEvent("resize",resizeMask,window);
	addEvent("scroll",function(){resizeMask();locWin()},window);
	//禁止右键和选择
	isOpera?maskLevel.onmousedown=ym_win.onmousedown=function(){return false}:maskLevel.onselectstart=maskLevel.oncontextmenu=ym_win.onselectstart=ym_win.oncontextmenu=function(){return false};

	//蒙版的显示隐藏
	var showMask=function(){
		setStyle(maskLevel,{
			background:curCfg.maskAlphaColor,
			filter:'alpha(opacity='+(curCfg.maskAlpha*100)+')',
			opacity:curCfg.maskAlpha
		});
		setStyle([maskLevel,maskIframe],{
			width:rootEl.clientWidth+'px',
			height:rootEl.clientHeight+'px',
			top:rootEl.scrollTop+'px',
			left:rootEl.scrollLeft+'px',
			display:''  //显示蒙版
		});
	};
	var hideMask=function(){setStyle([maskLevel,maskIframe],'display','none')};
	var locWin=function(){
		if(curCfg.fixPosition)
			setStyle(ym_win,{
				left:(dragVar.containX+rootEl.scrollLeft-dragVar.sX)+'px',
				top:(dragVar.containY+rootEl.scrollTop-dragVar.sY)+'px'
			}); 
	}
	var SetWinSize=function(w,h){
		if(!maskLevel||maskLevel.style.display=='none') return;
		curCfg.height=parseInt(h)||dftCfg.height;
		curCfg.width=parseInt(w)||dftCfg.width;
		//显示消息容器
		setStyle(ym_win,{
			width:curCfg.width+'px',
			height:curCfg.height+'px',
			left:((rootEl.clientWidth-curCfg.width)/2+rootEl.scrollLeft)+'px',
			top:((rootEl.clientHeight-curCfg.height)/2+rootEl.scrollTop)+'px',
			display:''
		}); 
		//设定内容区的高度
		setStyle(ym_body,'height',curCfg.height-$height(ym_headbox)-$height(ym_btn)-$height(ym_bottom)+'px');
	}
	var showWin=function(){
		//传入标题和内容
		ym_hText.innerHTML=curCfg.title; //标题
		ym_hTool.innerHTML="<div class='ymPrompt_close' title='关闭' onclick='ymPrompt.doHandler(\"close\")'>&nbsp;</div>";
		ym_body.innerHTML=!curCfg.iframe?('<div class="ym_header yahei">'+curCfg.title+'</div><div class="ym-content">'+curCfg.message+'</div>'):"<iframe width='100%' height='100%' border='0' frameborder='0' src='"+curCfg.message+"'></iframe>";  //内容
		ym_body.className="ym-body "+curCfg.icoCls;  //图标类型
		setStyle(ym_btn,'display',(ym_btnContent.innerHTML=useBtn(mkBtn(curCfg.btn)))?'':'none');	//没有按钮则隐藏
		SetWinSize(curCfg.width,curCfg.height);
		if(btnCache)$(btnCache[btnIndex=0].id).focus(); //确定按钮获取焦点
		_locWin();
	};
	var hideWin=function(){setStyle(ym_win,'display','none')};

	//初始化
	var init=function(){
		showMask(); //显示背景层
		showWin();
	} 
	//销毁
	var destroy=function(){
		hideMask(); //隐藏背景层
		hideWin()
	}
	y.apply(y, {
		close:destroy,
		getPage:function(){return ym_body.firstChild.tagName.toLowerCase()=='iframe'?ym_body.firstChild:null},
		show:function(args,fargs){	//显示消息框,fargs:优先配置，会覆盖args中的配置
			//支持两种参数传入方式:(1)JSON方式 (2)多个参数传入
			var a=Array.prototype.slice.call(args,0),o={};
			if(typeof a[0]!='object'){
				var cfg=['message','width','height','title','handler','maskAlphaColor','maskAlpha','iframe','icoCls','btn','autoClose','fixPosition','dragOut'];
				for(var i=0,l=a.length;i<l;i++) if(a[i]) o[cfg[i]]=a[i];
			}else{
				o=a[0];
			}
			y.apply(curCfg,y.apply({},o,fargs),y.setDefaultCfg()); //先还原默认配置
			init();
		},
		doHandler:function(sign,autoClose){
			if(typeof autoClose=='undefined'?curCfg.autoClose:autoClose)destroy();
			eval(curCfg.handler)(sign);
		},
		resizeWin:SetWinSize,
		//设定默认配置
		setDefaultCfg:function(cfg){
			return y.cfg=y.apply({},cfg,y.apply({},y.cfg,dftCfg));
		}
	});
	//初始化默认配置
	y.setDefaultCfg();
	//执行用户调用的函数
	for(var i in y.initFn){
		y[i].apply(y,y.initFn[i]);
	}
	//删除引用
	y.initFn=y.createFn=null;
	delete y.initFn;
	delete y.createFn;
})();

//各消息框的相同操作
ymPrompt.apply(ymPrompt,{
	alert:function(){
		ymPrompt.show(arguments,{icoCls:'ymPrompt_alert',btn:[[' 确 定 ','ok']]});
	},
	succeedInfo:function(){
		ymPrompt.show(arguments,{icoCls:'ymPrompt_succeed',btn:[[' 确 定 ','ok']]});
	},
	errorInfo:function() {
		ymPrompt.show(arguments,{icoCls:'ymPrompt_error',btn:[[' 确 定 ','ok']]});
	},
	confirmInfo:function() {
		ymPrompt.show(arguments,{icoCls:'ymPrompt_confirm',btn:[[' 确 定 ','ok'],[' 取 消 ','cancel']]}); 
	},
	win:function() {
		ymPrompt.show(arguments); 
	}
});