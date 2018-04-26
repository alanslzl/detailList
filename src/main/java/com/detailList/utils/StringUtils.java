package com.detailList.utils;

import java.util.StringTokenizer;
import java.util.UUID;

/**
 * function：
 * 			字符串工具集合，用于字符串处理
 * grant：
 * 			陕西易企伟业网络有限公司   2014-05
 * author：
 * 			王林兴
 * version：
 * 			1.0
 */
public class StringUtils {

	/**
	 * 格式化字符串
	 * 
	 * 例：formateString("xxx{0}bbb",1) = xxx1bbb
	 * 
	 * @param str
	 * @param params
	 * @return
	 */
	public static String formateString(String str, String... params) {
		for (int i = 0; i < params.length; i++) {
			str = str.replace("{" + i + "}", params[i] == null ? "" : params[i]);
		}
		return str;
	}
	
	/**
     * 判别字符串是否为null或者没有内容
     * 
     * @param inStr 被判断的输入参数
     * @return 布尔值：true=表示输入字符串为null或者没有内容 false=表示输入字符串不为null或者有内容
     */
    public static boolean zero(String inStr) {
        return ((null == inStr) || (inStr.length() <= 0));
    }

    /**
     * 判断字符串是否为null或没有内容或全部为空格。
     * 
     * @param inStr 被判断的输入参数
     * @return 布尔值：true=表示输入字符串为null或没有内容或全部为空格 false=表示输入字符串不为null或有内容或全部不为空格
     */
    public static boolean empty(String inStr) {
        return (zero(inStr) || (inStr.trim().equals("")));
    }

    /**
     * 判断字符串是否为null或没有内容或全部为空格或者为undefined。
     * 
     * @param inStr 被判断的输入参数
     * @return 布尔值：true=表示输入字符串为null或没有内容或全部为空格 false=表示输入字符串不为null或有内容或全部不为空格
     */
    public static boolean emptyorundefined(String inStr) {
        return (zero(inStr) || (inStr.trim().equals("")) || (inStr.trim().equals("undefined") || inStr.trim().equals("null")));
    }
    /**
     * 在str为null或者没有内容的情况下，返回空串；否则返回输入参数。
     * 
     * @param inStr 被判断的输入参数
     * @return 字符串="" 表示输入字符串为null或者没有内容 字符串!="" 表示输入字符串有内容
     */
    public static String toZeroSafe(String inStr) {
        if(zero(inStr)) {
            return "";
        }
        return inStr;
    }

    /**
     * 在inStr为null或者没有内容的情况下，返回def；否则返回str
     * 
     * @param inStr 被判断的输入参数
     * @param def inStr为null或者没有内容的情况下，需要返回的字符串
     * @return 字符串=def 表示输入字符串为null或者没有内容 字符串=inStr 表示输入字符串有内容
     */
    public static String toZeroSafe(String inStr, String def) {
        if(zero(inStr)) {
            return def;
        }
        return inStr;
    }

    /**
     * 在str为null或者没有内容，或者全部为空格的情况下，返回空串；否则返回str
     * 
     * @param inStr 被判断的输入参数
     * @return 字符串="" 表示输入字符串为null或者没有内容或者全部为空格 字符串!="" 表示输入字符串有内容
     */
    public static String toEmptySafe(String inStr) {
        if(empty(inStr)) {
            return "";
        }
        return inStr;
    }

    /**
     * 在str为null或者没有内容，或者全部为空格的情况下，返回def；否则返回str
     * 
     * @param inStr 被判断的输入参数
     * @param def inStr为null或者没有内容或者全部为空格的情况下，需要返回的字符串
     * @return 字符串=def 表示输入字符串为null或者没有内容或者全部为空格 字符串=inStr 表示输入字符串有内容
     */
    public static String toEmptySafe(String inStr, String def) {
        if(empty(inStr)) {
            return def;
        }
        return inStr;
    }

    /**
     * 去掉输入字符串首尾空格
     * 
     * @param inStr 输入字符串
     * @return 首尾无空格的字符串
     */
    public static String trim(String inStr) {
        if(empty(inStr)) {
            return inStr;
        }
        return inStr.trim();
    }

    /**
     * 判断字符串是否内容相同
     * 
     * @param s1 第1个输入字符串
     * @param s2 第2个输入字符串
     * @return 布尔值=true：两个字符串相等 =false:两个字符串不相等
     */
    public static boolean equals(String s1, String s2) {
        if(s1 == s2)
            return true;
        if(null == s1)
            return false;
        return s1.equals(s2);
    }

    /**
     * 判断字符串是否内容相同，不区分大小写
     * 
     * @param s1 第1个输入字符串
     * @param s2 第2个输入字符串
     * @return 布尔值=true：两个字符串相等 =false:两个字符串不相等
     */
    public static boolean equalsIgnoreCase(String s1, String s2) {
        if(null == s1) {
            return false;
        }
        return s1.equalsIgnoreCase(s2);
    }

    /**
     * 把字符数组转换成字符串
     * 
     * @param array 字符数组
     * @return 转换后的字符串
     */
    public static String toString(char[] array) {
        return String.valueOf(array);
    }

