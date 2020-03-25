package cn.yanghaitao.example.cicd;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CicdApplication {

	public static void main(String[] args) {
                System.out.print("It really works!")	
        	SpringApplication.run(CicdApplication.class, args);
	}

}
