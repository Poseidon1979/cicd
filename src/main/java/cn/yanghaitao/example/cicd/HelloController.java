package cn.yanghaitao.example.cicd;

import java.lang.annotation.Repeatable;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    private static final Log log = LogFactory.getLog(HelloController.class);

    @Autowired
    private DiscoveryClient discoveryClient;

    @RequestMapping("/")
    public String hello() {
        return "Hello World";
    }

    @RequestMapping("/services")
    public String services() {
        return this.discoveryClient.getInstances("kubernetes-dashboard").get(0).getUri().toString();
    }

}
