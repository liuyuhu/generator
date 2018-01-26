package com.generator.entity;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author liuyuhu
 * @date 2018/1/19  10:02
 */

@Data
@Accessors(chain = true)
public class User {
    private String id;

    private String name;

    private String age;
}
