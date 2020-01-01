create database water character set utf8;
use water;

create table user(
    u_id int primary key auto_increment,
    u_username varchar(100),
    u_password varchar(100),
    u_email varchar(50),
    u_birthday varchar(100),
    u_city varchar(30) COMMENT '所在地',
    u_status int COMMENT '用户状态。0：锁定，1：可用',
    u_role int COMMENT '用户角色。0：普通用户，1：管理员',
    u_img varchar(100) COMMENT '用户头像路径'
)default charset = utf8;
insert into user(u_username,u_password,u_email,u_birthday,u_city,u_status,u_role,u_img)
values('admin','ccc123','jared.top@outlook.com','1998-06-29','重庆',1,1,'img/avatar.jpg');
insert into user(u_username,u_password,u_email,u_birthday,u_city,u_status,u_role,u_img)
values('ccc','ccc','ccc.top@outlook.com','1999-01-03','重庆',1,0,'img/avatar.jpg');

create table article(
    a_id int primary key auto_increment,
    a_title varchar(100) COMMENT '文章标题',
    a_username varchar(100) COMMENT '文章作者，唯一，对应user表的u_username',
    a_article text COMMENT '文章内容',
    a_lasttime varchar(50) COMMENT '文章最后修改时间',
    a_status int COMMENT '文章状态：0已删除 1存在'
)default charset = utf8;

create table comment(
    c_id int primary key auto_increment,
    c_username varchar(100) COMMENT '评论人',
    c_comment varchar(100) COMMENT '评论内容',
    c_createtime varchar(50) COMMENT '评论时间',
    c_status int COMMENT '评论状态：0已删除 1存在',
    c_type int COMENT '类型：0文章1话题 默认为0，'
    a_id int COMMENT '文章Id或话题Id'
)default charset = utf8;


create table forum(
    f_id int primary key auto_increment,
    f_title varchar(100) COMMENT '话题标题',
    f_username varchar(100) COMMENT '话题所有者，唯一，对应user表的u_username',
    f_createtime varchar(50) COMMENT '话题创建时间',
    f_comment int COMMENT '话题讨论数量，就是当前话题的所有讨论数',
    f_status int COMMENT '话题状态：0删除，1存在'
)default charset = utf8;

