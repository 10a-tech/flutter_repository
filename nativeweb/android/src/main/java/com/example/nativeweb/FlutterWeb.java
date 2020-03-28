package com.example.nativeweb;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import androidx.annotation.NonNull;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.platform.PlatformView;

/**
 * author : zhangxin
 * date : 2020-03-28 18:10
 * description :
 */
class FlutterWeb implements PlatformView, MethodChannel.MethodCallHandler {

    Context context;
    PluginRegistry.Registrar registrar;
    WebView webView;
    String url = "";
    MethodChannel channel;

    @SuppressLint("SetJavaScriptEnabled")
    public FlutterWeb(Context context, PluginRegistry.Registrar registrar, int viewId) {
        this.context = context;
        this.registrar = registrar;
        this.url = url;
        webView = getWebView(registrar);

        channel = new MethodChannel(registrar.messenger(), "nativeweb_" + viewId);
        channel.setMethodCallHandler(this);
    }

    private WebView getWebView(PluginRegistry.Registrar registrar) {
        WebView webView = new WebView(registrar.context());
        webView.setWebViewClient(new WebViewClient());
        webView.getSettings().setJavaScriptEnabled(true);
        return webView;
    }


    @Override
    public View getView() {
        return webView;
    }

    @Override
    public void dispose() {

    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case "loadUrl":
                String url = call.arguments.toString();
                webView.loadUrl(url);
                break;
            default:
                result.notImplemented();
        }
    }
}
