package com.example.dao;

import com.example.bean.WordVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WordDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String WORD_INSERT = "insert into word (level, word, meaning, image) values (?,?,?,?)";
	private final String WORD_UPDATE = "update word set level=?, word=?, meaning=?, image=? where wordNum=?";
	private final String WORD_DELETE = "delete from word  where wordNum=?";
	private final String WORD_GET = "select * from word  where wordNum=?";
	private final String WORD_LIST = "select * from word order by wordNum desc";

	public int insertWord(WordVO vo) {
		System.out.println("===> JDBC로 insertWord() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_INSERT);
			stmt.setInt(1, vo.getLevel());
			stmt.setString(2, vo.getWord());
			stmt.setString(3, vo.getMeaning());
			stmt.setString(4, vo.getImage());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteWord(WordVO vo) {
		System.out.println("===> JDBC로 deleteWord() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_DELETE);
			stmt.setInt(1, vo.getWordNum());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int updateWord(WordVO vo) {
		System.out.println("===> JDBC로 updateWord() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_UPDATE);
			stmt.setInt(1, vo.getLevel());
			stmt.setString(2,vo.getWord());
			stmt.setString(3, vo.getMeaning());
			stmt.setString(4, vo.getImage());
			stmt.setInt(5, vo.getWordNum());

			
			System.out.println(vo.getLevel() +  "-" + vo.getWord() + "-" + vo.getMeaning() + "-" + vo.getImage() + "-" + vo.getWordNum());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public WordVO getWord(int wordNum) {
		WordVO one = new WordVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_GET);
			stmt.setInt(1, wordNum);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setWordNum(rs.getInt("wordNum"));
				one.setLevel(rs.getInt("level"));
				one.setWord(rs.getString("word"));
				one.setMeaning(rs.getString("meaning"));
				one.setImage(rs.getString("image"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<WordVO> getWordList(){
		List<WordVO> list = new ArrayList<WordVO>();
		System.out.println("===> JDBC로 getWordList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				WordVO one = new WordVO();
				one.setWordNum(rs.getInt("wordNum"));
				one.setLevel(rs.getInt("level"));
				one.setWord(rs.getString("word"));
				one.setMeaning(rs.getString("meaning"));
				one.setDate(rs.getDate("date"));
				one.setImage(rs.getString("image"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	public String getImageName(int wordNum){
		String imageName = null;
		System.out.println("===> JDBC로 getImageName() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(WORD_GET);
			stmt.setInt(1, wordNum);
			rs = stmt.executeQuery();
			if(rs.next()) imageName = rs.getString("image");
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imageName;
	}
}
