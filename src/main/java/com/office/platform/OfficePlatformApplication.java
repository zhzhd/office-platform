package com.office.platform;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author zhzhd
 * @date 2019年1月13日
 */
@SpringBootApplication
//@MapperScan("com.zhzhd.bgsystem.dao")
public class OfficePlatformApplication {

	public static void main(String[] args) {
		SpringApplication.run(OfficePlatformApplication.class, args);
	}
}
