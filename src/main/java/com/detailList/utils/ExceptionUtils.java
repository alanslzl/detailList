
package com.detailList.utils;
/**
 * function：
 * 			异常工具集合，用于处理异常
 * grant：
 * 			陕西易企伟业网络有限公司   2014-05
 * author：
 * 			王林兴
 * version：
 * 			1.0
 */
public class ExceptionUtils {
	
	protected ExceptionUtils(){}
	
	/**
	 * 获取错误信息
	 * @param stackTraceElement = ExceptionUtils.getThread().getStackTrace()
	 * @param e = Exception
	 * ExceptionUtils.getErrorInfo(ExceptionUtils.getThread().getStackTrace(), e)
	 */
	public static String getErrorInfo(Exception e){
		StackTraceElement[] stackTraceElement = e.getStackTrace();
		String errCont = "";
		if(e!=null){
			errCont += "异常信息："+e+"\n";
		}
		if(stackTraceElement!=null&&stackTraceElement.length>1){
			errCont += "异常位置：";
			for(int i=0;i<stackTraceElement.length;i++){
				if(stackTraceElement[i].toString().indexOf("Unknown Source")<0){
					errCont += stackTraceElement[i];
					break;
				}
			}
		}
		return errCont;
	}
}