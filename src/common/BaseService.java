package common;

import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.Const;

public class BaseService {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String datasourceName = common.Const.DATA_SOURCE;
	public BaseService() {
	}



	// ��ҳ��ʾ����ȡҳ��ΪcurPage�ı�ҳ���м�¼
	// ���ص�Map�����д������Ԫ�أ�
	// key="list"��Ԫ���Ǵ���˱�ҳ���м�¼��List����
	// key="totalPage"��Ԫ���Ǵ�����ҳ����Integer����
	public Map getPage(String sql, Object[] params, String curPage) {
		String s_page_rec_num = Const.PAGE_REC_NUM;
		int i_page_rec_num = Integer.parseInt(s_page_rec_num);
		Map page = new HashMap();
		try {
			String newSql = sql + " limit " + (Integer.parseInt(curPage) - 1)
					* i_page_rec_num + "," + i_page_rec_num;
			List pageList = getList(newSql, params);// ����getList�����õ�list
			close();
			// ������ҳ��
			sql = sql.toLowerCase();
			String countSql = "";
			if(sql.indexOf("group")>=0)
							countSql = "select count(*) from ("+sql+") as temp";
						else
							countSql = "select count(*) as num "+ sql.substring(sql.indexOf("from"));
			// count�д���ܼ�¼��
			long count = getLong(countSql, params); // ����getLong�����õ���¼��
			// �����ܼ�¼����count����ÿҳ��¼������Const.PAGE_REC_NUM��������ҳ��
			long totalPage = 0;
			if (count % i_page_rec_num == 0)
				totalPage = count / i_page_rec_num;
			else
				totalPage = count / i_page_rec_num + 1;
			// ���ص�List����page�У��±�Ϊ0��Ԫ��Ϊ��ŵ�ǰ��ҳ���м�¼��List����pageList���±�Ϊ1��Ԫ��Ϊ��ҳ��
			page.put("list", pageList);
			page.put("totalPage", new Long(totalPage));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return page;
	}

	public Map getPage(String sql, String curPage) {
		return getPage(sql, new Object[] {}, curPage);
	}


	public List getList(String sql) {
		return getList(sql, new Object[] {});
	}


	public Map getMap(String sql) {
		return getMap(sql, new Object[] {});
	}


	// ��ѯ���int����
	public int getInt(String sql, Object[] params) {
		int i = 0;
		try {
			i = ((Integer) getObjectFromRS(sql, params)).intValue();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return i;
	}

	public int getInt(String sql) {
		//System.out.println(sql);
		return getInt(sql, new Object[] {});
	}

	// ��ѯ���String����
	public String getString(String sql, Object[] params) {
		String str = null;
		try {
			str = (String) getObjectFromRS(sql, params);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return str;
	}

	public String getString(String sql) {
		return getString(sql, new Object[] {});
	}


	public int update(String sql) {
		return update(sql, new Object[] {});
	}

	// ��ȡ���Ӷ���
	private Connection getConnection() throws NamingException, SQLException {
		Context ctx = null;
		DataSource ds = null;
		ctx = new InitialContext();
		ds = (DataSource) ctx.lookup(datasourceName);
		conn = ds.getConnection();
		return conn;
	}
	// ��ȡ������
	private PreparedStatement getPrepareStatement(String sql)
			throws NamingException, SQLException {
		pstmt = getConnection().prepareStatement(sql);
		return pstmt;
	}
	// �رն���
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
		}
	}
	//�����������飬�������е�ֵ��λ��һһ��Ӧ�ض�pstmt�������SQL����еĲ�����������
	private void setParams(String sql, Object[] params) throws NamingException,
			SQLException {
		pstmt = this.getPrepareStatement(sql);
		for (int i = 0; i < params.length; i++)
			pstmt.setString(i + 1, (String) params[i]);
	}
	//�ӽ�����еõ�һ������
	private Object getObjectFromRS(String sql, Object[] params)
			throws NamingException, SQLException {
		Object o = null;
		setParams(sql, params);// ����sql����params������pstmt����
		rs = pstmt.executeQuery();
		if (rs.next())
			o = rs.getObject(1);
		return o;
	}
	//���������װ��һ��List
	private List getListFromRS() throws NamingException, SQLException {
		List list = new ArrayList();
		// ��ȡԪ����
		ResultSetMetaData rsmd = rs.getMetaData();
		while (rs.next()) {
			Map m = new HashMap();
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				// ��ȡ��ǰ�е�i�е���������
				String colType = rsmd.getColumnTypeName(i);
				// ��ȡ��ǰ�е�i�е�����
				String colName = rsmd.getColumnName(i);
				String s = rs.getString(colName);
				if (s != null) {
					if (colType.equals("INTEGER"))
						m.put(colName, new Integer(rs.getInt(colName)));
					else if (colType.equals("FLOAT"))
						m.put(colName, new Float(rs.getFloat(colName)));
					else
						// �������;���ΪString����ȡ��
						m.put(colName, rs.getString(colName));
				}
			}
			list.add(m);
		}
		return list;
	}
	//��ѯ��ȡList����
	public List getList(String sql, Object[] params) {
		List list = null;// ���屣���ѯ����ļ��϶���
		try {
			setParams(sql, params);// ����sql����params������pstmt����
			rs = pstmt.executeQuery();// ִ��SQL��䣬�õ������
			list = getListFromRS();// ����RS�õ�list
		} catch (Exception e) {
			//System.out.println(e.getMessage());
		} finally {
			close();
		}
		return list;
	}
	//��ѯ��ȡMap����
	public Map getMap(String sql, Object[] params) {
		Map m = null;
		try {
			setParams(sql, params);// ����sql����params������pstmt����
			rs = pstmt.executeQuery();
			List l = getListFromRS();
			if (l != null)
				m = (Map) (l.get(0));// ����RS�õ�Map
		} catch (Exception e) {
			//System.out.println(e.getMessage());
		} finally {
			close();
		}
		return m;
	}
	//��ѯ���long���������int����float���Լ�String���Ͷ����ʵ����˷������ƣ�
	public long getLong(String sql, Object[] params) {
		long l = 0;
		try {
			l = ((Long) getObjectFromRS(sql, params)).longValue();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return l;
	}
	// ���ӡ��޸ĺ�ɾ�������Ե���update����
	public int update(String sql, Object[] params) {
		int recNo = 0;// ��ʾ��Ӱ��ļ�¼����
		try {
			setParams(sql, params);// ����sql����params������pstmt����
			recNo = pstmt.executeUpdate();// ִ�и��²���
		} catch (Exception e) {
			System.out.println(e.getMessage()+"��"+sql);
		} finally {
			close();
		}
		return recNo;
	}
	//��Map����ת��ΪObject����
	public Object[] getObjectArrayFromMap(Map map, String key) {
		String[] keys = key.split(",");
		Object[] tmp = new Object[keys.length];
		for (int i = 0; i < keys.length; i++) {
			tmp[i] = map.get(keys[i].trim());
		}
		return tmp;
	}

}