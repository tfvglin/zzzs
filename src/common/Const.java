package common;

import java.util.HashMap;
import java.util.Map;

public class Const {
    public static final String PAGE_REC_NUM="20";    //��ҳ������ʹ�ã���ʾÿҳ��¼��    
    public static final String ERROR="����ʧ��";    //ͳһ��Ϣ��ʾ����ʹ��
    public static final String SUCCESS="�����ɹ�";    //ͳһ��Ϣ��ʾ����ʹ��
    public static final String EXCEPTION_INFO="�����쳣";
    public static final String LOGIN_PROMPT="���ȵ�¼";    //��½���ܺ�session��֤������ʹ��
    public static final String REG_PROMPT="����д����������";    //ע�Ṧ�ܺ�session��֤������ʹ��
    public static final String LOGIN��ERROR="�û������������";    //��¼����ʹ��
    public static final String REG��ERROR="�����쳣�����Ժ�����";    //��¼����ʹ��
    public static final String DATA_SOURCE="java:/comp/env/jdbc/zsb_zsxt";    //����Դ����
    public static final Map<String,String> Type=new HashMap<String,String>(){{put("������","7");put("��Ӿ","8");put("������","2");put("��������","1");}};
    public static final Map<String,String> Province=new HashMap<String,String>(){{put("������","11");put("�����","12");put("�ӱ�ʡ","13");put("ɽ��ʡ","14");put("���ɹ���","15");put("����ʡ","21");put("����ʡ","22");put("������ʡ","23");put("�Ϻ���","31");put("����ʡ","32");put("�㽭ʡ","33");put("����ʡ","34");put("����ʡ","35");put("����ʡ","36");put("ɽ��ʡ","37");put("����ʡ","41");put("����ʡ","42");put("����ʡ","43");put("�㶫ʡ","44");put("������","45");put("����ʡ","46");put("������","50");put("�Ĵ�ʡ","51");put("����ʡ","52");put("����ʡ","53");put("������","54");put("����ʡ","61");put("����ʡ","62");put("�ຣʡ","63");put("������","64");put("�½���","65");put("̨��ʡ","71");put("����ر�������","81");put("�����ر�������","82");}};
    public static final Map<String,String> Subject=new HashMap<String,String>(){{put("�Ŀ�","1");put("���","5");}};
}
