#代码生成工具（基于jeesite的代码生成器修改） 
    
    操作步骤：
        1. 导入 generator 模块下 /file/init.db
        2. 修改mysql连接
        3. 启动项目后可以看到四个选项
            生成方案列表
            生成方案添加
            业务表列表
            业务表查看
        4. 生成流程
            a) 业务表查看 --> 添加表后在 “业务表列表” 可以看到添加的信息
            b) 生成方案添加 --> 保存（代码生成），保存后在 “生成方案列表” 可以修改或者重新生成
            
    说明：
        新建的业务表建议加上 create_time update_time valid 三个字段