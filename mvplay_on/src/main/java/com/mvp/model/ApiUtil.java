package com.mvp.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ApiUtil {
    private static Properties properties = new Properties();

    static {
        try (InputStream input = ApiUtil.class.getClassLoader().getResourceAsStream("application.properties")) {
            if (input == null) {
                System.out.println("연결 안됨(apiutil");
                
            }
            properties.load(input);
            System.out.println("연결완료(apiutil)");
            System.out.println("input :"+input);
            
            
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static String getProperty(String key) {
        String value = properties.getProperty(key);
        if (value == null) {
            System.out.println("Key not found: " + key);
        }
        System.out.println("Key  found: " + key);
        return value;
        
    }
   
    
}
