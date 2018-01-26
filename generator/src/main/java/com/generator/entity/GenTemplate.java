package com.generator.entity;

import com.google.common.collect.Lists;
import com.generator.common.entity.BaseEntity;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.util.List;

/**
 * 生成方案Entity
 *
 * @author ThinkGem
 * @version 2013-10-15
 */
@XmlRootElement(name = "template")
@Data
@Accessors(chain = true)
public class GenTemplate extends BaseEntity {
    /**
     * 主键
     */
    private String id;
    /**
     * 名称
     */
    @Length(min = 1, max = 200)
    private String name;
    /**
     * 分类
     */
    private String category;
    /**
     * 生成文件路径
     */
    private String filePath;
    /**
     * 文件名
     */
    private String fileName;
    /**
     * 内容
     */
    private String content;

    @XmlTransient
    public List<String> getCategoryList() {
        if (category == null) {
            return Lists.newArrayList();
        } else {
            return Lists.newArrayList(StringUtils.split(category, ","));
        }
    }

    public void setCategoryList(List<String> categoryList) {
        if (categoryList == null) {
            this.category = "";
        } else {
            this.category = "," + StringUtils.join(categoryList, ",") + ",";
        }
    }

}


