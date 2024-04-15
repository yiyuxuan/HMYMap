package com.github.hugochou.amap_search

import com.github.hugochou.amap_search.search.*

/**
 * 搜索功能集合
 */
val SEARCH_METHOD_HANDLER: Map<String, SearchMethodHandler> = mapOf(
        "setApiKey" to SetApiKey,
        "updatePrivacyStatement" to UpdatePrivacyStatement,
        "calculateDriveRoute" to CalculateDriveRoute,
        "searchPoi" to SearchPoiKeyword,
        "searchPoiBound" to SearchPoiBound,
        "searchPoiPolygon" to SearchPoiPolygon,
        "searchPoiId" to SearchPoiId,
        "searchRoutePoiLine" to SearchRoutePoiLine,
        "searchRoutePoiPolygon" to SearchRoutePoiPolygon,
        "searchGeocode" to SearchGeocode,
        "searchReGeocode" to SearchReGeocode,
        "searchBusStation" to SearchBusStation,
        "distanceSearch" to DistanceSearchHandler
)
