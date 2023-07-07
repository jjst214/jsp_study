package fileupload;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class MyFileDAO extends JDBCConnect {
	//게시물 입력 (insert)
	public int insertFile(MyFileDTO dto) {
		int result = 0;
		String sql = "insert into myfile(idx, name, title, cate, ofile, sfile)"
				+ " values(seq_myfile_num.nextval, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시글 목록 가져오기
	public List<MyFileDTO> myfilelist(){
		List<MyFileDTO> filelist = new ArrayList<>();
		String query = "select * from myfile";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				filelist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return filelist;
	}
	
	//게시글 상세보기
	public MyFileDTO detailview(String idx) {
		MyFileDTO dto = new MyFileDTO();
		String sql = "select * from myfile where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//게시글 삭제
	public int deletePost(String idx) {
		int result = 0;
		String sql = "delete from myfile where idx = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글 수정
	public int updatePost(MyFileDTO dto) {
		int result = 0;
		String sql = "update myfile set title=?, cate=?, ofile=?, sfile=? where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCate());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getIdx());
			System.out.println(dto.getTitle());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
