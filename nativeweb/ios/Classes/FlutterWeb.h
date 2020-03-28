//
//  FlutterWeb.h
//  Pods
//
//  Created by zhangxin on 2020/3/28.
//

#import <Flutter/Flutter.h>
#import <WebKit/WebKit.h>

@interface FlutterWebFactory : NSObject <FlutterPlatformViewFactory>

- (instancetype)initWithMessager:(NSObject<FlutterBinaryMessenger>*)messager;

@end


@interface FlutterWebController : NSObject <FlutterPlatformView>

-(instancetype)initWithWithFrame:(CGRect)frame
                  viewIdentifier:(int64_t)viewId
                       arguments:(id _Nullable)args
                  binaryMessager:(NSObject<FlutterBinaryMessenger>*)messager;

@end
