package com.generator.service;

import com.generator.common.entity.BaseService;
import com.generator.entity.User;

/**
 * @author liuyuhu
 * @date 2018/1/19  10:01
 */
public interface UserService extends BaseService<User> {
    /**
     * 根据用户名获取用户
     * @param name
     * @return
     */
    User getByName(String name);

}
