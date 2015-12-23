package com.healing.adminProduct.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.healing.adminProduct.dao.AdminProductDao;
import com.healing.aop.HomeAspect;
import com.healing.product.dao.ProductDao;
import com.healing.product.dto.BargainDto;
import com.healing.product.dto.FlightDto;
import com.healing.product.dto.ProductCityDto;
import com.healing.product.dto.ProductDayDto;
import com.healing.product.dto.ProductDetailDto;
import com.healing.product.dto.ProductDto;
import com.healing.product.dto.ProductPhotoDto;

/**
 * @이름 : AdminProductServiceImp
 * @날짜 : 2015. 12. 7.
 * @개발자 : 홍유한
 * @설명 : 상품등록 Service 구현클래스
 */
@Component
public class AdminProductServiceImp implements AdminProductService {
	@Autowired
	private AdminProductDao adminProductDao;
	
	@Override
	public void productWrite(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		
		mav.setViewName("adminProduct/adminProductWrite");
	}

	@Override
	public void productWriteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		ProductDto productDto=(ProductDto)map.get("productDto");
		
		int product_number=adminProductDao.productWrite(productDto);
		
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(product_number);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void productCityWriteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		ProductCityDto productCityDto=(ProductCityDto)map.get("productCityDto");
		
		int check = adminProductDao.productCityWrite(productCityDto);
		
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void flightWriteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		FlightDto flightDto=(FlightDto)map.get("flightDto");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");

		String yy = request.getParameter("flight_start_departure_year");
		String mm = request.getParameter("flight_start_departure_month");
		String dd = request.getParameter("flight_start_departure_day");
		String hh = request.getParameter("flight_start_departure_hour");
		String MM = request.getParameter("flight_start_departure_minute");
		try {
			String dateInString = yy+mm+dd+hh+MM+"00";
			Date date = sdf.parse(dateInString);
			flightDto.setFlight_start_departure(date);
			dateInString = yy+mm+dd+"000000";
			date = sdf.parse(dateInString);
			flightDto.setFlight_start_date(date);
		} catch (ParseException e) {}
		
		yy = request.getParameter("flight_start_arrival_year");
		mm = request.getParameter("flight_start_arrival_month");
		dd = request.getParameter("flight_start_arrival_day");
		hh = request.getParameter("flight_start_arrival_hour");
		MM = request.getParameter("flight_start_arrival_minute");
		try {
			String dateInString = yy+mm+dd+hh+MM+"00";
			Date date = sdf.parse(dateInString);
			flightDto.setFlight_start_arrival(date);
		} catch (ParseException e) {}
		
		yy = request.getParameter("flight_end_departure_year");
		mm = request.getParameter("flight_end_departure_month");
		dd = request.getParameter("flight_end_departure_day");
		hh = request.getParameter("flight_end_departure_hour");
		MM = request.getParameter("flight_end_departure_minute");
		try {
			String dateInString = yy+mm+dd+hh+MM+"00";
			Date date = sdf.parse(dateInString);
			flightDto.setFlight_end_departure(date);
		} catch (ParseException e) {}

		yy = request.getParameter("flight_end_arrival_year");
		mm = request.getParameter("flight_end_arrival_month");
		dd = request.getParameter("flight_end_arrival_day");
		hh = request.getParameter("flight_end_arrival_hour");
		MM = request.getParameter("flight_end_arrival_minute");
		try {
			String dateInString = yy+mm+dd+hh+MM+"00";
			Date date = sdf.parse(dateInString);
			flightDto.setFlight_end_arrival(date);
			dateInString = yy+mm+dd+"000000";
			date = sdf.parse(dateInString);
			flightDto.setFlight_end_date(date);
		} catch (ParseException e) {}
		
		int check = adminProductDao.flightWrite(flightDto);
		
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void productDayWriteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		ProductDayDto productDayDto=(ProductDayDto)map.get("productDayDto");
		
		int product_day_number = adminProductDao.productDayWrite(productDayDto);
		
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(product_day_number);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void productDetailWriteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		ProductDetailDto productDetailDto=(ProductDetailDto)map.get("productDetailDto");
		
