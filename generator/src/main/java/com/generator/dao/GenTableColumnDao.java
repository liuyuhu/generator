package com.generator.dao;

import com.generator.common.entity.BaseDao;
import com.generator.entity.GenTableColumn;

/**
 * 业务表字段DAO接口
 * @author ThinkGem
 * @version 2013-10-15
 */
public interface GenTableColumnDao extends BaseDao<GenTableColumn> {
	
	void deleteByGenTableId(String genTableId);
}
