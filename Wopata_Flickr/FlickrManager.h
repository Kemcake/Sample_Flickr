//
//  FlickrManager.h
//  Wopata_Flickr
//
//  Created by Remi Santos on 27/03/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "FlickrPhoto.h"
@interface FlickrManager : NSObject

+ (FlickrManager*)sharedManager;

-(void)getGeoPhotoWithLatitude:(NSString*)lat longitude:(NSString*)lng success:(void(^)(NSArray *photos))success;

@end
