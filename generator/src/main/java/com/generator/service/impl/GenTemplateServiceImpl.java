package com.generator.service.impl;

import com.generator.common.entity.BaseServiceImpl;
import com.generator.common.entity.Page;
import com.generator.dao.GenTemplateDao;
import com.generator.entity.GenTemplate;
import com.generator.service.GenTemplateService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 代码模板Service
 * @author ThinkGem
 * @version 2013-10-15
 */
@Service
public class GenTemplateServiceImpl extends BaseServiceImpl<GenTemplateDao, GenTemplate> implements GenTemplateService {

	@Autowired
	private GenTemplateDao genTemplateDao;

	@Override
	public Page<GenTemplate> find(Page<GenTemplate> page, GenTemplate genTemplate) {
		page.setResult(genTemplateDao.listPage(page.setCondition(genTemplate)));
		return page;
	}

	@Override
	public int save(GenTemplate genTemplate) {
		if (genTemplate.getContent()!=null){
			genTemplate.setContent(StringEscapeUtils.unescapeHtml4(genTemplate.getContent()));
		}
		if (StringUtils.isBlank(genTemplate.getId())){
			return genTemplateDao.save(genTemplate);
		}else{
			return genTemplateDao.update(genTemplate);
		}
	}

}
