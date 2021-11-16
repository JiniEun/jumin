package com.dongne.jumin;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.dongne.office.Office;
import com.dongne.tour.Tour;

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
        
        // registry.addResourceHandler("/attachfile/storage/**").addResourceLocations("file:///" + Attachfile.getUploadDir());
        //registry.addResourceHandler("/member/storage/**").addResourceLocations("file:///" + Member.getUploadDir());
    }
    
    
    
      @Override
      public void addInterceptors(InterceptorRegistry registry) {
     
    // URL에 "/admin/"이 들어간 요청은 AdminInterceptor 작동함.
        registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**/**");
        
      }
 
}