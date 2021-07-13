package com.office.platform.entity.api.base;

/**
 * @Author zhzhd
 * @Date 2019-02-16
 * @Description
 */
public class PageRequest<T> {
    /**
     * 请求实体
     */
    private T param;

    private int pageNo;

    private int pageSize;

    private String orderBy;

    public T getParam() {
        return param;
    }

    public void setParam(T param) {
        this.param = param;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
}
