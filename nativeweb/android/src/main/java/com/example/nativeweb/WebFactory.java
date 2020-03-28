package com.example.nativeweb;

import android.content.Context;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * author : zhangxin
 * date : 2020-03-28 18:06
 * description :
 */
public class WebFactory extends PlatformViewFactory {

    private final PluginRegistry.Registrar mPluginRegistrar;

    public WebFactory(PluginRegistry.Registrar registrar) {
        super(StandardMessageCodec.INSTANCE);
        this.mPluginRegistrar = registrar;
    }

    @Override
    public PlatformView create(Context context, int viewId, Object args) {
        return new FlutterWeb(context, mPluginRegistrar, viewId);
    }
}
