package com.labolida.contconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;

/*
http://127.0.0.1:8321/
*/

@RestController
public class ContconnController {

	private static String name = new String("empty");

	@RequestMapping(value = "/", method = RequestMethod.GET)
	String defaultRoot() {
		return "Welcome to contconn!";
	}


	@RequestMapping(value = "/setName", method = RequestMethod.GET)
	String setName( @RequestParam Map<String,String> requestParams ) {
		name=requestParams.get("name");
		return "Name setted as " + name;
	}


	@RequestMapping(value = "/getName", method = RequestMethod.GET)
	String getName() {
		return "My name is:" + name;
	}
	

	/**
	** It call another URL. It could be another contconn instance running inside another container or pod.
	** example: /call?url=http://ipaddress:port/getName
	*/
	@RequestMapping(value = "/call", method = RequestMethod.GET)
	String call( @RequestParam Map<String,String> requestParams ) {
		String url=requestParams.get("url");
		String content = WebClient.create(url).get().retrieve().bodyToMono(String.class).block();
		System.out.println(content);
		return content;
	}


	/**
	** MYSQL TESTER
	** example jdbcurl=jdbc:mysql://mysqlhost:port/databasename?autoReconnect=true&useSSL=false
	*/
	@RequestMapping(value = "/database", method = RequestMethod.GET)
	String mysql(@RequestParam Map<String,String> requestParams) {
		String host = requestParams.get("host");
		String port = requestParams.get("port");
		String databasename = requestParams.get("databasename");
		String user = requestParams.get("user");
		String password = requestParams.get("password");

		String url = "jdbc:mysql://"+host+":"+port+"/"+databasename+"?user="+user+"&password="+password+"&useUnicode=true&characterEncoding=UTF-8";
		StringBuffer buff = new StringBuffer();
		buff.append("jdbcurl=<br>" + url + "<br>");
		try{  
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url);
			buff.append("Connected successfuly <br>");
			Statement stmt=con.createStatement();  
			con.close();  
		}
		catch(Exception e){ 
			buff.append("Connection error: " + e.getMessage() + "<br>");
			System.out.println(e);
		}  
		return new String(buff);
	}


	@RequestMapping(value = "/exit", method = RequestMethod.GET)
	public void exit() {
		System.out.println("Application exit!");
		System.exit(-1);
	}
	
}
