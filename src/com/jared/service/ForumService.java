package com.jared.service;

import java.util.ArrayList;

import com.jared.pojo.Forum;

public interface ForumService {

	void insert(Forum forum);

	ArrayList<Forum> findForumByPage();

	void remove(int f_id);

	Forum findForumById(int f_id);

	void update(int f_id, String f_title);

	void addF_comment(int a_id);

	void delF_comment(int a_id);

}
