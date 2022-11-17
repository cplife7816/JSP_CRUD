<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Word here</title>
</head>
<body>

<h1>Add New Word</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Word Level:</td>
            <td><input type="text" name="level"/></td>
        </tr>
        <tr>
            <td>Word:</td>
            <td><input type="text" name="word"/></td>
        </tr>
        <tr>
            <td>Meaning:</td>
            <td><input type="text" name="meaning"></td>
        </tr>
        <tr>
            <td>Image</td>
            <td><input type="file" name="image"></td>
        </tr>
        <tr>
            <td><a href="posts.jsp">View All Records</a></td>
            <td align="right"><input type="submit" value="Add Post"/></td>
        </tr>
    </table>
</form>

</body>
</html>