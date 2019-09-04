#import <Foundation/Foundation.h>
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif


@interface RCT_EXTERN_MODULE(RNReactNativeLocationSwitch, NSObject)
RCT_EXTERN_METHOD(isLocationEnabled:
                  (RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(changeLocationSetting)
@end
