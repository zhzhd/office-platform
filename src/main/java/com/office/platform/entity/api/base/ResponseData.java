package com.office.platform.entity.api.base;

import java.io.Serializable;

/**
 * @Author zhzhd
 * @Date 2019-01-27
 * @Description
 */
public class ResponseData<T> implements Serializable {

    /**
     * 是否成功
     */
    private boolean success;

    /**
     * 返回结果码
     */
    private String code;
    /**
     * 返回信息描述
     */
    private String message;

    /**
     * 子码
     */
    private String subCode;

    /**
     * 子码描述
     */
    private String subMessage;

    /**
     * 返回数据
     */
    private T data;

    public ResponseData() {
    }

    public ResponseData(boolean success, String code, String message) {
        this.success = success;
        this.code = code;
        this.message = message;
    }
    public ResponseData(boolean success, ResponseEnum responseEnum){
        this.success = success;
        this.code = responseEnum.getValue();
        this.message = responseEnum.getTitle();
    }
    public ResponseData(boolean success, ResponseEnum responseEnum, ResponseSubEnum responseSubEnum){
        this.success = success;
        this.code = responseEnum.getValue();
        this.message = responseEnum.getTitle();
        this.subCode = responseSubEnum.getValue();
        this.subMessage = responseSubEnum.getTitle();
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSubCode() {
        return subCode;
    }

    public void setSubCode(String subCode) {
        this.subCode = subCode;
    }

    public String getSubMessage() {
        return subMessage;
    }

    public void setSubMessage(String subMessage) {
        this.subMessage = subMessage;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
