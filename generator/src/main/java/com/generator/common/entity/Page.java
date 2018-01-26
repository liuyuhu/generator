package com.generator.common.entity;

import com.generator.common.config.Global;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页类
 *
 * @author ThinkGem
 * @version 2013-7-2
 */
@Data
@Accessors(chain = true)
public class Page<T> {
    /**
     * 当前页码
     */
    private int pageNo = 1;
    /**
     * 页面大小
     */
    private int pageSize = Integer.valueOf(Global.getConfig("page.pageSize"));
    /**
     * 总记录数
     */
    private long count;
    /**
     * 查询对象
     */
    private T condition;
    /**
     * in 查询
     */
    private Object[] ids;
    /**
     * 排序信息
     */
    private String orderBy;
    /**
     * 结果集
     */
    private List result = new ArrayList();

    public Page(){}

    public Page(T condition) {
        this.condition = condition;
    }

    public Page(T condition, Object[] ids) {
        this(condition);
        this.ids = ids;

    }

    public Page(T condition, Object[] ids, String orderBy) {
        this(condition, ids);
        this.orderBy = orderBy;
    }

}
