package com.forme.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.forme.connector.JdbcConnect;

public class DiaryDAO {
	//다이어리 개수 세기 메서드
	public int getDiaryCount(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int diaryCount = 0;
		
		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("select count(diary_id) from diary where user_id=?;");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
	
			if(rs.next()) {
				diaryCount = rs.getInt("count(diary_id)");
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JdbcConnect.close(conn, pstmt, rs);
		}
		
	
		
		
		return diaryCount;
	}
	
	//다이어리 날짜 가져오기 메서드
	public Timestamp getLastDate(String id) {
		Timestamp lastDate = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = JdbcConnect.getConnection();
			pstmt = conn.prepareStatement("select MAX(updated_at) from diary where user_id=?;");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				lastDate = rs.getTimestamp("MAX(updated_at)");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			JdbcConnect.close(conn, pstmt, rs);
		}
		
		return lastDate;
	}
	
    // 일기 추가
    public boolean insertDiary(DiaryDTO dto) {
        String sql = "INSERT INTO diary(user_id, title, content) VALUES(?,?,?)";
        try (Connection conn = JdbcConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dto.getUser_id());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());
            //pstmt.setString(4, dto.getEmotion());
            int r = pstmt.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 사용자별 일기 목록 (최신순)
    public List<DiaryDTO> getDiaryListByUser(String userId) {
        List<DiaryDTO> list = new ArrayList<>();
        String sql = "SELECT diary_id, user_id, title, content, created_at, updated_at "
                   + "FROM diary WHERE user_id = ? ORDER BY created_at DESC";
        try (Connection conn = JdbcConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    DiaryDTO dto = new DiaryDTO();
                    dto.setDiary_id(rs.getInt("diary_id"));
                    dto.setUser_id(rs.getString("user_id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    //dto.setEmotion(rs.getString("emotion"));
                    dto.setCreated_at(rs.getTimestamp("created_at"));
                    dto.setUpdated_at(rs.getTimestamp("updated_at"));
                    list.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // id로 단일 일기 조회 (상세 / 수정에 사용)
    public DiaryDTO getDiaryById(int diaryId) {
        String sql = "SELECT diary_id, user_id, title, content, created_at, updated_at "
                   + "FROM diary WHERE diary_id = ?";
        try (Connection conn = JdbcConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, diaryId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    DiaryDTO dto = new DiaryDTO();
                    dto.setDiary_id(rs.getInt("diary_id"));
                    dto.setUser_id(rs.getString("user_id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setContent(rs.getString("content"));
                    //dto.setEmotion(rs.getString("emotion"));
                    dto.setCreated_at(rs.getTimestamp("created_at"));
                    dto.setUpdated_at(rs.getTimestamp("updated_at"));
                    return dto;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // (선택) 일기 수정
    public boolean updateDiary(DiaryDTO dto) {
        String sql = "UPDATE diary SET title=?, content=?, updated_at = CURRENT_TIMESTAMP WHERE diary_id=? AND user_id=?";
        try (Connection conn = JdbcConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setInt(3, dto.getDiary_id());
            pstmt.setString(4, dto.getUser_id());
            //pstmt.setString(5, dto.getEmotion());
            
            int r = pstmt.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 일기 삭제
    public boolean deleteDiary(int diaryId, String userId) {
        String sql = "DELETE FROM diary WHERE diary_id=? AND user_id=?";
        try (Connection conn = JdbcConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, diaryId);
            pstmt.setString(2, userId);
            int r = pstmt.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
