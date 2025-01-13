package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.controller.Action;
import com.book.controller.ActionForward;
import com.book.model.BookDAO;
import com.book.model.BookDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertBookOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 측 페이지에서 책을 추가하는 로직
		// 이미지를 넣어야 하므로 MultipartRequest 객체 사용
		
		String saveFolder = "C:\\Users\\admin\\Desktop\\NCS\\NCS\\workspace(jsp)\\BookProject\\src\\main\\webapp\\img";
		int fileSize = 10 * 1024 * 1024;//10MB
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
		
		int book_id = Integer.valueOf(multi.getParameter("num"));
		String title = multi.getParameter("title");
		String author = multi.getParameter("author");
		int genre = Integer.valueOf(multi.getParameter("genre"));
		int price = Integer.valueOf(multi.getParameter("price"));
		String description = multi.getParameter("description");
		String publisher = multi.getParameter("publisher");
		String publish_date = multi.getParameter("publish_date");
		int quantity = Integer.valueOf(multi.getParameter("quantity"));
		
		System.out.println(title+"/"+author+"/"+genre+"/"+price+"/"+description+"/"+publisher+"/"+publish_date+"/"+quantity);
		//이미지 파일
		File image_file = multi.getFile("image_url");
		
		BookDTO dto = new BookDTO();
		
		if(image_file!=null) {//이미지 파일이 있으면
			String fileName = image_file.getName();
			
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH)+1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			String homedir = saveFolder+"/"+year+"-"+month+"-"+day;
			
			//saveFolder/날짜 에 해당하는 파일 객체 생성
			File path1 = new File(homedir);
			
			if(!path1.exists()) {
				path1.mkdir();//폴더가 존재하지 않으면 폴더 생성
			}
		
			//파일 명 : 책 제목_파일명
			String reFileName = title + "_" + fileName;

			//파일을 새로운 경로로 이동시키는 동시게 파일 이름을 변경(renameTo("파일이름")))
			image_file.renameTo(new File(homedir+"/"+reFileName));
			
			//DB에 들어갈 파일 이름/[/2024-12-27/책이름-파일이름]
			String fileDBName = "/" +year+ "-" +month + "-" + day + "/" + reFileName;
			
			dto.setImage_url(fileDBName);
		}
		dto.setBook_id(book_id);
		dto.setTitle(title);
		dto.setAuthor(author);
		dto.setGenre_id(genre);
		dto.setPrice(price);
		dto.setDescription(description);
		dto.setPublisher(publisher);
		dto.setPublish_date(publish_date);
		dto.setQuantity(quantity);
		
		BookDAO dao = BookDAO.getInstance();
		int chk = dao.insertBook(dto);
		
		PrintWriter out = response.getWriter();
		
		if(chk>0) {
			out.println("<script>");
			out.println("alert('책이 등록되었습니다.')");
			out.println("location.href='book_insert.go'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('책 등록에 실패하였습니다. 다시 시도해주세요.')");
			out.println("location.href='book_insert.go'");
			out.println("</script>");
		}
		
		return null;
	}

}
