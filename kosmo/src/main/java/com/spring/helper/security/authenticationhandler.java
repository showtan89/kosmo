package com.spring.helper.security;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.spring.helper.service.BoardService;
import com.spring.helper.service.BoardServiceImpl;
import com.spring.helper.vo.BoardVO.UserVO;

public class authenticationhandler implements AuthenticationSuccessHandler {

	// VO 제대로 담고 세션에 보관하는 코드로 수정 해야함
	
	BoardService service2 = new BoardServiceImpl();

	private RequestCache requestCache = new HttpSessionRequestCache();
    
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("작동");

		if(requestCache.getRequest(request, response)==null) {
			getArticleCnt(request);
			response.sendRedirect("index");
		}
		else {
			SavedRequest savedRequest = requestCache.getRequest(request, response);
			String targetUrl = savedRequest.getRedirectUrl();
			System.out.println(targetUrl);
			getArticleCnt(request);
			response.sendRedirect(targetUrl);
		}
	}

	private static authenticationhandler instance = new authenticationhandler();
	public static authenticationhandler getInstance() {
		return instance;
	}

	// 커넥션 풀 객체를 보관
	DataSource datasource;

	private authenticationhandler() {
		try {
			/*
			 * dbcp(Data base Connection Pool) 설정을 읽어서 커넥션을 발급받겠다.
			 * 1. Context : Server > context.xml 파일의 resource를 분석할 객체
			 */
			Context context = new InitialContext();
			/*
			 * 2. context.xml 검색(lookup)시 resource name으로 찾겠다.(커넥션풀 name : jdbc/Oracle11g)
			 * 3. db서버가 startup시 이미 커넥션이 50개 만들어진 상태
			 * 4. DataSource에 dbcp 설정된 정보를 읽어들여서 담는다.
			 * 5. 아래 각 메소드에서 datasource.getconnection()시 50중 1개 커넥션을 받고
			 * 6. 사용이 끝나면 finally에서 conn.close();해서 반납.
			 */
			datasource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g_helper");
		} catch(Exception e){
			e.printStackTrace();
		}

	}

	// 게시글 갯수 구하기
	public void getArticleCnt(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String email = request.getParameter("loginEmail");
		UserVO userVO = new UserVO();  
		try {
			conn = datasource.getConnection();
			String sql = "SELECT * FROM users WHERE memberEmail = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			System.out.println("로그인시 DB 실행");
			if(rs.next()) {
				userVO.setMemberNumber(rs.getInt("memberNumber"));
				userVO.setMemberEmail(rs.getString("memberEmail"));
				userVO.setMemberId(rs.getString("memberId"));
				userVO.setPassword(rs.getString("password"));
				userVO.setMemberCountry(rs.getString("memberCountry"));
				userVO.setMemberRegdate(rs.getTimestamp("memberRegdate"));
				userVO.setMemberPoint(rs.getInt("memberPoint"));
			}
			request.getSession().setAttribute("userVO", userVO);
			//${userVO.memberNumber}
			System.out.println("세션에 담긴 유져 정보 : "+userVO.toString());
			
				
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
