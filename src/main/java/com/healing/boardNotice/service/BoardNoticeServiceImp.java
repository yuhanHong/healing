package com.healing.boardNotice.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.healing.aop.HomeAspect;
import com.healing.boardNotice.dao.BoardNoticeDao;
import com.healing.boardNotice.dto.BoardNoticeDto;

@Component
public class BoardNoticeServiceImp implements BoardNoticeService {
	@Autowired
	private BoardNoticeDao boardNoticeDao;

	@Override
	public void boardNoticeWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int notice_number = 0;
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);
		
//		HomeAspect.logger.info(HomeAspect.logMsg+notice_number);
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("notice_number", notice_number);
		mav.setViewName("/boardNotice/write");
	}

	@Override
	public void boardNoticeWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		BoardNoticeDto boardNoticeDto =(BoardNoticeDto)map.get("boardNoticeDto");
		
		boardNoticeDto.setNotice_readCount(0);
		boardNoticeDto.setNotice_date(new Date());
		boardNoticeDto.setNotice_content(boardNoticeDto.getNotice_content().replace("\r\n", "<br/>"));
		
		MultipartFile upFile = request.getFile("file");
		String fileName=Long.toString(System.currentTimeMillis())+"_"+upFile.getOriginalFilename();
		long fileSize = upFile.getSize();
//		HomeAspect.logger.info(HomeAspect.logMsg+fileName+","+fileSize);
		
		if(fileSize != 0){
			File path1= new File("C:\\healing\\workspace\\healing\\src\\main\\webapp\\resources\\noticePhoto");
			File path2= new File("C:\\healing\\apache-tomcat-7.0.64-windows-x64\\apache-tomcat-7.0.64\\wtpwebapps\\healing\\resources\\noticePhoto");
			path1.mkdir();
			path2.mkdir();
			
			File file1 = new File(path1, fileName);
	        File file2 = new File(path2, fileName);
	             
            FileInputStream inputStream=null;
            FileOutputStream outputStream=null;
            BufferedInputStream bin=null;
            BufferedOutputStream bout=null;
			
            try {
                upFile.transferTo(file1);
                boardNoticeDto.setNotice_file_name(fileName);
                boardNoticeDto.setNotice_file_path(file1.getAbsolutePath());
                boardNoticeDto.setNotice_file_size(fileSize);
             
                inputStream = new FileInputStream(file1);
                outputStream = new FileOutputStream(file2.getAbsolutePath());
                 
                bin = new BufferedInputStream(inputStream);
                bout = new BufferedOutputStream(outputStream);
                 
                int bytesRead = 0;
                byte[] buffer = new byte[1024];
                
                while ((bytesRead = bin.read(buffer, 0, 1024)) != -1) {
                    bout.write(buffer, 0, bytesRead);
                }
             } catch (Exception e) {
                e.printStackTrace();
             } finally {
                try {
                   bout.close();
                   bin.close();
                   outputStream.close();
                   inputStream.close();
                } catch (IOException e) {}
             }
		}
		
		int check = boardNoticeDao.boardNoticeWriteInsert(boardNoticeDto);
//		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.setViewName("/boardNotice/writeOk");
	}

	@Override
	public void boardNoticeList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber="1";
		int currentPage=Integer.parseInt(pageNumber);
		
		String searchSort = request.getParameter("searchSort");
		String searchWord = request.getParameter("searchWord");
