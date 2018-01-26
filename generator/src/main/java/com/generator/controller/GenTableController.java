package com.generator.controller;

import com.generator.common.entity.BaseController;
import com.generator.common.entity.Page;
import com.generator.common.utils.IDUtils;
import com.generator.entity.GenTable;
import com.generator.service.GenTableService;
import com.generator.util.GenUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 业务表Controller
 *
 * @author ThinkGem
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "/admin/gen/genTable")
public class GenTableController extends BaseController {

    @Autowired
    private GenTableService genTableService;

    @ModelAttribute
    public GenTable get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return genTableService.getById(id);
        } else {
            return new GenTable();
        }
    }

    @RequestMapping(value = {"list", ""})
    public String list(GenTable genTable, Model model) {
        Page<GenTable> page = genTableService.find(new Page<GenTable>(), genTable);
        model.addAttribute("page", page);
        return "modules/gen/genTableList";
    }

    @RequestMapping(value = "form")
    public String form(GenTable genTable, Model model) {
        // 获取物理表列表
        List<GenTable> tableList = genTableService.findTableListFormDb(new GenTable());
        model.addAttribute("tableList", tableList);
        // 验证表是否存在
        if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())) {
            genTable.setName("");
        }
        // 获取物理表字段
        else {
            genTable = genTableService.getTableFormDb(genTable);
        }
        model.addAttribute("genTable", genTable);
        model.addAttribute("config", GenUtils.getConfig());
        return "modules/gen/genTableForm";
    }

    @RequestMapping(value = "save")
    public String save(GenTable genTable, Model model) {
        // 验证表是否已经存在
        if (StringUtils.isBlank(genTable.getId()) && !genTableService.checkTableName(genTable.getName())) {
            genTable.setName("");
            return form(genTable, model);
        }
        genTableService.saveAndColumn(genTable);
        return "redirect:/admin/gen/genTable/?repage";
    }

    @RequestMapping(value = "delete")
    public String delete(GenTable genTable) {
        genTableService.delete(genTable.getId());
        return "redirect:/admin/gen/genTable/?repage";
    }

}
