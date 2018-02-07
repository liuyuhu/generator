package com.generator.usertest.service.impl;

import com.generator.common.entity.BaseServiceImpl;
import com.generator.usertest.entity.UserTest;
import com.generator.usertest.dao.UserTestDao;
import com.generator.usertest.service.UserTestService;
import org.springframework.stereotype.Service;

/**
 * 用户信息ServiceImpl
 * @author liuyuhu
 * @version 2018-02-07
 */

@Service
public class UserTestServiceImpl extends BaseServiceImpl<UserTestDao, UserTest> implements UserTestService {
	
}