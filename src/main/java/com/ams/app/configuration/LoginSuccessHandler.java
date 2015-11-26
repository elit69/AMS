package com.ams.app.configuration;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	public LoginSuccessHandler(String defaultTargetUrl) {
		setDefaultTargetUrl(defaultTargetUrl);
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session != null) {
			String redirectUrl = (String) session.getAttribute("url_prior_login");
			/*System.out.println("onAuthenticationSuccess " + redirectUrl);
			System.out.println("context path " + getURLWithContextPath(request));
			System.out.println(getURLWithContextPath(request).equals(redirectUrl));
			System.out.println("############################################");
			System.out.println(request.getHeader("Referer"));*/
			if (getURLWithContextPath(request).equals(redirectUrl)) {
				redirectUrl+="successlogin";
				//System.out.println("sdfsdfsdfddddddddddddddddddddddddd"+redirectUrl);
				session.removeAttribute("url_prior_login");
				getRedirectStrategy().sendRedirect(request, response, redirectUrl);
			}			
		}
		super.onAuthenticationSuccess(request, response, authentication);
	}
	public static String getURLWithContextPath(HttpServletRequest request) {
		   return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
	}
}