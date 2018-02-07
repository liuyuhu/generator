package com.generator.usertest.entity;

import com.generator.common.entity.BaseEntity;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 用户信息Entity
 * @author liuyuhu
 * @version 2018-02-07
 */

@Data
@Accessors(chain = true)
public class UserTest extends BaseEntity {
    /**
     * 主键id
     */ 
    private String userId;
    /**
     * 用户名称
     */ 
    private String userName;
    /**
     * 用户年龄
     */ 
    private Integer age;

}