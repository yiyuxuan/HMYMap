//
// Created by Yohom Bao on 2018-12-12.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

//region 搜索
@protocol SearchMethodHandler <NSObject>
@required
- (void)onMethodCall:(FlutterMethodCall *)call :(FlutterResult)result;
@end
//endregion
