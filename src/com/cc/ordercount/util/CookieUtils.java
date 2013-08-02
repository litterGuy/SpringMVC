package com.cc.ordercount.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieUtils {

    public static Cookie getCookie(HttpServletRequest request, String name) {
        Cookie cookies[] = request.getCookies();
        if (cookies == null || name == null || name.length() == 0) {
            return null;
        }
        Cookie cookie = null;
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals(name)) {
                    cookie = cookies[i];
                    break;
            }
        }
        return cookie;
    }
}
