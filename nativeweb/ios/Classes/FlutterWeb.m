//
//  FlutterWeb.m
//  nativeweb
//
//  Created by zhangxin on 2020/3/28.
//

#import "FlutterWeb.h"

@implementation FlutterWebFactory {
    NSObject<FlutterBinaryMessenger>* _messager;
}

- (instancetype)initWithMessager:(NSObject<FlutterBinaryMessenger>*)messager{
    self = [super init];
    if(self){
        _messager = messager;
    }
    return self;
}

-(NSObject<FlutterMethodCodec>*)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView>*)createWithFrame:(CGRect)frame
                                  viewIdentifier:(int64_t)viewId
                                       arguments:(id)args{
    FlutterWebController* webviewController =
    [[FlutterWebController alloc] initWithWithFrame:frame
                                     viewIdentifier:viewId
                                          arguments:args
                                     binaryMessager:_messager];
    
    return webviewController;
}

@end

@implementation FlutterWebController{
    WKWebView* _webview;
    int64_t _viewId;
    FlutterMethodChannel* _channel;
}

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                  binaryMessager:(NSObject<FlutterBinaryMessenger>*)messager{
    if([super init]){
        _viewId = viewId;
        _webview = [[WKWebView alloc]initWithFrame:frame];
        NSString* channelName = [NSString stringWithFormat:@"nativeweb_%lld",viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messager];
        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            [weakSelf onMethodCall:call result:result];
        }];
    }
    return self;
    
}

-(UIView*)view{
    return _webview;
}

-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    if([[call method] isEqualToString:@"loadUrl"]){
        [self onLoadUrl:call result:result];
    }else{
        result(FlutterMethodNotImplemented);
    }
}

-(void)onLoadUrl:(FlutterMethodCall*)call result:(FlutterResult)result{
    NSString* url = [call arguments];
    if(![self loadUrl:url]){
        result([FlutterError errorWithCode:@"" message:@"" details:@""]);
    }else{
        result(nil);
    }
}

-(bool)loadUrl:(NSString*)url{
    NSURL* nsUrl = [NSURL URLWithString:url];
    if(!nsUrl){
        return false;
    }
    NSURLRequest* req = [NSURLRequest requestWithURL:nsUrl];
    [_webview loadRequest:req];
    return true;
}

@end
