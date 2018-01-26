package com.generator.service;

import com.generator.common.entity.BaseService;
import com.generator.common.entity.Page;
import com.generator.entity.GenTemplate;

/**
 * 代码模板Service
 *
 * @author ThinkGem
 * @version 2013-10-15
 */
public interface GenTemplateService extends BaseService<GenTemplate> {

    Page<GenTemplate> find(Page<GenTemplate> page, GenTemplate genTemplate);

    @Override
    int save(GenTemplate genTemplate);

}
