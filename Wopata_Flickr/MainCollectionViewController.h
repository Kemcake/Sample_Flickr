//
//  MainCollectionViewController.h
//  Wopata_Flickr
//
//  Created by Remi Santos on 27/03/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlickrManager.h"
#import "UIImageView+AFNetworking.h"
#import <CoreLocation/CoreLocation.h>

@interface MainCollectionViewController : UICollectionViewController<CLLocationManagerDelegate>
{
    NSMutableArray *_mainArray;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}
- (IBAction)refresh:(id)sender;
- (IBAction)showBordeaux:(id)sender;
@end
