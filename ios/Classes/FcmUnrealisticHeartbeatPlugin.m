#import "FcmUnrealisticHeartbeatPlugin.h"

@implementation FcmUnrealisticHeartbeatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"fcm_unrealistic_heartbeat"
            binaryMessenger:[registrar messenger]];
  FcmUnrealisticHeartbeatPlugin* instance = [[FcmUnrealisticHeartbeatPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
