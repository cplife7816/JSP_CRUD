<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.dao.WordDAO,com.example.upload.ImageUpload"%>
<%@ page import="com.example.bean.WordVO" %>

<%
	request.setCharacterEncoding("utf-8");
	WordDAO wordDAO = new WordDAO();
	ImageUpload upload = new ImageUpload();
	WordVO u = upload.uploadImage(request);

	int i = wordDAO.insertWord(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>