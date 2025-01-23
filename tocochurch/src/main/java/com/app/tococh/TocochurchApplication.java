package com.app.tococh;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import jakarta.annotation.Resource;

@SpringBootApplication
public class TocochurchApplication {

	public static void main(String[] args) {
		SpringApplication.run(TocochurchApplication.class, args);
	}

}
