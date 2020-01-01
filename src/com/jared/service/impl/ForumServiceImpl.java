package com.jared.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jared.mapper.ForumMapper;
import com.jared.pojo.Forum;
import com.jared.service.ForumService;
@Service
public class ForumServiceImpl implements ForumService{
	@Autowired
	private ForumMapper forumMapper;

	@Override
	public void insert(Forum forum) {
		forumMapper.insert(forum);
	}

	@Override
	public ArrayList<Forum> findForumByPage() {
		
		return forumMapper.findForumByPage();
	}

	@Override
	public void remove(int f_id) {
		forumMapper.remove(f_id);
	}

	@Override
	public Forum findForumById(int f_id) {
		
		return forumMapper.findForumById(f_id);
	}

	@Override
	public void update(int f_id, String f_title) {
		forumMapper.update(f_id,f_title);
	}

	@Override
	public void addF_comment(int a_id) {
		forumMapper.addF_comment(a_id);
	}

	@Override
	public void delF_comment(int a_id) {
		forumMapper.delF_comment(a_id);
	}
	
	
}
