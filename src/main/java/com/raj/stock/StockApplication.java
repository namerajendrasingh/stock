package com.raj.stock;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.raj.stock", "com.raj.stock.controllers"})
public class StockApplication {

	public static void main(String[] args) {
		System.out.println("=====Start=======");
		SpringApplication.run(StockApplication.class, args);
		System.out.println("=====End=======");
	}

}
