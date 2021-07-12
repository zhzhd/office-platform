CREATE DATABASE `office_platform` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP TABLE IF EXISTS `resource`;
create table resource
(
    id bigint auto_increment comment '自增主键'
        primary key,
    tab varchar(32) default '' not null comment '资源资源所属栏目',
    tab_des varchar(32) default '' not null comment '资源资源所属栏目描述',
    resource_name varchar(32) default '' not null comment '资源名称',
    permission varchar(32) default '' null comment '权限：(view:查看， add:添加，edit:编辑， update:更新, delete:删除)',
    sort int default '0' null comment '排序',
    icon varchar(50) default '' null comment '图标',
    description varchar(500) default '' null comment '描述',
    url varchar(255) default '' null comment '菜单url',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效'
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '资源表（菜单、按钮等）';


insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('userManage','职员管理','职员列表', 'view' ,0, '', '职员管理页面', '/user/list', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name,  permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('userManage','职员管理','查询详情','view' ,0, '', '查询详情页面', '/user/infoManage', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name,  permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('userManage','职员管理', '查询详情','view' , 0, '', '查询详情页面', '/user/infoAllManage', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('userManage','职员管理','添加职员', 'add' , 0, '', '添加职员页面', '/user/addUser', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('userManage','职员管理','更新信息', 'update' , 0, '', '更新信息页面', '/user/updateUserInfoManage', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('userManage','职员管理','删除职员','delete' , 0, '', '删除职员操作', '/user/delete', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('permManage','权限管理','添加角色','add' , 0, '', '添加角色页面', '/role/addRole', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('permManage','权限管理','更新角色','update' , 0, '', '更新角色页面', '/role/updateRole', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('permManage','权限管理','查看角色列表','view' , 0, '', '查看角色列表页面', '/role/roleList', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name,  permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('permManage','权限管理','查看角色拥有资源','view' , 0, '', '查看角色拥有资源页面', '/role/resourceListByRole', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('permManage','权限管理','查看资源列表','view' , 0, '', '查看资源列表页面', '/role/resourceList', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission,  sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('permManage','权限管理','删除角色','delete' , 0, '', '删除角色页面', '/role/deleteRole', now(),now(), '', 1);
insert into resource (tab, tab_des, resource_name, permission, sort, icon, description, url, create_date, modify_date, remark, yn) VALUES ('permManage','权限管理','检查角色是否存在','view' , 0, '', '检查角色是否存在页面', '/role/checkRoleExist', now(),now(), '', 1);


DROP TABLE IF EXISTS `role`;
create table role
(
    id bigint auto_increment comment '自增主键'
        primary key,
    company_id varchar(32) default '' not null comment '公司ID',
    role_name varchar(128) not null comment '角色名',
    role_code varchar(32) not null comment '编码',
    parent_id bigint default '0' null comment '父级角色ID',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit default b'1' not null comment '是否有效，1：有效，0：无效',
    unique index uniq_company_role_name(company_id, role_code)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '角色表';
DROP TABLE IF EXISTS `role_authority`;
create table role_authority
(
    id bigint auto_increment comment '自增主键'
        primary key,
    role_id bigint not null comment '角色id',
    resource_id bigint not null comment '资源id',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效',
    unique index uniq_role_resource(role_id, resource_id)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '角色权限关系表';
DROP TABLE IF EXISTS `third_login_info`;
create table third_login_info
(
    id bigint auto_increment comment '自增主键'
        primary key,
    user_id varchar(32) not null comment '用户id',
    third_id varchar(128) not null comment '第三方授权id',
    third_source int not null comment '第三方系统来源，1：微信，2：QQ，3：微博',
    third_name varchar(128) not null comment '第三方昵称',
    avatar_url varchar(128) default '' not null comment '第三方头像url',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效',
    unique index uniq_company_id(third_id,third_source)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '第三方用户登录表';
DROP TABLE IF EXISTS `user_info`;
create table user_info
(
    id bigint auto_increment comment '自增主键'
        primary key,
    user_id varchar(32) not null comment '用户ID',
    user_name varchar(128) not null comment '用户名',
    real_name varchar(128) default '' not null comment '姓名',
    password varchar(128) not null comment '密码',
    phone varchar(32) default '' not null comment '手机号',
    salt varchar(128) not null comment '盐值',
    department varchar(255) default '' null comment '部门',
    email varchar(128) default '' not null comment '邮箱',
    is_locked bit default b'0' not null comment '是否被锁定，1：锁定，0：未锁定',
    locked_date datetime null comment '锁定时间',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效',
    unique index uniq_user_id(user_id),
    unique index uniq_user_name(user_name)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '用户信息表';

DROP TABLE IF EXISTS `login_info`;
create table login_info
(
    id bigint auto_increment comment '自增主键'
        primary key,
    user_id varchar(32) not null comment '用户id',
    login_item varchar(50) default '' not null comment '登录项',
    login_type varchar(50) default '' not null comment '登录类型(1:用户名,2:手机号,3:邮箱)',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效',
    unique index uniq_login_item(login_item),
    unique index uniq_user_login_type(user_id, login_type)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '登录信息表';

DROP TABLE IF EXISTS `company`;
create table company
(
    id bigint auto_increment comment '自增主键'
        primary key,
    company_id varchar(32) not null comment '公司id',
    company_name varchar(50) default '' not null comment '公司名称',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效',
    unique index uniq_company_id(company_id),
    unique index uniq_company_name(company_name)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '公司信息表';

DROP TABLE IF EXISTS `operator`;
create table operator
(
    id bigint auto_increment comment '自增主键'
        primary key,
    operator_id varchar(32) not null comment '操作员ID',
    company_id varchar(32) default '' not null comment '公司ID',
    user_id varchar(32) default '' not null comment '用户ID',
    admin bit default b'1' not null comment '是管理员，1：管理员，0：操作员',
    position varchar(128) default '' not null comment '职位',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效',
    unique index uniq_operator_id(operator_id),
    unique index uniq_company_user(company_id, user_id)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '操作员信息表';

DROP TABLE IF EXISTS `user_role`;
create table user_role
(
    id bigint auto_increment comment '自增主键'
        primary key,
    operator_id varchar(32) not null comment '操作员ID',
    role_id bigint not null comment '角色id',
    create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
    modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
    remark varchar(255) default '' not null comment '备注',
    yn bit not null comment '是否有效，1：有效，0：无效',
    unique index uniq_operator_role(operator_id, role_id)
)
    ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci comment '用户角色关系表';

DROP TABLE IF EXISTS `global_id`;
CREATE TABLE `global_id` (
                             id bigint auto_increment comment '自增主键'
                                 primary key,
                             global_key varchar(25) NOT NULL COMMENT '全局id标识',
                             init_value int(11) NOT NULL DEFAULT '1' COMMENT '初始值',
                             step_size int(11) NOT NULL DEFAULT '100' COMMENT '增长步长',
                             now_value int(11) NOT NULL DEFAULT '1' COMMENT '当前值(乐观锁)',
                             create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
                             modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
                             remark varchar(255) DEFAULT NULL COMMENT '备注',
                             yn bit(1) NOT NULL DEFAULT b'1' COMMENT '是否有效，1：有效，0：无效',
                             unique index uniq_global_key (global_key)
) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT='全局id生成表';

#
# DROP TABLE IF EXISTS app_info;
# CREATE TABLE app_info (
#                         id bigint auto_increment comment '自增主键' primary key,
#                         company_id varchar(32) default '' not null comment '公司ID',
#                         app_name varchar(64) default '' NOT NULL COMMENT '站点名称',
#                         app_url varchar(128) default '' NOT NULL COMMENT '站点域名，多个回车换行显示',
#                         app_logo text default '' NOT NULL COMMENT '网站logo',
#                         app_keyword varchar(256) default '' NOT NULL  COMMENT '站点关键字',
#                         app_copyright varchar(256) default '' NOT NULL COMMENT '站点版权信息',
#                         app_style varchar(64) default '' NOT NULL  COMMENT '站点风格',
#                         app_description varchar(512) default '' NOT NULL  COMMENT '描述',
#                         app_status tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0运行中 1已停止  ',
#                         app_dir varchar(10) DEFAULT NULL COMMENT '网站生成的目录',
#                         create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
#                         modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
#                         remark varchar(255) DEFAULT NULL COMMENT '备注',
#                         yn bit(1) NOT NULL DEFAULT b'1' COMMENT '是否有效，1：有效，0：无效'
# ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='应用信息表';



DROP TABLE IF EXISTS office_category;
CREATE TABLE office_category (
                                id bigint auto_increment comment '自增主键' primary key,
                                company_id varchar(32) default '' not null comment '公司ID',
                                category_id bigint DEFAULT 0 NOT NULL COMMENT '所属栏目',
                                leaf bit(1) DEFAULT b'1' NOT NULL COMMENT '是否是叶子节点',
                                top_id bigint DEFAULT 0 NOT NULL COMMENT '顶级id',
                                dict_id int(11) DEFAULT NULL COMMENT '字典对应编号',
                                category_parent_ids varchar(256) DEFAULT '' NOT NULL COMMENT '父类型编号，多个id逗号',
                                category_title varchar(256) DEFAULT '' NOT NULL COMMENT '栏目管理名称',
                                category_img text DEFAULT '' NOT NULL COMMENT '缩略图',
                                category_flag varchar(256) DEFAULT  '' NOT NULL COMMENT '栏目属性',
                                category_description varchar(512) DEFAULT '' NOT NULL COMMENT '栏目管理描述',
                                category_keyword varchar(256) DEFAULT '' NOT NULL COMMENT '栏目管理关键字',
                                category_path varchar(256) DEFAULT '' NOT NULL COMMENT '栏目路径',
                                category_diy_url varchar(256) DEFAULT '' NOT NULL COMMENT '自定义链接',
                                category_url varchar(64) DEFAULT '' NOT NULL COMMENT '内容模板',
                                category_list_url varchar(64) DEFAULT '' NOT NULL COMMENT '列表模板',
                                category_type varchar(32) DEFAULT '' NOT NULL COMMENT '栏目管理属性',
                                category_pinyin varchar(256) DEFAULT '' NOT NULL COMMENT '栏目拼音',
                                category_date datetime DEFAULT NULL COMMENT '类别发布时间',
                                category_sort int DEFAULT 0 NOT NULL COMMENT '自定义顺序',
                                create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
                                modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
                                remark varchar(255) DEFAULT NULL COMMENT '备注',
                                yn bit(1) NOT NULL DEFAULT b'1' COMMENT '是否有效，1：有效，0：无效',
                                index idx_company_id (company_id),
                                index idx_category_id (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业官网分类';

DROP TABLE IF EXISTS office_content;
CREATE TABLE office_content (
                               id bigint auto_increment comment '自增主键' primary key,
                               company_id varchar(32) default '' not null comment '公司ID',
                               category_id bigint DEFAULT 0 NOT NULL COMMENT '所属栏目',
                               content_details varchar(128) default '' NOT NULL COMMENT '文章内容链接',
                               content_title varchar(256) DEFAULT '' NOT NULL COMMENT '文章标题',
                               content_url varchar(256) DEFAULT '' NOT NULL COMMENT '文章跳转链接地址',
                               content_keyword varchar(256) DEFAULT '' NOT NULL COMMENT '关键字',
                               content_description varchar(512) DEFAULT '' NOT NULL COMMENT '描述',
                               content_img text DEFAULT '' NOT NULL COMMENT '文章缩略图',
                               content_source varchar(256) DEFAULT '' NOT NULL COMMENT '文章来源',
                               content_author varchar(256) DEFAULT '' NOT NULL COMMENT '文章作者',
                               content_display bit(1) DEFAULT b'1' NOT NULL COMMENT '是否显示',
                               content_type varchar(128) DEFAULT '' NOT NULL COMMENT '文章类型',
                               content_display_date datetime DEFAULT NULL COMMENT '发布时间',
                               content_sort int DEFAULT 0 NOT NULL COMMENT '自定义顺序',
                               content_hit int DEFAULT 0 NOT NULL COMMENT '点击次数',
                               create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
                               modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
                               remark varchar(255) DEFAULT NULL COMMENT '备注',
                               yn bit(1) NOT NULL DEFAULT b'1' COMMENT '是否有效，1：有效，0：无效',
                               index idx_category_id (category_id),
                               index idx_company_id (company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业官网文章';

DROP TABLE IF EXISTS dict;
CREATE TABLE dict (
                             id bigint NOT NULL AUTO_INCREMENT COMMENT '自增主键' primary key,
                             dict_value varchar(100)  NOT NULL COMMENT '数据值',
                             dict_label varchar(100)  NOT NULL COMMENT '标签名',
                             dict_type varchar(100)  NOT NULL COMMENT '类型',
                             dict_description varchar(100)  NOT NULL DEFAULT '' COMMENT '描述',
                             is_child varchar(255)  NOT NULL DEFAULT '' COMMENT '扩展业务标记',
                             dict_enable varchar(11)  NOT NULL DEFAULT '1' COMMENT '启用状态',
                             dict_remarks varchar(255)  NOT NULL DEFAULT '' COMMENT '备注信息',
                             dict_sort int(10) NOT NULL DEFAULT '0' COMMENT '排序（升序）',
                             create_date timestamp default CURRENT_TIMESTAMP not null comment '创建时间',
                             modify_date timestamp default CURRENT_TIMESTAMP not null comment '更新时间',
                             remark varchar(255) DEFAULT NULL COMMENT '备注',
                             yn bit(1) NOT NULL DEFAULT b'1' COMMENT '是否有效，1：有效，0：无效',
                             KEY idx_dict_value (dict_value),
                             KEY idx_dict_label (dict_label)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('f', '幻灯', '文章属性', '', '', '1', '', 0);
INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('p', '图片', '文章属性', '', '', '1', '', 0);
INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('c', '推荐', '文章属性', '', '', '1', '', 0);
INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('h', '头条', '文章属性', '', '', '1', '', 0);
INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('cms', '文章', '自定义模型类型', '', '0', '1', '', 0);
INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('cms', '文章', '自定义页面类型', '', '', '1', '', 0);
INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('c', '推荐', '栏目属性', '', '', '1', '', 0);
INSERT INTO dict (dict_value, dict_label, dict_type, dict_description, is_child, dict_enable, dict_remarks, dict_sort) VALUES ('nav', '导航', '栏目属性', '', '', '1', '', 0);

