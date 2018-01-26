/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : generator

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2018-01-26 14:28:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成表编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `valid` int(1) DEFAULT '1' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'tree', '', '', '', '', 'f6e4dafaa72f4c509636484715f33a96', '2013-08-12 13:10:05', '2018-01-25 10:33:49', '1');
INSERT INTO `gen_scheme` VALUES ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '2013-08-12 13:10:05', '2013-08-12 13:10:05', '1');
INSERT INTO `gen_scheme` VALUES ('a5292970bcac4e49b01245a80ac67be7', '方案名称:', 'curd', 'com.generator', 'usertest', '', '生成功能描述:', '生成功能名:', 'liuyuhu', 'b782e0ca5db942d2b42f42309285e207', '2018-01-26 12:10:05', '2018-01-26 14:20:07', '1');
INSERT INTO `gen_scheme` VALUES ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '2013-08-12 13:10:05', '2013-08-12 13:10:05', '1');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `valid` int(1) NOT NULL DEFAULT '1' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('b782e0ca5db942d2b42f42309285e207', 'user_test', 'user_test', 'UserTest', '', '', null, '2018-01-26 12:09:28', '1');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `valid` int(1) NOT NULL DEFAULT '1' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('5f5f3d24299941f7a9761988ab0005ae', 'b782e0ca5db942d2b42f42309285e207', 'id', '主键id', 'varchar(32)', 'String', 'id', '1', '0', '1', '0', '0', '1', '=', 'input', '', null, '10', '2018-01-26 12:01:57', '2018-01-26 12:09:28', '1');
INSERT INTO `gen_table_column` VALUES ('758c6671c6144caca07205b33818ef36', 'b782e0ca5db942d2b42f42309285e207', 'user_name', '用户名称', 'varchar(255)', 'String', 'userName', '0', '1', '1', '1', '0', '1', 'like', 'input', '', null, '20', '2018-01-26 12:01:57', '2018-01-26 12:09:28', '1');
INSERT INTO `gen_table_column` VALUES ('7892c07e99684cf89afc845fb50e0be1', 'b782e0ca5db942d2b42f42309285e207', 'update_time', '更新时间', 'datetime', 'java.util.Date', 'updateTime', '0', '1', '1', '1', '1', '0', '=', 'dateselect', '', null, '50', '2018-01-26 12:01:57', '2018-01-26 12:09:28', '1');
INSERT INTO `gen_table_column` VALUES ('8ac75d8223b645d8a09577118ae3fbc7', 'b782e0ca5db942d2b42f42309285e207', 'create_time', '创建时间', 'datetime', 'java.util.Date', 'createTime', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, '40', '2018-01-26 12:01:57', '2018-01-26 12:09:28', '1');
INSERT INTO `gen_table_column` VALUES ('ee617b05634e47b9920da60aab468f45', 'b782e0ca5db942d2b42f42309285e207', 'valid', '是否删除', 'int(11)', 'Integer', 'valid', '0', '1', '1', '1', '0', '0', '=', 'radiobox', 'valid', null, '60', '2018-01-26 12:01:57', '2018-01-26 12:09:28', '1');
INSERT INTO `gen_table_column` VALUES ('fb29d9e1b3d14fc084f333882f0c0a5b', 'b782e0ca5db942d2b42f42309285e207', 'age', '用户年龄', 'int(11)', 'Integer', 'age', '0', '1', '1', '1', '0', '1', '=', 'input', '', null, '30', '2018-01-26 12:01:57', '2018-01-26 12:09:28', '1');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
  `content` text COLLATE utf8_bin COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `valid` int(1) NOT NULL DEFAULT '1' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('017b4839-f073-431a-b1ea-c5ef4b17fe56', 'test99', '99');
