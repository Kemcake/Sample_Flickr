//
//  FlickrManager.m
//  Wopata_Flickr
//
//  Created by Remi Santos on 27/03/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

#import "FlickrManager.h"


#define api_key @"1c8b30021433b88bc0c09fd72921f8de"
#define api_url @"https://api.flickr.com/services/rest/"

@implementation FlickrManager

+ (FlickrManager*)sharedManager {
    static FlickrManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}


-(void)getGeoPhotoWithLatitude:(NSString*)lat longitude:(NSString*)lng success:(void(^)(NSArray *photos))success
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{};
    NSString *requestURL = [NSString stringWithFormat:@"%@?method=flickr.photos.search&api_key=%@&lat=%@&lon=%@&format=json&nojsoncallback=1",api_url,api_key,lat,lng];
    [manager GET:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        for (NSDictionary*dic in responseObject[@"photos"][@"photo"]) {
            FlickrPhoto *photo = [[FlickrPhoto alloc] initWithDictionnary:dic];
            [resultArray addObject:photo];
        }
        
        success(resultArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
