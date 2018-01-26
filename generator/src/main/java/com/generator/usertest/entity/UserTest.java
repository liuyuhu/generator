package com.generator.usertest.entity;

import com.generator.common.entity.BaseEntity;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 生成功能描述:Entity
 * @author liuyuhu
 * @version 2018-01-26
 */

@Data
@Accessors(chain = true)
public class UserTest extends BaseEntity {
    /**
     * 主键id
     */ 
    private String id;
    /**
     * 用户名称
     */ 
    private String userName;
    /**
     * 用户年龄
     */ 
    private Integer age;

}