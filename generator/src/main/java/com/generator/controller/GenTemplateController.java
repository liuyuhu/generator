package com.generator.controller;

import com.generator.common.entity.BaseController;
import com.generator.common.entity.Page;
import com.generator.common.utils.IDUtils;
import com.generator.entity.GenTemplate;
import com.generator.service.GenTemplateService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 代码模板Controller
 *
 * @author ThinkGem
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "/admin/gen/genTemplate")
public class GenTemplateController extends BaseController {

    @Autowired
    private GenTemplateService genTemplateService;

    @ModelAttribute
    public GenTemplate get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return genTemplateService.get(id);
        } else {
            return new GenTemplate();
        }
    }

    @RequestMapping(value = {"list", ""})
    public String list(GenTemplate genTemplate, Model model) {
        Page<GenTemplate> page = genTemplateService.find(new Page<GenTemplate>(), genTemplate);
        model.addAttribute("page", page);
        return "modules/gen/genTemplateList";
    }

    @RequestMapping(value = "form")
    public String form(GenTemplate genTemplate, Model model) {
        model.addAttribute("genTemplate", genTemplate);
        return "modules/gen/genTemplateForm";
    }

    @RequestMapping(value = "save")
    public String save(GenTemplate genTemplate) {
        genTemplate.setId(IDUtils.UUID());
        genTemplateService.save(genTemplate);
        return "redirect:" + adminPath + "/gen/genTemplate/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(GenTemplate genTemplate) {
        genTemplateService.deleteLogic(genTemplate.getId());
        return "redirect:" + adminPath + "/gen/genTemplate/?repage";
    }

}