INSERT INTO `t_user` VALUES ('02fccebb-3065-4cf3-a072-242299f93f0d', 'test45', '45');
INSERT INTO `t_user` VALUES ('052b9765-4869-4dbe-b20a-b376a040ae87', 'test30', '30');
INSERT INTO `t_user` VALUES ('05e16c15-6c7b-4f88-a94d-93ee4b0d044b', 'test88', '88');
INSERT INTO `t_user` VALUES ('0650ca24-b1eb-47ed-9071-3c2474ce07df', 'test76', '76');
INSERT INTO `t_user` VALUES ('083cf16b-f05e-40a8-8fb5-9cb1fcc503d6', 'test18', '18');
INSERT INTO `t_user` VALUES ('0c9c4190-e777-40fb-8f82-0e18a87c8932', 'test66', '66');
INSERT INTO `t_user` VALUES ('0ccd8179-87dd-401a-b4ba-acefe0288c15', 'test55', '55');
INSERT INTO `t_user` VALUES ('0dba0c55-bdb0-412a-bd3a-e51b34f0c220', 'test25', '25');
INSERT INTO `t_user` VALUES ('10a79221-0697-4742-8420-daa613e52bea', 'test49', '49');
INSERT INTO `t_user` VALUES ('11ca9d44-566d-4543-b272-b135aaa65220', 'test84', '84');
INSERT INTO `t_user` VALUES ('12ce3a6d-c062-4907-9f78-24a2b5f85d1a', 'test46', '46');
INSERT INTO `t_user` VALUES ('13bbbe4e-749b-489c-8334-c7cceca246af', 'test51', '51');
INSERT INTO `t_user` VALUES ('13f3c362-47fa-4acc-9d24-1ecd24c664be', 'test11', '11');
INSERT INTO `t_user` VALUES ('17c4c656-a6d9-49ca-b4ce-cdc115e91a60', 'test64', '64');
INSERT INTO `t_user` VALUES ('186795dc-db2f-446c-8953-60917e289dcb', 'test42', '42');
INSERT INTO `t_user` VALUES ('1b37ccb0-1c4b-42c8-a656-c77930947569', 'test44', '44');
INSERT INTO `t_user` VALUES ('1df1e47d-d2d3-41d5-ac26-cb53ad07c1d0', 'test91', '91');
INSERT INTO `t_user` VALUES ('1e000512-0997-480c-9e39-249fc1eddcd2', 'test96', '96');
INSERT INTO `t_user` VALUES ('1ede5397-f233-495d-988c-8d658fe2921f', 'test15', '15');
INSERT INTO `t_user` VALUES ('1f58e7d3-79c8-4bec-93cc-a6b7b31af220', 'test24', '24');
INSERT INTO `t_user` VALUES ('229aff89-0cdd-43f3-9a19-3cd9549f1c57', 'test56', '56');
INSERT INTO `t_user` VALUES ('2a495ba9-bc55-43a3-ac39-bf9902045989', 'test33', '33');
INSERT INTO `t_user` VALUES ('2fe2f4de-e3a2-491d-ab05-e03bc75ae005', 'test89', '89');
INSERT INTO `t_user` VALUES ('31c02f21-f6ae-4e0b-b069-7c43a388775b', 'test72', '72');
INSERT INTO `t_user` VALUES ('3641ad26-f368-4c10-ae27-81a7c1153c94', 'test2', '2');
INSERT INTO `t_user` VALUES ('3670d32e-49a7-4ec2-af5c-38bf671f61b9', 'test0', '0');
INSERT INTO `t_user` VALUES ('378ea1b5-be95-4b2b-b055-5da42ee89277', 'test40', '40');
INSERT INTO `t_user` VALUES ('3aa2d053-7b4a-4e3e-a03b-d2f553aca16e', 'test58', '58');
INSERT INTO `t_user` VALUES ('3dd01f77-6a11-440a-acba-725cf0d31fbc', 'test22', '22');
INSERT INTO `t_user` VALUES ('3e58a173-e883-4f1a-9ce1-95df5d200a53', 'test6', '6');
INSERT INTO `t_user` VALUES ('3ee43fc4-f592-45db-a002-cadfca5568d3', 'test47', '47');
INSERT INTO `t_user` VALUES ('414a4354-b53a-4561-8cdc-97aabde8f99b', 'test60', '60');
INSERT INTO `t_user` VALUES ('46c34af4-c3f3-4cfe-87c7-bcb3b2156941', 'test48', '48');
INSERT INTO `t_user` VALUES ('48f8c00e-d9c4-4285-b527-a6422d3d3279', 'test10', '10');
INSERT INTO `t_user` VALUES ('4df7f402-ec05-4aab-9183-b5794c081ce2', 'test78', '78');
INSERT INTO `t_user` VALUES ('4e633310-f6e0-4428-96dc-5139e71db602', 'test26', '26');
INSERT INTO `t_user` VALUES ('4f1d595c-d4da-4734-9bbc-f5c4c72e940c', 'test16', '16');
INSERT INTO `t_user` VALUES ('5477dac0-0647-4ec0-9657-7261de12b2ec', 'test80', '80');
INSERT INTO `t_user` VALUES ('5921ed94-d651-4766-8ecc-27f8ba5536c3', 'test62', '62');
INSERT INTO `t_user` VALUES ('59415ad7-4d61-45c3-a8ab-569754520936', 'test3', '3');
INSERT INTO `t_user` VALUES ('5ae82b30-f7b5-4631-973a-a971dfbb8943', 'test70', '70');
INSERT INTO `t_user` VALUES ('5b48cf76-c8bd-4241-9b3c-df32cf77351d', 'test17', '17');
INSERT INTO `t_user` VALUES ('5b8973dd-a886-4476-b242-2401032176b7', 'test73', '73');
INSERT INTO `t_user` VALUES ('5d273952-f0f3-40c0-8bf7-7bf7749fe829', 'test87', '87');
INSERT INTO `t_user` VALUES ('5e1d45c0-a9c2-457a-ab44-d103d0223973', 'test37', '37');
INSERT INTO `t_user` VALUES ('65187202-8667-4983-ba6e-1950f9be9356', 'test34', '34');
INSERT INTO `t_user` VALUES ('676592f4-300f-44cf-b117-5cc723e9fed2', 'test20', '20');
INSERT INTO `t_user` VALUES ('6cfca02c-843a-48f9-885f-094a14be8359', 'test75', '75');
INSERT INTO `t_user` VALUES ('6ea3ed6c-f7c0-4621-a234-ec1477005d79', 'test23', '23');
INSERT INTO `t_user` VALUES ('6f9c7362-6bcb-4f80-9809-8ace30226174', 'test8', '8');
INSERT INTO `t_user` VALUES ('72b83653-c9bd-4939-a8bf-286e747e56c9', 'test85', '85');
INSERT INTO `t_user` VALUES ('7495f2fe-2d1e-42d7-9e5e-bb28287104e2', 'test28', '28');
INSERT INTO `t_user` VALUES ('767f8285-b3cd-4e5b-a0ef-952bfc36f4cf', 'test52', '52');
INSERT INTO `t_user` VALUES ('76970b85-2a49-4d0a-9cbb-fe0e89135248', 'test50', '50');
INSERT INTO `t_user` VALUES ('79b52e00-7b84-4ab1-b851-09e298681977', 'test90', '90');
INSERT INTO `t_user` VALUES ('7af3673d-108b-4273-b99a-93ca43ce7e24', 'test5', '5');
INSERT INTO `t_user` VALUES ('7b380962-8bb8-4d4b-afbf-3f49c62b9009', 'test59', '59');
INSERT INTO `t_user` VALUES ('7bf1974d-4170-48bc-9908-1e39858a5050', 'test35', '35');
INSERT INTO `t_user` VALUES ('7c9f9e5e-7c08-4336-a011-77225e0bed35', 'test29', '29');
INSERT INTO `t_user` VALUES ('7fc23568-1205-4408-89ac-047d83adffd6', 'test63', '63');
INSERT INTO `t_user` VALUES ('7fcfbd6f-f9f4-4423-a38a-c5f0d8ce1ef0', 'test68', '68');
INSERT INTO `t_user` VALUES ('81f20fb6-585b-4683-af25-2752586b54bd', 'test69', '69');
INSERT INTO `t_user` VALUES ('8220e8df-1bc7-4d74-8134-01010a31feea', 'test67', '67');
INSERT INTO `t_user` VALUES ('8e49a82a-aff9-4e28-8e44-4ea8c3e6c696', 'test98', '98');
INSERT INTO `t_user` VALUES ('9643ab5f-93f7-4a41-8774-f26efaf1dd4f', 'test83', '83');
INSERT INTO `t_user` VALUES ('96899363-9d60-45cd-ae81-7e0f2166ce43', 'test36', '36');
INSERT INTO `t_user` VALUES ('9761bfaf-db1b-486f-a09a-1c39c340acf4', 'test95', '95');
INSERT INTO `t_user` VALUES ('9c2a0336-7245-41c1-987d-42ca9246eab6', 'test53', '53');
INSERT INTO `t_user` VALUES ('9f9bda26-b723-47e8-a217-48ffb2423490', 'test41', '41');
INSERT INTO `t_user` VALUES ('a41d5c9d-2a4c-47df-8d6a-9dc97de9c3f7', 'test79', '79');
INSERT INTO `t_user` VALUES ('a68d04b0-d621-4d6e-8692-e6d623bd3403', 'test21', '21');
INSERT INTO `t_user` VALUES ('a9107420-98de-4ba0-a28f-ddcba37f7f29', 'test32', '32');
INSERT INTO `t_user` VALUES ('a9d57483-141a-4f7f-a74e-72e1bef41b46', 'test31', '31');
INSERT INTO `t_user` VALUES ('adf0ada4-cb1a-4fa0-aec8-9a8a86e2384c', 'test12', '12');
INSERT INTO `t_user` VALUES ('ae68aa80-e1e7-4a2f-8090-e987d229b302', 'test1', '1');
INSERT INTO `t_user` VALUES ('b553a327-ab86-44e9-8f07-1d0af3372df4', 'test57', '57');
INSERT INTO `t_user` VALUES ('b6c18767-f04d-4c87-8d37-d0d9a6aaa7e0', 'test74', '74');
INSERT INTO `t_user` VALUES ('b8646850-0f7b-45e4-beca-c94f504c17ec', 'test27', '27');
INSERT INTO `t_user` VALUES ('b8d086bd-d501-4d2f-b15e-726ac730d70e', 'test92', '92');
INSERT INTO `t_user` VALUES ('be508fa8-5586-4eda-a5dd-07356f030fc5', 'test13', '13');
INSERT INTO `t_user` VALUES ('c04a21d1-28d8-4838-b2ac-4c066a638d91', 'test4', '4');
INSERT INTO `t_user` VALUES ('c07e662a-2488-491e-b149-1b1de8c2b91e', 'test71', '71');
INSERT INTO `t_user` VALUES ('c4284ada-eabe-46a6-80bc-b868352fd0ba', 'test77', '77');
INSERT INTO `t_user` VALUES ('c9f97b56-2e46-47a5-8f5a-f364d4901229', 'test9', '9');
INSERT INTO `t_user` VALUES ('ce188bae-142f-4acc-93da-a94f730ece0c', 'test86', '86');
INSERT INTO `t_user` VALUES ('d262f42a-491a-4471-bfce-c55397b69beb', 'test82', '82');
INSERT INTO `t_user` VALUES ('d3b9e0c9-813a-4fd5-973c-6d2a2025b2a5', 'test54', '54');
INSERT INTO `t_user` VALUES ('d7c9a0b2-f1f2-4687-89b6-1055db94e95c', 'test93', '93');
INSERT INTO `t_user` VALUES ('ddfc3e57-da07-4549-bdba-b8ad81e768b0', 'test7', '7');
INSERT INTO `t_user` VALUES ('e0a95915-68b9-4391-b5bd-81e582c06e05', 'test94', '94');
INSERT INTO `t_user` VALUES ('e188abb2-5dc6-4082-b606-5227dd8de621', 'test19', '19');
INSERT INTO `t_user` VALUES ('e2466633-bfb7-4a16-a3f0-5385e54a1a90', 'test65', '65');
INSERT INTO `t_user` VALUES ('e7e49172-ba04-4cf5-88a3-9e82557b4bc1', 'test61', '61');
INSERT INTO `t_user` VALUES ('ebe84f5a-1e33-44c0-8509-64bfdcca4284', 'test14', '14');
INSERT INTO `t_user` VALUES ('efa09ec3-a2b4-45e0-8b7b-f2a00a59f736', 'test43', '43');
INSERT INTO `t_user` VALUES ('f18f48f7-699b-4fa9-a4e7-97a9370e3d3d', 'test97', '97');
INSERT INTO `t_user` VALUES ('f2d6c498-8e7a-4b1a-abd2-88d1b1175523', 'test81', '81');
INSERT INTO `t_user` VALUES ('f65002dc-3c75-4379-b227-25a3f7424744', 'test38', '38');
INSERT INTO `t_user` VALUES ('f6a15f87-f9f5-4282-b9ae-0d54ce52f7df', 'test39', '39');