		int product_detail_number = adminProductDao.productDetailWrite(productDetailDto);
		
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(product_detail_number);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void productPhotoWriteOk(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse)map.get("response");
		ProductPhotoDto productPhotoDto=(ProductPhotoDto)map.get("productPhotoDto");
		
		String[] photoIndex=request.getParameter("product_photo_index").split(",");
		
		int dayMax=Integer.parseInt(photoIndex[photoIndex.length-1].split("-")[0]);
		int[] detailMax = new int[dayMax+1];
		for(int i=0;i<=dayMax;i++){
			int dMax=0;
			for (int j = 0; j < photoIndex.length; j++) {
				if (i==Integer.parseInt(photoIndex[j].split("-")[0])) dMax++;
			}
			detailMax[i]=dMax;
		}

		int product_number=productPhotoDto.getProduct_number();
		int product_day_number=productPhotoDto.getProduct_day_number() - dayMax;
		int product_detail_number=productPhotoDto.getProduct_detail_number() - photoIndex.length + 1;
		
		int check=0;
		for (int i = 0; i <= dayMax; i++) {
			for (int j = 0; j < detailMax[i]; j++) {
				productPhotoDto.setProduct_day_number(product_day_number+i);
				productPhotoDto.setProduct_detail_number(product_detail_number+check);
				
				MultipartFile upFile = request.getFile("product_photo" + photoIndex[check]);
				String fileName = photoIndex[check] + ".jpg";
				//			String fileName = photoIndex[i] + "." + upFile.getOriginalFilename().split(".")[upFile.getOriginalFilename().split(".").length-1];
				long fileSize = upFile.getSize();
				if (fileSize != 0) {
					File path1 = new File("C:\\healing\\workspace\\healing\\src\\main\\webapp\\resources\\productphoto\\" + product_number + "\\");
					File path2 = new File("C:\\healing\\apache-tomcat-7.0.64\\wtpwebapps\\healing\\resources\\productPhoto\\" + product_number + "\\");
					if (!path1.exists()) path1.mkdirs();
					if (!path2.exists()) path2.mkdirs();

					File file1 = new File(path1, fileName);
					File file2 = new File(path2, fileName);
					
					FileInputStream inputStream=null;
					FileOutputStream outputStream=null;
					BufferedInputStream bin=null;
					BufferedOutputStream bout=null;
					try {
						upFile.transferTo(file1);
						productPhotoDto.setProduct_photo_filename(fileName);
						productPhotoDto.setProduct_photo_path(file1.getAbsolutePath());
						productPhotoDto.setProduct_photo_size(fileSize);
					
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
				check += adminProductDao.productPhotoWrite(productPhotoDto);
			}
		}
		
		mav.addObject("product_number", product_number);	    
	    mav.addObject("check", check);	    
		mav.setViewName("adminProduct/adminProductWriteOk");
	}

	@Override
	public void adminBargain(ModelAndView mav) {
		BargainDto bargainDto=adminProductDao.getBargain();
		
		mav.addObject("bargainDto", bargainDto);
		mav.setViewName("adminProduct/adminBargain");
	}

	@Override
	public void adminBargainWrite(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		BargainDto bargainDto=(BargainDto)map.get("bargainDto");
		HomeAspect.logger.info(HomeAspect.logMsg + bargainDto);
		int check=adminProductDao.setBargain(bargainDto);

	    mav.addObject("check", check);	    
		mav.setViewName("adminProduct/adminBargainOk");
	}

	@Override
	public void adminBargainUpdate(ModelAndView mav) {
		Map<String,Object> map=mav.getModelMap();
		BargainDto bargainDto=(BargainDto)map.get("bargainDto");
		
		int check=adminProductDao.updateBargain(bargainDto);

	    mav.addObject("check", check);	    
		mav.setViewName("adminProduct/adminBargainOk");
	}

	@Override
	public void adminProductList(ModelAndView mav) {
		
	}

	@Override
	public void adminProductUpdate(ModelAndView mav) {
		
	}
}
