package com.example.upload;

import com.example.bean.WordVO;
import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;

import com.example.dao.WordDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImageUpload {

    public WordVO uploadImage(HttpServletRequest request){
        String imageName = "";
        int size = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        WordVO one = null;
        MultipartRequest multipartRequest = null;

        try {
            multipartRequest = new MultipartRequest(request, realPath, size, "utf-8", new DefaultFileRenamePolicy());

            imageName = multipartRequest.getFilesystemName("image");
            one = new WordVO();
            String wordNum = multipartRequest.getParameter("wordNum");
            if (wordNum != null && !wordNum.equals("")) one.setWordNum(Integer.parseInt(wordNum));
            String level = multipartRequest.getParameter("level");
            if (level != null && !level.equals("")) one.setLevel(Integer.parseInt(level));
            one.setWord(multipartRequest.getParameter("word"));
            one.setMeaning(multipartRequest.getParameter("meaning"));

            if (wordNum != null && !wordNum.equals("")){
                WordDAO dao = new WordDAO();
                String oldImage = dao.getImageName(Integer.parseInt(wordNum));
                if(imageName != null && oldImage != null) ImageUpload.deleteImage(request,oldImage);
                else if (imageName == null && oldImage != null) imageName = oldImage;
            }
            one.setImage(imageName);
        } catch (IOException e){
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteImage(HttpServletRequest request, String imageName){
        String imagePath = request.getServletContext().getRealPath("upload");

        File i = new File(imagePath + "/" + imageName);
        if( i.exists()) i.delete();
    }
}
