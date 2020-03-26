//event dispatcher header file
#import <Flutter/Flutter.h>

@interface FlutterMyPluginEvent : NSObject<FlutterStreamHandler>
@property (nonatomic, strong) FlutterEventSink eventSink;
@property (nonatomic, strong) FlutterEventChannel* eventChannel;
@end
