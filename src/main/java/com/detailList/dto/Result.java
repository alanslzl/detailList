package com.detailList.dto;

public class Result {
	private String resultCode;
	private String resultMessage;
	private Object resultObject;
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMessage() {
		return resultMessage;
	}
	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}
	public Object getResultObject() {
		return resultObject;
	}
	public void setResultObject(Object resultObject) {
		this.resultObject = resultObject;
	}
	/**
	 * 成功返回方法
	 * @return 
	 */
	public static Result success() {
		Result r = new Result();
		r.setResultCode("0");
		r.setResultMessage("成功");
		return r;
	}
	/**
	 * 成功返回方法
	 * @return 
	 */
	public static Result success(String message,Object t) {
		Result r = new Result();
		r.setResultCode("0");
		r.setResultMessage(message);
		r.setResultObject(t);
		return r;
	}
	
	/**
	 * 成功返回方法
	 * @return 
	 */
	public static Result error(String message) {
		Result r = new Result();
		r.setResultCode("1");
		r.setResultMessage(message);
		return r;
	}
}
