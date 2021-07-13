package com.office.platform.entity.api.base;
/**
 *@author zhangzhendong1
 *@date 2019/2/1
 *@package com.zhzhd.bgsystem.enums
 *@describe
 **/
public enum  ResponseSubEnum {
    /**
     * 登录相关子码
     */
    NO_LOGIN("40101", "未登录"),
    NO_AUTHORIZATION("40102", "无权限"),
    SERVICE_ERROR("40103", "服务器内部错误"),
    NO_RESOURCE("40104", "资源不存在"),
    /**
     * http请求参数校验相关子码
     */
    PRAM_EMPTY("40201", "参数不能为空"),
    EXIST("40202", "相关信息已存在"),
    NOT_EXIST("40203", "相关信息不存在"),
    OPERATOR_FAILURE("40204", "操作失败"),
    PRAM_LENGTH_ERROR("40205", "字段长度不合规"),

    /**
     * 更新登录密码子码
     */
    PASSWORD_ERROR("40301", "原登录密码不正确"),
    ;

    private final String value;

    private final String title;

    ResponseSubEnum(String value, String title){
        this.value = value;
        this.title = title;
    }

    public String getValue() {
        return value;
    }

    public String getTitle() {
        return title;
    }

    @Override
    public String toString() {
        return this.title;
    }

    public static ResponseSubEnum of(final String value) {
        for (ResponseSubEnum rpt : ResponseSubEnum.values()) {
            if (rpt.value == value) {
                return rpt;
            }
        }
        return null;
    }
}