package com.dongne.jumin;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.dongne.*"})
public class JuminApplication {

	public static void main(String[] args) {
		SpringApplication.run(JuminApplication.class, args);
	}

}
