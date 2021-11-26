package com.dongne.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;
 
@Configuration
@EnableWebSocket
@ComponentScan(basePackages = "com.dongne.message")
public class WebSocketConfigs implements WebSocketConfigurer{
	
    @Autowired
    private EchoHandler EchoHandler;
 
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(EchoHandler, "/echo").setAllowedOrigins("*").withSockJS()
        .setInterceptors(new HttpSessionHandshakeInterceptor());
    }
    
    
}
