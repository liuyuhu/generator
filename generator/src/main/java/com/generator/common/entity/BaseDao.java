package com.generator.common.entity;

import java.util.List;

/**
 * DAO支持类实现
 *
 * @param <T>
 * @author ThinkGem
 * @version 2014-05-16
 */
public interface BaseDao<T> {

    /**
     * 获取单条数据
     *
     * @param id
     * @return
     */
    T get(String id);

    /**
     * 获取多条数据
     *
     * @param entity
     * @return
     */
    List<T> list(T entity);

    /**
     * 查询数据列表，分页
     *
     * @param page
     * @return
     */
    List<T> listPage(Page page);

    /**
     * 查询所有数据列表
     *
     * @param entity
     * @return
     */
    List<T> listAll(T entity);

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
     * 删除数据（物理删除）
     *
     * @param id
     * @return
     * @see public int delete(T entity)
     */
    @Deprecated
    int delete(String id);

    /**
     * 删除数据（逻辑删除，更新valid字段为1）
     *
     * @param id
     * @return
     */
    int deleteLogic(String id);

}