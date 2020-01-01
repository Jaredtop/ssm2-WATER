package com.jared.mapper;

import java.util.ArrayList;
import java.util.List;

import com.jared.pojo.Article;
import com.jared.pojo.Comment;

public interface CommentMapper {

	void insert(Comment comment);

	List<Comment> findCommentById(int c_type,int a_id);

	ArrayList<Comment> findCommentByPage();

	void remove(int c_id);
	

	void setCommentStatus(int c_id, int c_status);

	void removeArticle(int a_id);

	Comment getComentById(int c_id);

}
