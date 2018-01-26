package com.generator.dao;

import com.generator.common.entity.BaseDao;
import com.generator.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * @author liuyuhu
 * @date 2018/1/19  10:05
 */
public interface UserDao extends BaseDao<User> {
    /**
     * 根据用户名获取用户
     * @param name
     * @return
     */
    User getByName(@Param("name") String name);

}
