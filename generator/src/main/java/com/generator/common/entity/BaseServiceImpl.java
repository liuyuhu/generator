package com.generator.common.entity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service基类
 * @author ThinkGem
 * @version 2014-05-16
 */

public abstract class BaseServiceImpl<D extends BaseDao<T>, T>  implements BaseService<T> {
	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;

	/**
	 * 获取单条数据
	 *
	 * @param id
	 * @return
	 */
	@Override
	public T get(String id) {
		return dao.get(id);
	}

	/**
	 * 获取多条数据
	 *
	 * @param entity
	 * @return
	 */
	@Override
	public List<T> list(T entity){
		return dao.list(entity);
	}

	/**
	 * 查询数据列表，如果需要分页，请设置分页对象
	 *
	 * @param page
	 * @return
	 */
	@Override
	public List<T> listPage(Page page) {
		return dao.listPage(page);
	}

	/**
	 * 查询所有数据列表
	 *
	 * @param entity
	 * @return
	 */
	@Override
	public List<T> listAll(T entity) {
		return dao.listAll(entity);
	}

	/**
	 * 插入数据
	 *
	 * @param entity
	 * @return
	 */
	@Override
	public int save(T entity) {
		return dao.save(entity);
	}

	/**
	 * 更新数据为空字段不更新
	 *
	 * @param entity
	 * @return
	 */
	@Override
	public int update(T entity) {
		return dao.update(entity);
	}

	/**
	 * 根据实体全部更新数据
	 *
	 * @param entity
	 * @return
	 */
	@Override
	public int updateAll(T entity) {
		return dao.updateAll(entity);
	}

	/**
	 * 删除数据（物理删除）
	 *
	 * @param id
	 * @return
	 * @see public int delete(T entity)
	 */
	@Deprecated
	@Override
	public int delete(String id) {
		return dao.delete(id);
	}

	/**
	 * 删除数据（逻辑删除，更新valid字段为1）
	 *
	 * @param id
	 * @return
	 */
	@Override
	public int deleteLogic(String id) {
		return dao.deleteLogic(id);
	}

}
