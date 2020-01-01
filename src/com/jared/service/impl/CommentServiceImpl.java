package com.jared.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jared.mapper.CommentMapper;
import com.jared.pojo.Article;
import com.jared.pojo.Comment;
import com.jared.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public void insert(Comment comment) {
		commentMapper.insert(comment);
	}

	@Override
	public List<Comment> findCommentById(int c_type,int a_id) {
		
		return commentMapper.findCommentById(c_type,a_id);
	}

	@Override
	public ArrayList<Comment> findCommentByPage() {
		
		return commentMapper.findCommentByPage();
	}

	@Override
	public void remove(int c_id) {
		commentMapper.remove(c_id);
	}

	@Override
	public void setCommentStatus(int c_id, int c_status) {
		commentMapper.setCommentStatus(c_id,c_status);
	}

	@Override
	public void removeArticle(int a_id) {
		commentMapper.removeArticle(a_id);
	}

	@Override
	public Comment getComentById(int c_id) {
		
		return commentMapper.getComentById(c_id);
	}
	
}
