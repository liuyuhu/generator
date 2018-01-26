package com.generator.service.impl;

import com.generator.common.entity.BaseServiceImpl;
import com.generator.dao.UserDao;
import com.generator.entity.User;
import com.generator.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author liuyuhu
 * @date 2018/1/19  10:03
 */

@Service
public class UserServiceImpl extends BaseServiceImpl<UserDao, User> implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public User getByName(String name) {
        return userDao.getByName(name);
    }
}
