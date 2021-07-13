package com.office.platform.mapper;

import java.io.Serializable;

public interface BaseMapper<T, KEY extends Serializable> {

    T selectOneByKey(KEY key);

    int insert(T record);
}
