package com.office.platform.entity.api.base;
/**
 *@author zhangzhendong1
 *@date 2019/1/30
 *@package com.zhzhd.bgsystem.enums
 *@describe
 **/
public enum  ResponseEnum {
    SUCCESS("0000", "成功"),
    SUCCESS_NULL("0001", "成功,查询结果为null!"),
    ERROR_EXCEPTION("1000", "服务不可用,请重试！"),
    ERROR_COMMON_PRAM("2000", "缺少或非法的公共参数"),
    ERROR_AUTH("3000", "调用接口权限不足"),
    ERROR_BUSS("4000", "业务原因异常");

    private final String value;

    private final String title;

    ResponseEnum(String value, String title){
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

    public static ResponseEnum of(final String value) {
        for (ResponseEnum rpt : ResponseEnum.values()) {
            if (rpt.value == value) {
                return rpt;
            }
        }
        return null;
    }
}