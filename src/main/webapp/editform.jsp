<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.example.dao.WordDAO, com.example.bean.WordVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>
<body>

<%
    WordDAO wordDAO = new WordDAO();
    String id = request.getParameter("id");
    WordVO u = wordDAO.getWord(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="wordNum" value="<%=u.getWordNum() %>"/>
    <table>
        <tr>
            <td>Word Level:</td>
            <td><input type="text" name="level" value="<%= u.getLevel()%>"/></td>
        </tr>
        <tr>
            <td>Word:</td>
            <td><input type="text" name="word" value="<%= u.getWord()%>"/></td>
        </tr>
        <tr>
            <td>Meaning:</td>
            <td><input types="text" name="meaning" value="<%= u.getMeaning()%>"/></td>
        </tr>
        <tr>
            <td>Image:</td>
            <td><input type="file" name="image" value="<%= u.getImage()%>"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Edit Post"/>
                <input type="button" value="Cancel" onclick="history.back()"/></td>
        </tr>
    </table>
</form>

</body>
</html>