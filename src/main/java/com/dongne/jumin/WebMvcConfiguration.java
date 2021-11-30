package com.dongne.jumin;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.dongne.club.Club;
import com.dongne.market.Market;
import com.dongne.office.Office;
import com.dongne.tour.Tour;
import com.dongne.user.User;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// Windows: path = "f:/AIstudy/deploy/shopping/contents/storage";
		// ▶ file:///f:/AIstudy/deploy/shopping/contents/storage
		// Ubuntu: path = "/home/ubuntu/deploy/shopping/contents/storage";
		// ▶ file:////home/ubuntu/deploy/shopping/contents/storage
		// JSP 인식되는 경로: http://localhost:8000/contents/storage";
		registry.addResourceHandler("/contents/storage/**").addResourceLocations("file:///" + Tour.getUploadDir());
		registry.addResourceHandler("/tour/storage/**").addResourceLocations("file:///" + Tour.getUploadDir());
		registry.addResourceHandler("/office/storage/**").addResourceLocations("file:///" + Office.getUploadDir());
		registry.addResourceHandler("/market/storage/**").addResourceLocations("file:///" + Market.getUploadDir());
		registry.addResourceHandler("/club/storage/**").addResourceLocations("file:///" + Club.getUploadDir());

		registry.addResourceHandler("/user/storage/**").addResourceLocations("file:///" + User.getUploadDir());
		/* '/js/**'로 호출하는 자원은 '/static/js/' 폴더 아래에서 찾는다. */
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/")
				.setCachePeriod(60 * 60 * 24 * 365);
		/* '/css/**'로 호출하는 자원은 '/static/css/' 폴더 아래에서 찾는다. */
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/")
				.setCachePeriod(60 * 60 * 24 * 365);
		/* '/img/**'로 호출하는 자원은 '/static/img/' 폴더 아래에서 찾는다. */

		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/static/images/")
				.setCachePeriod(60 * 60 * 24 * 365);
		/* '/font/**'로 호출하는 자원은 '/static/font/' 폴더 아래에서 찾는다. */
		registry.addResourceHandler("/font/**").addResourceLocations("classpath:/static/font/")
				.setCachePeriod(60 * 60 * 24 * 365);
		// registry.addResourceHandler("/attachfile/storage/**").addResourceLocations("file:///"
		// + Attachfile.getUploadDir());
		// registry.addResourceHandler("/member/storage/**").addResourceLocations("file:///"
		// + Member.getUploadDir());
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		// URL에 "/admin/"이 들어간 요청은 AdminInterceptor 작동함.
		registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**/**");

	}
}