//		HomeAspect.logger.info(HomeAspect.logMsg+searchSort+","+searchWord);
		
		int boardSize=8;
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=0;
		
		List<BoardNoticeDto> boardNoticeList = null;
		
		if(searchSort == null || searchSort.equals("")){
			count = boardNoticeDao.boardNoticeGetCount();		
//			HomeAspect.logger.info(HomeAspect.logMsg+count);
			
			if(count > 0){
				boardNoticeList = boardNoticeDao.boardNoticeGetList(startRow, endRow);
//				HomeAspect.logger.info(HomeAspect.logMsg+boardNoticeList.size());
			}
		}else{
			if(searchSort.equals("titleSort")){					// 제목 검색
				count = boardNoticeDao.boardNoticeGetCountTitle(searchWord);
//				HomeAspect.logger.info(HomeAspect.logMsg+count);
				
				if(count > 0){
					boardNoticeList = boardNoticeDao.boardNoticeGetListTitle(startRow, endRow, searchWord);
//					HomeAspect.logger.info(HomeAspect.logMsg+boardNoticeList.size());
				}
			}else if(searchSort.equals("contentSort")){
				count = boardNoticeDao.boardNoticeGetCountContent(searchWord);
//				HomeAspect.logger.info(HomeAspect.logMsg+count);
				
				if(count > 0){
					boardNoticeList = boardNoticeDao.boardNoticeGetListContent(startRow, endRow, searchWord);
//					HomeAspect.logger.info(HomeAspect.logMsg+boardNoticeList.size());
				}
			}
		}

		mav.addObject("searchSort", searchSort);
		mav.addObject("searchWord", searchWord);
		mav.addObject("boardNoticeList", boardNoticeList);
		mav.addObject("count",count);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize",boardSize);
		
		mav.setViewName("/boardNotice/list");
	}

	@Override
	public void boardNoticeRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int notice_number=Integer.parseInt(request.getParameter("notice_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
//		HomeAspect.logger.info(HomeAspect.logMsg+notice_number+","+pageNumber);
		
		String searchSort = request.getParameter("searchSort");
		String searchWord = request.getParameter("searchWord");
//		HomeAspect.logger.info(HomeAspect.logMsg+searchSort+","+searchWord);
		
		List<BoardNoticeDto> boardNoticeList = null;
		
		boardNoticeList = boardNoticeDao.boardNoticeReadSelect(notice_number, searchWord, searchSort);
//		HomeAspect.logger.info(HomeAspect.logMsg+boardNoticeList.size());
		
		BoardNoticeDto boardNoticeDto = boardNoticeList.get(0);
		if(boardNoticeDto.getNotice_file_name() != null){
			int index = boardNoticeDto.getNotice_file_name().indexOf("_")+1;
			boardNoticeDto.setNotice_file_name(boardNoticeDto.getNotice_file_name().substring(index));
		}
		
		BoardNoticeDto boardNoticeDtoPrev = null;
		BoardNoticeDto boardNoticeDtoNext = null;
		
		if(boardNoticeList.size() == 2){
			BoardNoticeDto tempDto = boardNoticeList.get(1);
			if(tempDto.getNotice_number() < notice_number){			// 다음글인 경우
				boardNoticeDtoNext = tempDto;
			}else if(tempDto.getNotice_number() > notice_number){	// 이전글인 경우
				boardNoticeDtoPrev = tempDto;					
			}
		}else if(boardNoticeList.size() == 3){
			boardNoticeDtoNext = boardNoticeList.get(1);
			boardNoticeDtoPrev = boardNoticeList.get(2);
		}
		
		mav.addObject("searchSort",searchSort);
		mav.addObject("searchWord",searchWord);
		mav.addObject("boardNoticeDto",boardNoticeDto);
		mav.addObject("boardNoticeDtoPrev",boardNoticeDtoPrev);
		mav.addObject("boardNoticeDtoNext",boardNoticeDtoNext);
		mav.addObject("pageNumber",pageNumber);
		mav.setViewName("/boardNotice/read");
	}

	@Override
	public void boardNoticeDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int notice_number=Integer.parseInt(request.getParameter("notice_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
//		HomeAspect.logger.info(HomeAspect.logMsg+notice_number+","+pageNumber);
		
		int check = boardNoticeDao.boardNoticeDelete(notice_number);
//		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("notice_number",notice_number);
		mav.setViewName("/boardNotice/delete");
	}

	@Override
	public void boardNoticeUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int notice_number=Integer.parseInt(request.getParameter("notice_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
//		HomeAspect.logger.info(HomeAspect.logMsg+notice_number+","+pageNumber);
		
		BoardNoticeDto boardNoticeDto = boardNoticeDao.boardNoticeSelect(notice_number);
//		HomeAspect.logger.info(HomeAspect.logMsg+boardNoticeDto);
		
		if(boardNoticeDto.getNotice_file_name() != null){
			int index=boardNoticeDto.getNotice_file_name().indexOf("_")+1;
			boardNoticeDto.setNotice_file_name(boardNoticeDto.getNotice_file_name().substring(index));
		}
		
		boardNoticeDto.setNotice_content(boardNoticeDto.getNotice_content().replace("<br/>", "\r\n"));
		
		mav.addObject("boardNoticeDto",boardNoticeDto);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName("/boardNotice/update");
	}

	@Override
	public void boardNoticeUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		BoardNoticeDto boardNoticeDto =(BoardNoticeDto)map.get("boardNoticeDto");
		
		MultipartFile upFile = request.getFile("file");
		String fileName = Long.toString(System.currentTimeMillis())+"_"+upFile.getOriginalFilename();
		long fileSize = upFile.getSize();
//		HomeAspect.logger.info(HomeAspect.logMsg+fileName+","+fileSize);
		
		if(fileSize != 0){
			File path= new File("C:\\healing\\workspace\\healing\\src\\main\\webapp\\resources\\noticePhoto");
			path.mkdirs();

			if(path.exists() && path.isDirectory()){
				File file = new File(path, fileName);
				try{
					upFile.transferTo(file);
					boardNoticeDto.setNotice_file_name(fileName);
					boardNoticeDto.setNotice_file_size(fileSize);
					boardNoticeDto.setNotice_file_path(file.getAbsolutePath());
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		BoardNoticeDto boardNoticeDtoPre = boardNoticeDao.boardNoticeSelect(Integer.parseInt(request.getParameter("notice_number")));
		
		if(boardNoticeDtoPre.getNotice_file_name()!=null){
			//ShopAspect.logger.info(ShopAspect.logMsg+"OK");
			File checkFile = new File(boardNoticeDtoPre.getNotice_file_path());
			if(checkFile.exists() && checkFile.isFile()){
				boolean b=checkFile.delete();
//				HomeAspect.logger.info(HomeAspect.logMsg+b);
			}
		}
		
//		HomeAspect.logger.info(HomeAspect.logMsg+"notice_number:"+boardNoticeDto.getNotice_number());
//		HomeAspect.logger.info(HomeAspect.logMsg+"notice_content:"+boardNoticeDto.getNotice_content());
//		HomeAspect.logger.info(HomeAspect.logMsg+"notice_writer:"+boardNoticeDto.getNotice_writer());
//		HomeAspect.logger.info(HomeAspect.logMsg+"notice_file_name:"+boardNoticeDto.getNotice_file_name());
//		HomeAspect.logger.info(HomeAspect.logMsg+"notice_file_path:"+boardNoticeDto.getNotice_file_path());
//		HomeAspect.logger.info(HomeAspect.logMsg+"notice_file_size:"+boardNoticeDto.getNotice_file_size());
		
		boardNoticeDto.setNotice_content(boardNoticeDto.getNotice_content().replace("\r\n", "<br/>"));
		
		int check = boardNoticeDao.boardNoticeUpdate(boardNoticeDto);
//		HomeAspect.logger.info(HomeAspect.logMsg+check);
		
		mav.addObject("check",check);
		mav.addObject("pageNumber",Integer.parseInt(request.getParameter("pageNumber")));
		mav.setViewName("/boardNotice/updateOk");
	}

	@Override
	public void boardNoticeDown(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		int notice_number=Integer.parseInt(request.getParameter("notice_number"));
//		HomeAspect.logger.info(HomeAspect.logMsg+notice_number);
		
		BoardNoticeDto boardNoticeDto = boardNoticeDao.boardNoticeSelect(notice_number);
//		HomeAspect.logger.info(HomeAspect.logMsg+boardNoticeDto);
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try{
			int index = boardNoticeDto.getNotice_file_name().indexOf("_")+1;
			String dbName = boardNoticeDto.getNotice_file_name().substring(index);
			String fileName = new String(dbName.getBytes("UTF-8"), "ISO-8859-1");
			
			response.setContentType("application/octet-stream");
			response.setContentLength((int)boardNoticeDto.getNotice_file_size());
			response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
			
			bis=new BufferedInputStream(new FileInputStream(boardNoticeDto.getNotice_file_path()));
			bos=new BufferedOutputStream(response.getOutputStream());
			
			while(true){
				int data=bis.read();
				if(data==-1) break;
				bos.write(data);
			}
			bos.flush();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(bis != null) bis.close();
				if(bos != null) bos.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
