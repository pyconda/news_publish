/**
 * 
 */
package com.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.po.User;

/**
 * @author chenzhi
 *
 */
public class LoginInterceptor implements HandlerInterceptor{




/* (non-Javadoc)
 * @see org.springframework.web.servlet.HandlerInterceptor#afterCompletion(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
 */
@Override
public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
		throws Exception {
	// TODO Auto-generated method stub
	
}

/* (non-Javadoc)
 * @see org.springframework.web.servlet.HandlerInterceptor#postHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, org.springframework.web.servlet.ModelAndView)
 */
@Override
public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
		throws Exception {
	// TODO Auto-generated method stub
	
}

/* (non-Javadoc)
 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
 */
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse reponse, Object handler) throws Exception {
	// TODO Auto-generated method stub
	String url=request.getRequestURI();
	if(url.indexOf("/login.action")>=0){
		return true;
	}
	HttpSession session=request.getSession();
	User user=(User) session.getAttribute("login_user");
	
	if(user!=null){
		return true;
	}
	
	request.setAttribute("msg", "你还没有登录，请先登录");
	request.getRequestDispatcher("/skip.jsp").forward(request, reponse);
	return false;
}

}
