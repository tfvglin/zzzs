package common;

import java.util.HashMap;
import java.util.Map;

public class Const {
    public static final String PAGE_REC_NUM="20";    //分页处理功能使用，表示每页记录数    
    public static final String ERROR="操作失败";    //统一信息提示功能使用
    public static final String SUCCESS="操作成功";    //统一信息提示功能使用
    public static final String EXCEPTION_INFO="操作异常";
    public static final String LOGIN_PROMPT="请先登录";    //登陆功能和session验证过滤器使用
    public static final String REG_PROMPT="请填写姓名和密码";    //注册功能和session验证过滤器使用
    public static final String LOGIN＿ERROR="用户名或密码错误";    //登录功能使用
    public static final String REG＿ERROR="网络异常，请稍后重试";    //登录功能使用
    public static final String DATA_SOURCE="java:/comp/env/jdbc/zsb_zsxt";    //数据源名字
    public static final Map<String,String> Type=new HashMap<String,String>(){{put("健美操","7");put("游泳","8");put("保送生","2");put("自主招生","1");}};
    public static final Map<String,String> Province=new HashMap<String,String>(){{put("北京市","11");put("天津市","12");put("河北省","13");put("山西省","14");put("内蒙古区","15");put("辽宁省","21");put("吉林省","22");put("黑龙江省","23");put("上海市","31");put("江苏省","32");put("浙江省","33");put("安徽省","34");put("福建省","35");put("江西省","36");put("山东省","37");put("河南省","41");put("湖北省","42");put("湖南省","43");put("广东省","44");put("广西区","45");put("海南省","46");put("重庆市","50");put("四川省","51");put("贵州省","52");put("云南省","53");put("西藏区","54");put("陕西省","61");put("甘肃省","62");put("青海省","63");put("宁夏区","64");put("新疆区","65");put("台湾省","71");put("香港特别行政区","81");put("澳门特别行政区","82");}};
    public static final Map<String,String> Subject=new HashMap<String,String>(){{put("文科","1");put("理科","5");}};
}
