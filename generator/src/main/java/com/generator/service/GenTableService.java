package com.generator.service;

import com.generator.common.entity.BaseService;
import com.generator.common.entity.Page;
import com.generator.entity.GenTable;

import java.util.List;

/**
 * 业务表Service
 *
 * @author ThinkGem
 * @version 2013-10-15
 */
public interface GenTableService extends BaseService<GenTable> {

    GenTable getById(String id);

    Page<GenTable> find(Page<GenTable> page, GenTable genTable);

    /**
     * 获取物理数据表列表
     *
     * @param genTable
     * @return
     */
    List<GenTable> findTableListFormDb(GenTable genTable);

    /**
     * 验证表名是否可用，如果已存在，则返回false
     *
     * @param tableName
     * @return
     */
    boolean checkTableName(String tableName);

    /**
     * 获取物理数据表列表
     *
     * @param genTable
     * @return
     */
    GenTable getTableFormDb(GenTable genTable);

    void saveAndColumn(GenTable genTable);

    void deleteColumn(GenTable genTable);
}
