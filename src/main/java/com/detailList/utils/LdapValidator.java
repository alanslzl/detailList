package com.detailList.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.detailList.dto.Result;

/**
 * LdapValidator.java
 * 
 * 域验证类.
 * 
 * @author zhouzh2
 * @company SANY Group Co, Ltd
 * @creation date 2011-4-27
 */
public final class LdapValidator {
	/**
	 * 认证错误.
	 */
	public static final String ERROR = "-1";

	/**
	 * 无效证书.
	 */
	public static final String INVALID_CREDENTIALS = "1";

	private static String ldap_DN = null;

	private static String ldap_Driver = null;

	private static String ldap_Url = null;

	private static final Logger logger = LoggerFactory.getLogger(LdapValidator.class);

	/**
	 * 密码错误.
	 */
	public static final String PASSWORD_ERROR = "2";

	/**
	 * 证书认证通过.
	 */
	public static final String SUCCESS = "0";

	static {
		InputStream inputStream = null;
		Properties p = null;
		try {
			inputStream = LdapValidator.class.getResourceAsStream("/sources/ldap.properties");
			p = new Properties();
			p.load(inputStream);
			ldap_Driver = p.getProperty("ldap_Driver");
			ldap_Url = p.getProperty("ldap_Url");
			ldap_DN = p.getProperty("ldap_DN");
			Class.forName(ldap_Driver);
		} catch (IOException e) {
			if (logger.isErrorEnabled()) {
				logger.error(e.getMessage());
			}
		} catch (ClassNotFoundException e) {
			if (logger.isErrorEnabled()) {
				logger.error(e.getMessage());
			}
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				if (logger.isErrorEnabled()) {
					logger.error(e.getMessage());
				}
			} finally {
				inputStream = null;
			}
			p.clear();
		}
	}

	/**
	 * 认证.
	 * 
	 * @param username
	 *            ldap帐户.
	 * @param userpwd
	 *            ldap密码.
	 * @return int
	 */
	public static Result validateLdapUser(String username, String userpwd) {
		return validateLdapUser(ldap_Url, ldap_DN, username, userpwd);
	}

	public static Result validateLdapUser(String ldapUrl, String ldapDN, String username, String userpwd) {
		Result r = new Result();
		if (userpwd.equals("")) {
			r.setResultCode(LdapValidator.INVALID_CREDENTIALS);
			r.setResultMessage("密码不能为空!");
		}
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(ldapUrl, username + "@" + ldapDN, "" + userpwd + "");
			synchronized (conn) {
				try {
					Statement st = conn.createStatement();
					String query = "select * from dc=sany,dc=com,dc=cn where sAMAccountName = '" + username + "' ";
					ResultSet rs = st.executeQuery(query);
					List<Map<String, Object>> rsmap = ResultSetToList(rs);
					r.setResultCode(LdapValidator.SUCCESS);
					r.setResultMessage("验证成功");
					r.setResultObject(rsmap);
				} catch (Exception ignore) {
					ignore.printStackTrace();
				} finally {
					conn.close();
				}
			}

		} catch (Exception e) {
			if (logger.isErrorEnabled()) {
				logger.error(e.getMessage());
			}
			e.printStackTrace();
			r.setResultCode(LdapValidator.INVALID_CREDENTIALS);
			r.setResultMessage(e.getMessage());
		}
		return r;
	}

	public static List<Map<String, Object>> ResultSetToList(ResultSet rs) throws SQLException {
		List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
		ResultSetMetaData rsmd = rs.getMetaData();
		int colCount = rsmd.getColumnCount();
		List<String> colNameList = new ArrayList<String>();
		for (int i = 0; i < colCount; i++) {
			colNameList.add(rsmd.getColumnName(i + 1));
		}
		while (rs.next()) {
			for (int i = 0; i < colCount; i++) {
				Map map = new HashMap<String, Object>();
				String key = colNameList.get(i);
				Object value = rs.getString(colNameList.get(i));
				map.put(key, value);
				results.add(map);
			}
		}
		return results;
	}
}
