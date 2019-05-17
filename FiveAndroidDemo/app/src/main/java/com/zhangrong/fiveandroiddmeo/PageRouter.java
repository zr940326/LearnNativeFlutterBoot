package com.zhangrong.fiveandroiddmeo;

import android.content.Context;
import android.content.Intent;


public class PageRouter {


    public static final String NATIVE_PAGE_URL = "sample://nativePage";
    public static final String FLUTTER_PAGE_URL = "sample://flutterPage";

    public static boolean openPageByUrl(Context context, String url) {
        return openPageByUrl(context, url, 0);
    }


    public static boolean openPageByUrl(Context context, String url, int requestCode) {

        //根据页面标识，做不同的页面跳转
        try {
            if (url.startsWith(FLUTTER_PAGE_URL)) {


                return true;
            } else if (url.startsWith(NATIVE_PAGE_URL)) {


                return true;
            } else {

                return false;
            }

        } catch (Throwable t) {
            return false;
        }
    }
}
