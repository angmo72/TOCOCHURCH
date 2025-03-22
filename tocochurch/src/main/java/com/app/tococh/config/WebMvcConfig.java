package com.app.tococh.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.app.tococh.interceptor.LoginInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new LoggerInterceptor())
//                .excludePathPatterns("/css/**", "/images/**", "/js/**");

        registry.addInterceptor(new LoginInterceptor())
//                .addPathPatterns("/**/*")
                .excludePathPatterns(
                		"/"
                		,"/churchInfo.do"
                		,"/youtube/*.*"
                		,"/home/*.*"
                		,"/img/*.*"
                		,"/css/*.*"
                		,"/js/*.*"
                		,"/*.ico"
                		,"/error"
                		,"/login.do"
                		,"/loginProc.do"
                		,"/loginOut.do"
                		,"/getSessionInfo.do"
                		);
    }

}