    /**
     * 在str字符串中，将所有token字符串，用delim字符串进行转义处理。
     * 
     * @param str 被替换的字符串
     * @param token 被替换的子字符串
     * @param delim 子字符串需要替换的内容
     * @return 已经替换好的字符串
     */
    public static String normalize(String str, String token, String delim) {
        // 为空，直接返回
        if(empty(str)) {
            return "";
        }
        // 查找并替换
        StringTokenizer tokenizer = new StringTokenizer(str, token);
        StringBuilder fixedBuilder = new StringBuilder();
        while (tokenizer.hasMoreTokens()) {
            if(fixedBuilder.length() == 0) {
                fixedBuilder.append(tokenizer.nextToken());
            } else {
                fixedBuilder.append(fixedBuilder);
                fixedBuilder.append(delim);
                fixedBuilder.append(token);
                fixedBuilder.append(tokenizer.nextToken());
            }
        }

        if(str.indexOf(delim) == 0) {
            fixedBuilder.append(delim).append(token).append(fixedBuilder);
        }

        if(str.lastIndexOf(delim) == (str.length() - 1)) {
            fixedBuilder.append(fixedBuilder).append(delim).append(token);
        }

        return fixedBuilder.toString();
    }

    /**
     * 在字符串中，用新的字符串替换指定的字符
     * 
     * @param src 需要替换的字符串
     * @param charOld 被替换的字符
     * @param strNew 用于替换的字符串
     * @return 已经替换好的字符串
     */
    public static String replace(String src, char charOld, String strNew) {
        if(null == src) {
            return src;
        }
        if(null == strNew) {
            return src;
        }

        StringBuilder buf = new StringBuilder();
        for(int i = 0, n = src.length(); i < n; i++) {
            char c = src.charAt(i);
            if(c == charOld) {
                buf.append(strNew);
            } else {
                buf.append(c);
            }
        }
        return buf.toString();
    }

  



    /**
     * 把字符串的第一个字符变为大写
     * 
     * @param s 输入字符串
     * @return 返回第一个字符是大写的字符串
     */
    public static String upperFirst(String s) {
        String str = null;
        if(null != s) {
            if(s.length() == 1) {
                str = s.toUpperCase();
            } else {
                str = s.substring(0, 1).toUpperCase() + s.substring(1);
            }
        }
        return str;
    }

    /**
     * 把字符对象第一个字符变为大写
     * 
     * @param sb 字符对象
     */
    public static void upperFirst(StringBuilder sb) {
        if((null != sb) && (sb.length() > 0)) {
            sb.setCharAt(0, Character.toUpperCase(sb.charAt(0)));
        }
    }

    /**
     * 把字符串的第一个字符变为小写
     * 
     * @param s 输入的字符串
     * @return 返回的第一个字符是小写的字符串
     */
    public static String lowerFirst(String s) {
        String str = null;
        if(null != s) {
            if(s.length() == 1) {
                str = s.toLowerCase();
            } else {
                str = s.substring(0, 1).toLowerCase() + s.substring(1);
            }
        }
        return str;
    }

    /**
     * 把字符对象的第一个字符变为小写
     * 
     * @param sb 输入的字符对象
     */
    public static void lowerFirst(StringBuilder sb) {
        if((null != sb) && (sb.length() > 0)) {
            sb.setCharAt(0, Character.toLowerCase(sb.charAt(0)));
        }
    }

    /**
     * 根据指定的delima标志获取输入字符串的后缀
     * 
     * @param str 输入字符串
     * @param delima 指定的标志,一般是一个字符，如“.”
     * @return 输入字符串子的后缀
     */
    public static String getLastSuffix(String str, String delima) {
        if(zero(delima)) {
            return str;
        }

        String suffix = "";
        if(!zero(str)) {
            int index = str.lastIndexOf(delima);
            if(index >= 0) {
                suffix = str.substring(index + delima.length());
            } else {
                suffix = str;
            }
        }
        return suffix;
    }

    /**
     * 根据指定的delima标志获取输入字符串的前缀
     * 
     * @param src 输入字符串
     * @param delima 指定的标志,一般是一个字符，如“.”
     * @return 输入字符串的前缀
     */
    public static String getLastPrefix(String src, String delima) {
        if(zero(delima)) {
            return src;
        }

        String prefix = "";
        if(!zero(src)) {
            int index = src.lastIndexOf(delima);
            if(index >= 0) {
                prefix = src.substring(0, index);
            }
        }
        return prefix;
    }

   

   

    /**
     * 判断输入字符串是否包含指定的字符串
     * ""空串不认为被包含。String.indexOf()认为空串被包含
     * @param str 输入字符串
     * @param searchStr 指定是否包含的字符串
     * @return =true:包含指定的字符串 =false:不包含指定的字符串
     */
    public static boolean contains(String str, String searchStr) {
        if(str == null || searchStr == null) {
            return false;
        }
        if(searchStr.length() == 0) // 
        {
            return false;
        } else {
            return str.indexOf(searchStr) >= 0;
        }
    }
    
    public static String genUUid() {
    	return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
