//
// Created by Yohom Bao on 2018-12-12.
//

#import "FunctionRegistry.h"
#import "IMethodHandler.h"
#import "SearchHandlers.h"
//#import "NaviHandlers.h"

static NSDictionary<NSString *, NSObject <SearchMethodHandler> *> *_searchDictionary;

@implementation SearchFunctionRegistry {

}
+ (NSDictionary<NSString *, NSObject <SearchMethodHandler> *> *)searchMethodHandler {
  if (!_searchDictionary) {
    _searchDictionary = @{
      @"setApiKey": [SetApiKey alloc],
      @"updatePrivacyStatement": [UpdatePrivacyStatement alloc],
      @"calculateDriveRoute": [CalculateDriveRoute alloc],
      @"searchPoi": [SearchPoiKeyword alloc],
      @"searchPoiBound": [SearchPoiBound alloc],
      @"searchPoiPolygon": [SearchPoiPolygon alloc],
      @"searchPoiId": [SearchPoiId alloc],
      @"searchRoutePoiLine": [SearchRoutePoiLine alloc],
      @"searchRoutePoiPolygon": [SearchRoutePoiPolygon alloc],
      @"searchGeocode": [SearchGeocode alloc],
      @"searchReGeocode": [SearchReGeocode alloc],
      @"distanceSearch":[DistanceSearch alloc],
      @"searchBusStation":[SearchBusStation alloc],
    };
  }
  return _searchDictionary;
}

@end
