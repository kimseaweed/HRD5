package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
Connection conn;
PreparedStatement pstmt;
ResultSet rs;

public static Connection getConnection() throws Exception {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection(
			"jdbc:oracle:thin:@//localhost:1521/xe","C##system","1234");
	return conn;
}
public static void getClose(Connection conn,PreparedStatement pstmt, ResultSet rs) {
		try {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null) rs.close();
		} catch (SQLException e) {
			System.out.println("getClose : 닫는중 오류발생");
			e.printStackTrace();
		}
}
public List<StudentDTO> getStudent(){
	List<StudentDTO> list = new ArrayList<>();
	try {
		conn=DAO.getConnection();
		rs = conn.prepareStatement("select sno, sname, substr(sno,1,1)as year, substr(sno,2,2)as grade,substr(sno,4,2)as no, decode(sgender,'M','남','F','여')as sgender,sphone,saddress from student_tbl_03").executeQuery();
		if(rs.next()) {
			do {
				StudentDTO dto = new StudentDTO();
				dto.setSno(rs.getString("sno"));
				dto.setSname(rs.getString("sname"));
				dto.setYear(rs.getString("year"));
				dto.setGrade(rs.getString("grade"));
				dto.setNo(rs.getString("no"));
				dto.setSgender(rs.getString("sgender"));
				dto.setSphone(rs.getString("sphone"));
				dto.setSaddress(rs.getString("saddress"));
				list.add(dto);
			}while(rs.next());
		}else {
			System.out.println("getStudent : 결과없음");	
		}
	} catch (Exception e) {
		System.out.println("getStudent : 오류발생");
		e.printStackTrace();
	}finally {
		DAO.getClose(conn, pstmt, rs);
	}	
	return list;
}

public List<RankDTO> getRank(){
	List<RankDTO> list = new ArrayList<>();
	try {
		conn=DAO.getConnection();
		rs = conn.prepareStatement("select substr(s.sno,1,1)as year, substr(s.sno,2,2)as grade,substr(s.sno,4,2)as no, s.sname, nvl(TO_CHaR(e.ekor),' ') as ekor,nvl(TO_CHaR(e.emath),' ') as emath ,nvl(TO_CHaR(e.eeng),' ') as eeng ,nvl(TO_CHaR(e.ehist),' ') as ehist,nvl(to_char( e.ekor+e.emath+e.eeng+e.ehist),' ') as esum, nvl(to_char( (e.ekor+e.emath+e.eeng+e.ehist)/4), ' ' ) as eavg, decode(e.ekor+e.emath+e.eeng+e.ehist,null,' ', rank()over(order by (e.ekor+e.emath+e.eeng+e.ehist) desc nulls last) )as rank  from student_tbl_03 s  LEFT OUTER join exam_tbl_03 e on s.sno = e.sno order by (e.ekor+e.emath+e.eeng+e.ehist) desc nulls last").executeQuery();
		if(rs.next()) {
			do {
				RankDTO dto = new RankDTO();
				dto.setYear(rs.getString("year"));
				dto.setGrade(rs.getString("grade"));
				dto.setNo(rs.getString("no"));
				dto.setSname(rs.getString("sname"));
				dto.setEkor(rs.getString("ekor"));
				dto.setEmath(rs.getString("emath"));
				dto.setEeng(rs.getString("eeng"));
				dto.setEhist(rs.getString("ehist"));
				dto.setEsum(rs.getString("esum"));
				dto.setEavg(rs.getString("eavg"));
				dto.setRank(rs.getString("rank"));
				list.add(dto);
			}while(rs.next());
		}else {
			System.out.println("getRank : 결과없음");
		}
	} catch (Exception e) {
		System.out.println("getRank : 오류발생");
		e.printStackTrace();
	}finally {
		DAO.getClose(conn, pstmt, rs);
	}	
	return list;
}

public List<String> getAvg(){
	List<String> list = new ArrayList<>();
	try {
		conn=DAO.getConnection();
		rs = conn.prepareStatement("select sum(a.ekor),avg(a.ekor),sum(a.emath),avg(a.emath),sum(a.eeng),avg(a.eeng),sum(a.ehist),avg(a.ehist), sum(a.esum),avg(a.esum),sum(a.eavg),avg(a.eavg) from(select substr(s.sno,1,1)as year, substr(s.sno,2,2)as grade,substr(s.sno,4,2)as no, s.sname, e.ekor,e.emath,e.eeng,e.ehist, e.ekor+e.emath+e.eeng+e.ehist as esum,(e.ekor+e.emath+e.eeng+e.ehist)/4 as eavg  from student_tbl_03 s  LEFT OUTER join exam_tbl_03 e on s.sno = e.sno)a").executeQuery();
		if(rs.next()) {
				list.add( rs.getString(1));
				list.add( rs.getString(2));
				list.add( rs.getString(3));
				list.add( rs.getString(4));
				list.add( rs.getString(5));
				list.add( rs.getString(6));
				list.add( rs.getString(7));
				list.add( rs.getString(8));
				list.add( rs.getString(9));
				list.add( rs.getString(10));
				list.add( rs.getString(11));
				list.add( rs.getString(12));
		}else{
			System.out.println("getAvg : 결과없음");
		}
	} catch (Exception e) {
		System.out.println("getAvg : 오류발생");
		e.printStackTrace();
	}finally {
		DAO.getClose(conn, pstmt, rs);
	}	
	return list;
}

public int setStudent(String sno, String ekor,String emath,String eeng,String ehist){
	try {
		conn=DAO.getConnection();
		pstmt = conn.prepareStatement("insert into exam_tbl_03 values(?,?,?,?,?)");
		pstmt.setString(1, sno);
		pstmt.setString(2, ekor);
		pstmt.setString(3, emath);
		pstmt.setString(4, eeng);
		pstmt.setString(5, ehist);
		int result = pstmt.executeUpdate();
		if(result!=1) {
			System.out.println("getAvg : 등록 제대로 안됨");
		}else {
			return result;
		}
	} catch (Exception e) {
		System.out.println("getAvg : 오류발생");
		e.printStackTrace();
	}finally {
		DAO.getClose(conn, pstmt, rs);
	}	
	return -1;
}

}
