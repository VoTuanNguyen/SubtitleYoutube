package getsubyoutube.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import getsubyoutube.beans.Lesson;
import getsubyoutube.beans.Subnote;
import getsubyoutube.beans.UserAccount;

public class DBUtils {
	public static UserAccount findUser(Connection conn, String Email)
			throws SQLException {

		String sql = "Select a.EMAIL from user a"//
				+ " where a.EMAIL = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, Email);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			UserAccount user = new UserAccount(Email);
			return user;
		}
		return null;
	}

	public static void insertUser(Connection conn, UserAccount user)
			throws SQLException {
		String sql = "Insert into user(email) values (?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, user.getEmail());

		pstm.executeUpdate();
	}

	public static ArrayList<Lesson> getLesson(Connection conn, String Email)
			throws SQLException {
		ArrayList<Lesson> lst = new ArrayList<Lesson>();
		String sql = "Select * from lesson"//
				+ " where emailuser = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, Email);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			String idvideo = rs.getString("idvideo");
			String linkimg = rs.getString("linkimg");
			String title = rs.getString("title");
			String email = rs.getString("emailuser");

			Lesson lesson = new Lesson(idvideo, linkimg, title, email);
			lst.add(lesson);
		}
		return lst;
	}

	public static Boolean insertNote(Connection conn, String email,
			String idvideo, String content, String pos) throws SQLException {
		String sql = "INSERT INTO subnote (position, content, idvideo, emailuser)"//
				+ " VALUES (?, ?, ?, ?); ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, pos);
		pstm.setString(2, content);
		pstm.setString(3, idvideo);
		pstm.setString(4, email);

		return pstm.executeUpdate() > 0;
	}

	public static Boolean updateNote(Connection conn, String email,
			String idvideo, String content, String pos) throws SQLException {
		String sql = "UPDATE subnote" + " SET content = ?"
				+ " WHERE idvideo = ? AND emailuser = ? AND position = ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, content);
		pstm.setString(2, idvideo);
		pstm.setString(3, email);
		pstm.setString(4, pos);

		return pstm.executeUpdate() > 0;
	}

	public static Boolean checkExistNote(Connection conn, String email,
			String idvideo, String pos) throws SQLException {
		String sql = "Select * from subnote"//
				+ " where position = ? AND idvideo = ? AND emailuser = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, pos);
		pstm.setString(2, idvideo);
		pstm.setString(3, email);

		ResultSet rs = pstm.executeQuery();
		if (rs.next())
			return true;
		return false;

	}

	public static ArrayList<Subnote> getNote(Connection conn, String email,
			String idvideo) throws SQLException {
		ArrayList<Subnote> lst = new ArrayList<Subnote>();
		String sql = "Select * from subnote"//
				+ " where emailuser = ? AND idvideo = ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, email);
		pstm.setString(2, idvideo);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			Subnote note = new Subnote();
			String pos = rs.getString("position");
			note.setPos(pos);
			String content = rs.getString("content");
			note.setContent(content);

			lst.add(note);
		}
		return lst;
	}

	public static Boolean checkExistLesson(Connection conn, String email,
			String idvideo) throws SQLException {
		String sql = "Select * from lesson"//
				+ " where idvideo = ? AND emailuser = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, idvideo);
		pstm.setString(2, email);

		ResultSet rs = pstm.executeQuery();
		if (rs.next())
			return true;
		return false;
	}
	public static Boolean insertLesson(Connection conn, Lesson lesson)
			throws SQLException {
		String sql = "Insert into lesson(idvideo, emailuser, title, linkimg) values (?, ?, ?, ?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, lesson.getIdvideo());
		pstm.setString(2, lesson.getEmail());
		pstm.setString(3, lesson.getTitle());
		pstm.setString(4, lesson.getLinkimg());

		return pstm.executeUpdate() > 0;
	}
	public static Boolean deleteLesson(Connection conn, String email, String idvideo)
			throws SQLException {
		String sql = "Delete from lesson where emailuser = ? AND idvideo = ?";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, email);
		pstm.setString(2, idvideo);

		return pstm.executeUpdate() > 0;
	}

}
