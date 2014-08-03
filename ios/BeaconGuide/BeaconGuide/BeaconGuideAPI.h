//
//  BeaconGuideAPI.h
//  BeaconGuide
//
//  Created by Kevin Ku on 8/3/14.
//  Copyright (c) 2014 Beacon_Guide. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface BeaconGuideAPI : NSObject

typedef void(^RequestCallback)(AFHTTPRequestOperation *operation, id data);
typedef void(^ErrorCallback)(AFHTTPRequestOperation *operation, NSError * error);

@property AFHTTPRequestOperationManager *operationManager;

+(BeaconGuideAPI *)instance;

-(void)getBeaconBuilding :(NSUUID *)UUID :(NSUInteger)majorNumber :(NSUInteger)minorNumber :(RequestCallback)successCB :(ErrorCallback)failureCB;

- (void)getPath :(NSString *)startBeaconID :(NSString *)endBeaconID :(NSString *)buildingID :(RequestCallback)successCB :(RequestCallback)failureCB;

@end
