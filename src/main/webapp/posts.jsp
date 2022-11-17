<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.dao.WordDAO, com.example.bean.WordVO,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <!-- Bootstrap core CSS -->
    <link href="my.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">


    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>free board</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        #list tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #list tr:hover {
            background-color: #ddd;
        }

        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }

        #list td.image {
            padding: 0px;
            width: 100px;
            height: 100px;
            margin: 0px;
        }

        img {
            display: block;
            padding: 0px;
            width: 100px;
            height: 100px;
            margin: -19px 0px 0px 0px;
        }
    </style>
    <script>
        function delete_ok(id) {
            var a = confirm("정말로 삭제하겠습니까?");
            if (a) location.href = 'deletepost.jsp?id=' + id;
        }
    </script>
</head>
<body>

<div>
    <div class="container">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4">
            <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"/>
                </svg>
                <span class="fs-4">단어장</span>
            </a>

            <ul class="nav nav-pills">
                <li class="nav-item"><a href="addpostform.jsp" class="nav-link active" aria-current="page">Add New Word</a></li>
            </ul>
        </header>
    </div>
</div>
    <%
        WordDAO wordDAO = new WordDAO();
        List<WordVO> list = wordDAO.getWordList();
        request.setAttribute("list", list);
    %>

<div>
<table id="list" width="90%">
    <tr>
        <th>Word Num</th>
        <th>Image</th>
        <th>Level</th>
        <th>Word</th>
        <th>Meaning</th>
        <th>Date</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.getWordNum()}</td>
            <td class="image"><c:if test="${u.getImage() ne ' '}"><br/> <img
                    src="${pageContext.request.contextPath}/upload/${u.getImage()}" class="image"></c:if></td>
            <td>${u.getLevel()}</td>
            <td>${u.getWord()}</td>
            <td>${u.getMeaning()}</td>
            <td>${u.getDate()}</td>
            <td><a href="editform.jsp?id=${u.getWordNum()}"><i class="bi bi-pencil-square"></i></a></td>
            <td><a href="javascript:delete_ok('${u.getWordNum()}')"><i class="bi bi-trash"></i></a></td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>