package com.detailList.utils;

import java.util.Properties;

import org.apache.log4j.Logger;

import com.alibaba.druid.util.DruidPasswordCallback;

/**
 * @ClassName: DBPasswordCallback
 * @Description: 数据库用户名和密码加密类
 * @author: 
 * @date: 2013-12-25
 * 
 */
public class PasswordCallback extends DruidPasswordCallback {
    
    private static final long serialVersionUID = 1L;
    private static final Logger log = Logger.getLogger(PasswordCallback.class.getName());
    private static final String PASSWORD_KEY = "password";
    private String url;// 对应连接数据库的url
    private Properties properties;// 对应连接数据库配置文件中的properties
    
    public String getUrl() {
        return url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    public Properties getProperties() {
        return properties;
    }
    
    /**
     * 把密文转化成明文，让后把明文写到数据库配置文件中去
      * 
     */
    public void setProperties(Properties properties) {
        this.properties = properties;
        String pwd = properties.getProperty(PASSWORD_KEY);
        try {
        	DESUtil des=new DESUtil();
            setPassword(des.decrypt(pwd).toCharArray());
        } catch (Exception e) {
        	log.error("数据库密码解密失败");
            setPassword(pwd.toCharArray());
        }
    }
}