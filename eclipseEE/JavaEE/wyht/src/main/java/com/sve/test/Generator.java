package com.sve.test;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

//ÄæÏò¹¤³Ì
public class Generator {
	@Test
	public void main(){
		List<String> warnings=new ArrayList<String>();
		boolean flag=true;
		File file=new File("src/main/resources/generatorConfig.xml");
		ConfigurationParser cp=new ConfigurationParser(warnings);
		Configuration config=null;
		MyBatisGenerator myBatisGenerator=null;
		try {
			config = cp.parseConfiguration(file);
			DefaultShellCallback callback=new DefaultShellCallback(flag);
			myBatisGenerator=new MyBatisGenerator(config,callback,warnings);
			myBatisGenerator.generate(null);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XMLParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
}
