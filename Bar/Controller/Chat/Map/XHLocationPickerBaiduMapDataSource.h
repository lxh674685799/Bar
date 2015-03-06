//
//  XHLocationPickerBaiduMapDataSource.h
//  Bar
//
//  Created by 刘旭辉 on 15/3/5.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCLocationPickerViewController.h"
#import "BMapKit.h"

@interface XHLocationPickerBaiduMapDataSource : NSObject<RCLocationPickerViewControllerDataSource, BMKLocationServiceDelegate, BMKMapViewDelegate, BMKPoiSearchDelegate, BMKCloudSearchDelegate, BMKGeoCodeSearchDelegate>
@property (nonatomic, strong) BMKMapView *mapView;
@property (nonatomic, copy) OnPoiSearchResult onComplete;
@property (nonatomic, strong) BMKLocationService *locationService;
@property (nonatomic, strong) NSDate *firstTimeUserLocationUpdated;
@property (nonatomic, strong) CALayer *annotationLayer;
@property (nonatomic, strong) BMKPoiSearch *poiSearch;
@property (nonatomic, strong) BMKNearbySearchOption *nearBySearchOption;

@property (nonatomic, strong) BMKCloudSearch *cloudSearch;
@property (nonatomic, strong) BMKCloudNearbySearchInfo *cloudNearBySearchInfo;

@property (nonatomic, strong) BMKGeoCodeSearch *geoCodeSearch;
@property (nonatomic, strong) BMKReverseGeoCodeOption *geoCodeSearchOption;

@property (nonatomic, assign) BOOL userHasJumpToLocation;
@end
