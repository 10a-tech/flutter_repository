#import "FlutterMypluginPlugin.h"
#import "FlutterMyPluginEvent.h"

@implementation FlutterMypluginPlugin

FlutterMyPluginEvent *pluginEvent;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_myplugin"
            binaryMessenger:[registrar messenger]];
  FlutterMypluginPlugin* instance = [[FlutterMypluginPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    
    pluginEvent = [[FlutterMyPluginEvent alloc] init];
    pluginEvent.eventChannel = [FlutterEventChannel eventChannelWithName:@"flutter_plugin_event" binaryMessenger:[registrar messenger]];
    [pluginEvent.eventChannel setStreamHandler:pluginEvent];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"getNative" isEqualToString:call.method]) {
    result(@"Get iOS Success");
  } else if ([@"sayHello" isEqualToString:call.method]) {
      NSDictionary* argsMap = call.arguments;
      NSString* message = argsMap[@"message"];
//      NSLog(message);
    //result(message);//直接返回内容
      result(@{@"message":message,@"info":@"info_value"});
      
      FlutterEventSink eventSink = pluginEvent.eventSink;
      if(eventSink){
          eventSink(@{
              @"event": @"demoEvent",
              @"value": @"value is 10 ios"
          });
      }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
