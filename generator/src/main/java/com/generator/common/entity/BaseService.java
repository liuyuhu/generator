package com.generator.common.entity;

import java.util.List;

/**
 * @author generator
 * @date 2018/1/16  14:25
 */
public interface BaseService<T> {
    /**
     * 获取单条数据
     *
     * @param id
     * @return
     */
    T get(String id);

    /**
     * 获取单条数据
     *
     * @param entity
     * @return
     */
    T get(T entity);

    /**
     * 获取多条数据
     *
     * @param entity
     * @return
     */
    List<T> list(T entity);

    /**
     * 查询数据列表，如果需要分页，请设置分页对象
     *
     * @param page
     * @return
     */
    List<T> listPage(Page page);

    /**
     * 插入数据
     *
     * @param entity
     * @return
     */
    int save(T entity);

    /**
     * 更新数据为空字段不更新
     *
     * @param entity
     * @return
     */
    int update(T entity);

    /**
     * 根据实体全部更新数据
     *
     * @param entity
     * @return
     */
    int updateAll(T entity);

    /**
     * 删除数据（物理删除 false）
     *
     * @param id
     * @param logic
     * @return
     * @see public int delete(T entity)
     */
    int delete(String id, Boolean logic);

}
