package cn.yanghaitao.example.cicd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

import java.util.List;

@SpringBootApplication
@EnableDiscoveryClient
public class CicdApplication {

	@Autowired
	private DiscoveryClient discoveryClient;


	private void getServiceInfo()
	{
           List<ServiceInstance> instanceList = discoveryClient.getInstances("kubernetes.default");
           ServiceInstance instance = instanceList.get(0);
           System.out.println("The instance name is: " + instance.getUri());
	}

	public static void main(String[] args) {

		    CicdApplication app = new CicdApplication();
		    app.getServiceInfo();
        	SpringApplication.run(CicdApplication.class, args);
	}

}
