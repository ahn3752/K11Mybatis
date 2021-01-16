package mybatis;

import java.util.ArrayList;

public class ParameterDTO {

	private String user_id;//사용자 아이디
	private String board_idx;
	//검색어 처리를 위한 멤버변수
	private String searchField;//검색할 필드명
//	private String searchTxt;//검색어(2차버전)
	private ArrayList<String> searchTxt;//검색어(3차버전)
	//select구간을 위한 멤버변수
	private int start;//select의 시작
	private int end; //끝
	
	

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
//	public String getSearchTxt() {
//	return searchTxt;
//}
//public void setSearchTxt(String searchTxt) {
//	this.searchTxt = searchTxt;
//}
	//3차버전에서 사용함
	public ArrayList<String> getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(ArrayList<String> string) {
		this.searchTxt = string;
	}

	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	
}