-- ----------------------------
-- Table structure for user_test
-- ----------------------------
DROP TABLE IF EXISTS `user_test`;
CREATE TABLE `user_test` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `age` int(11) DEFAULT NULL COMMENT '用户年龄',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `valid` int(11) DEFAULT '1' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_test
-- ----------------------------
INSERT INTO `user_test` VALUES ('0384aba22e95465880288577914d8304', 'test65', '65', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('0c5e76b8bbfe4fec80fbba358349bcbe', 'test25', '25', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('120994beddf3467d8e50a7064cdec58b', 'test16', '16', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('12d17eefc195422db9efbd65f3c7f277', 'test83', '83', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('1413de2a2ac542b8907511751c9743f0', 'test55', '55', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('156b9f59f77e4a629cfd9daedc45f544', 'test8', '8', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('1be475c8fbd24e67bfae30f15fc6fa78', 'test58', '58', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('1f7b0210526644608c6c21747f6aba2d', 'test98', '98', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('1fb108d38a8e41288ef9ddacb4150db1', 'test72', '72', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('2a16669b7a21444186d7198a57400b33', 'test59', '59', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('2c0996cd5bd94d099ee9b0b3d53f3b80', 'test39', '39', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('3592800630514669b0fe8a8781f74ed4', 'test79', '79', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('381d1116035c4e30a977862640429afa', 'test43', '43', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('3c35aed5d34545ae855132b2ee501e99', 'test68', '68', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('403d7dcdc75c4335922c4fdad7130130', 'test10', '10', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('43ff9c71ac7d4365a31054237a534925', 'test51', '51', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('44fd11f134d14332a2de719b5102b3bb', 'test95', '95', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('459b844d7b5d428ba76c917f2e44b4ce', 'test36', '36', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('499bc6fd02ae428281b53824807b5c21', 'test97', '97', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('4c68febe2c894632be397387c370202a', 'test81', '81', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('4e2646be1d244bc984233acf86c8e2bf', 'test76', '76', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('534ca3635a8147bb834c1c5ca685b52f', 'test69', '69', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('556f0c7306f14def8d6da80906cd6dcf', 'test37', '37', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('58a8dbef8cfc4533bc856c57b0330340', 'test64', '64', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('58dec9cd9904438e8ee80c6f2471e5ca', 'test61', '61', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('59a8657991b348f1b79b10d136fd53c4', 'test18', '18', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('5beb5e1a43924380bf9d0ec944291377', 'test35', '35', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('5e4d073cbccb46a3b8aca5edc8623dcf', 'test40', '40', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('609c2385e8a84b688c3c23b6cbf39cc0', 'test19', '19', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('60f5dfc3590a4b2d8c245569aae9dc2c', 'test27', '27', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('67896f601eeb4751a737cef8c445522f', 'test53', '53', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('6aeca7e8fb2944deb969edb14ce602e3', 'test71', '71', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('6b8de21e40164e39bc91d38ed0180658', 'test41', '41', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('6c1c9f9dfe974c3aa81908f5e75b4140', 'test78', '78', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('6d5fce57b60b46faa6771de30a826ba2', 'test42', '42', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('707f20b9e59a4e0ab9a93b4345a679db', 'test87', '87', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('708f4de88d084563bd2c407edcc83118', 'test7', '7', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('7436679791df431c87d07df6ded8904d', 'test49', '49', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('76428e5ca14f4481b101051dbc0f9238', 'test9', '9', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('766faecddc4f4255a5795d8b4a0b6de7', 'test28', '28', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('76baaf1427974e37af1e0f05b7cf6458', 'test94', '94', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('79d3c4e0df82481cbd0402bbc04122b4', 'test1', '1', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('7b78644c2dd04038b2732832a826282c', 'test5', '5', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('7d209eec5c2945a9bf526246dcff7f25', 'test92', '92', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('7f84f40c27984a619948ed04e5312e38', 'test29', '29', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('7f93b13f88f6472eb4e52d745b6e93ea', 'test2', '2', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('81c2b7d8f3d045e4a015114f167a8467', 'test31', '31', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('82560921cc86481f98040596ddc851ea', 'test99', '99', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('850f6e9bfb57419fb955a2de880fe590', 'test33', '33', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('8a8aa290f8f349a0b5d4c2160a8f7ac6', 'test13', '13', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('8bf087e6a2e2449d9772ec429a4b6d95', 'test12', '12', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('8c92c13ec5d540fcbb11a6050ac1b6de', 'test80', '80', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('8e8d96ce36df46fd85e9bed6de9f58b2', 'test50', '50', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('900d58113457443da95028f78e6d885e', 'test38', '38', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('904666be48bf44e5ab784b3d6c5c8ed0', 'test48', '48', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('93f85df9e1384f42a4becc763de94d72', 'test62', '62', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('95f2adbf8de640d6a94de3cc32d3567b', 'test24', '24', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('963f517792b045e4836a89250b28af72', 'test85', '85', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('9af6bfe4725448d386c0781148b6ae5b', 'test90', '90', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('9e0b1f1fbfc840eb9138f8e99a703d77', 'test70', '70', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('9f1fa33a6eb94a758896ac4cc502bb0a', 'test52', '52', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('a038674179c846a48e0bc94b74981156', 'test3', '3', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('a0d8cc2c82a242799ed40a2dae0b321e', 'test75', '75', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('a77d432ce47d48528eb140a483e3a0c1', 'test6', '6', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('a8014d542097441d925bf147be2b4f62', 'test91', '91', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('b00217eebac54b0e9f0b2c24e97bd300', 'test82', '82', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('b1573e42a6dd472faecf762415e5c189', 'test57', '57', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('b5d1d413bd6e4b1e894fe60392ad38e8', 'test88', '88', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('b69ee3005f1d4c4d9af33b6eb225e235', 'test46', '46', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('b9d8acc1a83846d6a18bda09bf4b4fab', 'test15', '15', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('ba378c3af44648cfadf9b455ed759380', 'test23', '23', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('bbfc67df300c4d168b920a4b0cc75b5f', 'test30', '30', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('bdf9252b7aa545ada3ac164b7f5c52ee', 'test21', '21', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('bebb64e763e64707a9d945230df4c3e6', 'test32', '32', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('c4762863c1864585aeecbffbd5eff06e', 'test34', '34', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('c4f7494cb3b04d759e5f61ddf1c92c79', 'test77', '77', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('c5d29c52fc1e4e6482351bff0493a2ad', 'test86', '86', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('c72f266332fc4a4798f7d4aafcac325e', 'test26', '26', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('c72f797005644df2b0459dc07e84665f', 'test22', '22', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('c86e09f43197448e93c878e8b4802d4a', 'test96', '96', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('cd05289d78844cb1bc0adf296a876b4c', 'test73', '73', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('d8de1232e83d48a3be455de1878c0485', 'test67', '67', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('daef8e5ff110420c9a109237d4a6eae1', 'test20', '20', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('dcec7e22ebe4484f953988fbc6d417e5', 'test60', '60', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('dd6b811a5c0c40afbea3e2f5ae022b2e', 'test0', '0', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('e4cbc915dbd14f8488f93e44be8ff2d2', 'test45', '45', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('e939bff80fca4273812ced3e02d7e2ce', 'test47', '47', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('e98756660d254d10b8e5c898d7b83d6f', 'test63', '63', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('ec7a52b293564a41bcffa42698e6e2aa', 'test66', '66', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('eea744d2ffed4e509d5a1c1c0dc3259c', 'test44', '44', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('f46f20d42e974330bdd4831c1169a7be', 'test93', '93', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('f652494f04a04216b01a8ade065640e7', 'test17', '17', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('f6f3343c164346f6bb228a93d2a95773', 'test56', '56', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('f8aa482cc9f642a2aa6b10153ae0271d', 'test84', '84', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('f939d688167a4a7c9f66b96edb2ae40b', 'test74', '74', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('f98706286bcf45e3a948690368c115e7', 'test14', '14', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('faa430ce3fe947b3b6ba9d6bd19242ee', 'test89', '89', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('fbc702449f644623a199b04c91905d91', 'test4', '4', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('fc5215ced58643cfb46b7b17e17a9b09', 'test11', '11', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
INSERT INTO `user_test` VALUES ('ff9b62d0f42b48e9baccf8801b01461b', 'test54', '54', '2018-01-26 14:23:09', '2018-01-26 14:23:09', '1');
