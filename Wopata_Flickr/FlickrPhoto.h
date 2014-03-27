//
//  FlickPhoto.h
//  Wopata_Flickr
//
//  Created by Remi Santos on 27/03/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrPhoto : NSObject
@property (nonatomic,strong) NSString *ID;
@property (nonatomic,strong) NSString *farm;
@property (nonatomic,strong) NSString *server;
@property (nonatomic,strong) NSString *secret;

- (instancetype)initWithDictionnary:(NSDictionary*)dic;
-(NSString*)url;
@end
