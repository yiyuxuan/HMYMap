#import "AmapSearchPlugin.h"

#import "MJExtension.h"
#import "SearchModels.h"
#import "IMethodHandler.h"
#import "FunctionRegistry.h"
#import <AMapSearchKit/AMapSearchKit.h>

@implementation AmapSearchPlugin

static NSObject <FlutterPluginRegistrar> *_registrar;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [AMapServices sharedServices].enableHTTPS = YES;
  _registrar = registrar;

  FlutterMethodChannel *searchChannel = [FlutterMethodChannel
                                         methodChannelWithName:@"com.github.hugochou.amap_search"
                                         binaryMessenger:[registrar messenger]];
  [searchChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
      result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
      return;
    }

    NSObject <SearchMethodHandler> *handler = [SearchFunctionRegistry searchMethodHandler][call.method];
    if (handler) {
      [[handler init] onMethodCall:call :result];
    } else {
      result(FlutterMethodNotImplemented);
    }
  }];
}

+ (NSObject <FlutterPluginRegistrar> *)registrar {
    return _registrar;
}
@end

