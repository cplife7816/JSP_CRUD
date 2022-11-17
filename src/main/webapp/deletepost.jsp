<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.WordDAO, com.example.bean.WordVO, com.example.upload.ImageUpload"%>
<%
	String wordNum = request.getParameter("id");
	if (wordNum != ""){
		int id = Integer.parseInt(wordNum);
		WordVO u = new WordVO();
		WordDAO wordDAO = new WordDAO();
		String imageName = wordDAO.getImageName(id);
		if (imageName != null) ImageUpload.deleteImage(request,imageName);
		u.setWordNum(id);
		wordDAO.deleteWord(u);
	}
	response.sendRedirect("posts.jsp");
%>