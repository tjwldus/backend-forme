package com.forme.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.forme.connector.JdbcConnect;

public class MemberDAO {
	
	// 로그인 확인하는 메서드 loginCheck 생성
	public MemberDTO loginCheck(MemberDTO mdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO person = new MemberDTO();

		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("select * from member where id=? and pw=?;");
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPw());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				person.setId(rs.getString("id"));
				person.setPw(rs.getString("pw"));
				person.setName(rs.getString("name"));
				person.setPhone(rs.getString("phone"));
				person.setEmail(rs.getString("email"));
				person.setRegdate(rs.getTimestamp("regdate"));
			} else {
				person = null;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt, rs);
		}
		return person;
	}

	// 회원가입하는 메서드 join 생성
	public int join(MemberDTO mdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("insert into member(id, pw, name, phone, email) values(?,?,?,?,?);");

			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPw());
			pstmt.setString(3, mdto.getName());
			pstmt.setString(4, mdto.getPhone());
			pstmt.setString(5, mdto.getEmail());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt);
		}

		return result;
	}

	// 비밀번호 찾기 메서드
	public String findPassword(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pw = null;

		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("select pw from member where id=?;");
			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				pw = rs.getString("pw");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt, rs);
		}

		return pw;
	}

	// 프로필수정 메서드 editProfile 생성(업데이트 성공 시 리턴)
	public MemberDTO editProfile(MemberDTO mdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO person = null;
		int result = 0;

		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("update member set pw=?, name=?, phone=?, email=? where id=?;");
			pstmt.setString(1, mdto.getPw());
			pstmt.setString(2, mdto.getName());
			pstmt.setString(3, mdto.getPhone());
			pstmt.setString(4, mdto.getEmail());
			pstmt.setString(5, mdto.getId());

			result = pstmt.executeUpdate();
			pstmt.close();

			if (result == 0) {
				System.out.println("업데이트 실패");
			}

			pstmt = conn.prepareStatement("select * from member where id=?;");
			pstmt.setString(1, mdto.getId());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				person = new MemberDTO();
				person.setId(rs.getString("id"));
				person.setPw(rs.getString("pw"));
				person.setName(rs.getString("name"));
				person.setPhone(rs.getString("phone"));
				person.setEmail(rs.getString("email"));
				person.setRegdate(rs.getTimestamp("regdate"));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt, rs);
		}

		return person;
	}

	// 회원 목록 메서드
	public ArrayList<MemberDTO> selectAll() {
		ArrayList<MemberDTO> aList = new ArrayList<MemberDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		final String USER_LIST = "select * from member;";

		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement(USER_LIST);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				aList.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt, rs);
		}
		return aList;

	}

	// 회원 삭제 메서드
	public boolean deleteMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		final String USER_DELETE = "delete from member where id=?";

		conn = JdbcConnect.getConnection();
		try {
			pstmt = conn.prepareStatement(USER_DELETE);
			pstmt.setString(1, id);

			int result = pstmt.executeUpdate();

			return result > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt, null);
		}
		return false;

	}
	
	// id로 회원정보 가져오는 메서드 생성
	public MemberDTO getMemberById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO person = new MemberDTO();

		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("select * from member where id=?;");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				person.setId(rs.getString("id"));
				person.setName(rs.getString("name"));
				person.setPhone(rs.getString("phone"));
				person.setEmail(rs.getString("email"));
				person.setRegdate(rs.getTimestamp("regdate"));
			} else {
				person = null;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt, rs);
		}
		return person;
	}
	
	//회원 리스트 아이디 검색
	public ArrayList selectById(String id) {
		ArrayList<MemberDTO> aList = new ArrayList<MemberDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("select * from member where id like ?;");
			pstmt.setString(1, "%"+id+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate"));
				aList.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcConnect.close(conn, pstmt, rs);
		}
		return aList;

	}

}
