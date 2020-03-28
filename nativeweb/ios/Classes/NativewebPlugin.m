#import "NativewebPlugin.h"
#import "FlutterWeb.h"

//在iOS工程的info.plist文件中添加键值对key=io.flutter.embedded_views_preview value=YESs

@implementation NativewebPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterWebFactory* webViewFactory =
    [[FlutterWebFactory alloc] initWithMessager:registrar.messenger];

    [registrar registerViewFactory:webViewFactory withId:@"nativeweb"];
}

@end
