package com.app.tococh;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class TocochurchApplication extends SpringBootServletInitializer {

   @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(TocochurchApplication.class);
    }	
	
	public static void main(String[] args) {
		SpringApplication.run(TocochurchApplication.class, args);
	}

}
