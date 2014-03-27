//
//  FlickPhoto.m
//  Wopata_Flickr
//
//  Created by Remi Santos on 27/03/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

#import "FlickrPhoto.h"

@implementation FlickrPhoto

- (instancetype)initWithDictionnary:(NSDictionary*)dic
{
    self = [super init];
    if (self) {
        self.ID = dic[@"id"];
        self.farm = dic[@"farm"];
        self.server = dic[@"server"];
        self.secret = dic[@"secret"];
    }
    return self;
}
-(NSString*)url
{
    return [NSString stringWithFormat:@"http://farm%@.staticflickr.com/%@/%@_%@.jpg",self.farm,self.server,self.ID,self.secret];
}
@end
