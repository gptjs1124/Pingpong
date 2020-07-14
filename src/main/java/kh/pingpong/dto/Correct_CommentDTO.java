package kh.pingpong.dto;

import java.sql.Timestamp;

public class Correct_CommentDTO {
	private int seq;
	private String id;
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int like_count;
	private int parent_seq;
	private String thumNail;

	public Correct_CommentDTO() {

		super();
		// TODO Auto-generated constructor stub
	}

	public Correct_CommentDTO(int seq, String id, String writer, String contents, Timestamp write_date,
			int like_count, int parent_seq, String thumNail) {

		this.seq = seq;
		this.id = id;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.like_count = like_count;
		this.parent_seq = parent_seq;
		this.thumNail = thumNail;
	}



	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}


	public int getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}



	public String getThumNail() {
		return thumNail;
	}

	public void setThumNail(String thumNail) {
		this.thumNail = thumNail;
	}
	
	
	
	
	
	
}