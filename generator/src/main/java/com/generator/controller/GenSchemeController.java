package com.generator.controller;

import com.generator.common.entity.BaseController;
import com.generator.common.entity.Page;
import com.generator.entity.GenScheme;
import com.generator.service.GenSchemeService;
import com.generator.service.GenTableService;
import com.generator.util.GenUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

/**
 * 生成方案Controller
 *
 * @author ThinkGem
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "/admin/gen/genScheme")
public class GenSchemeController extends BaseController {

    @Autowired
    private GenSchemeService genSchemeService;

    @Autowired
    private GenTableService genTableService;

    @ModelAttribute
    public GenScheme get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return genSchemeService.get(id);
        } else {
            return new GenScheme();
        }
    }

    @RequestMapping(value = {"list", ""})
    public String list(GenScheme genScheme, Model model) {
        Page<GenScheme> page = genSchemeService.find(new Page<GenScheme>(), genScheme);
        model.addAttribute("page", page);
        return "modules/gen/genSchemeList";
    }

    @RequestMapping(value = "/form")
    public String form(GenScheme genScheme, Model model) {
        if (StringUtils.isBlank(genScheme.getPackageName())) {
            genScheme.setPackageName("com.generator");
        }
        model.addAttribute("genScheme", genScheme);
        model.addAttribute("config", GenUtils.getConfig());
        model.addAttribute("tableList", genTableService.listAll(null));
        return "modules/gen/genSchemeForm";
    }

    @RequestMapping(value = "save")
    public String save(GenScheme genScheme) {
        genScheme.setCreateTime(new Date());
        genScheme.setUpdateTime(new Date());
        genSchemeService.saveOrUpdate(genScheme);
        return "redirect:/admin/gen/genScheme/";
    }

    @RequestMapping(value = "delete")
    public String delete(GenScheme genScheme) {
        genSchemeService.deleteLogic(genScheme.getId());
        return "redirect:/admin/gen/genScheme/";
    }

}
