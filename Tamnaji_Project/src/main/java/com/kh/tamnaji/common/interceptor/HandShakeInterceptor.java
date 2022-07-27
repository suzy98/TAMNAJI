package com.kh.tamnaji.common.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
 
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor {
	@Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {     
   
        // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다.
    	
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        //System.out.println("??????");
 
        HttpServletRequest req =  ssreq.getServletRequest();

        
        //String userId = (String) req.getAttribute("loginUser");
        // String userId = (String) req.getAttribute("loginUser");
        //System.out.println("userId : " + userId);
        
        
        // HttpSession 에 저장된 이용자의 아이디를 추출 (현재 로그인한 사용자계정)
        //String userId = (String)req.getSession().getAttribute("loginUser");
        //attributes.put("loginUser", userId);
        
        // HttpSession 에 저장된 이용자의 채팅반번호를 추출
//        String roomNo = (String)req.getSession().getAttribute("roomNo");
//        attributes.put("roomNo", roomNo);
        
//        System.out.println(roomNo);
        
        // 1:1
        /*
        if(!userId.equals("admin")) {

            attributes.put("otherUser", "admin");
        }
        else {
        	attributes.put("otherUser", "");
        }
        */
        
        //System.out.println("HttpSession에 저장된 id:" + userId);
        
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
 
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        //System.out.println("After Handshake");
 
        super.afterHandshake(request, response, wsHandler, ex);
    }
}
