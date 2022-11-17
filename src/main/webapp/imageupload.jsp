<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, com.oreilly.servlet.MultipartRequest" %>
<html>
<head>
    <title>업로드 확인</title>
</head>
<body>
<%
    String imageName = "";
    int size = 15 * 1024 * 1024;

    String realPath = request.getServletContext().getRealPath("upload");

    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();
    MultipartRequest multipartRequest = new MultipartRequest(request,realPath,size,"utf-8",new DefaultFileRenamePolicy());

    imageName = multipartRequest.getFilesystemName("photo");
%>
</body>
</html>
