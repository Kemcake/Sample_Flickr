//
//  MainCollectionViewController.m
//  Wopata_Flickr
//
//  Created by Remi Santos on 27/03/2014.
//  Copyright (c) 2014 Remi Santos. All rights reserved.
//

#import "MainCollectionViewController.h"

@interface MainCollectionViewController ()

@end

@implementation MainCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mainArray = [[NSMutableArray alloc] init];
    
    [self loadLocationManager];
    
    [self getFlickrsWithCoordinate:CLLocationCoordinate2DMake(44.8377890, -0.5791800)];
}
-(void)loadLocationManager
{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
}
-(void)getFlickrsWithCoordinate:(CLLocationCoordinate2D)coordinate
{
    NSString *lat = [NSString stringWithFormat:@"%f",coordinate.latitude];
    NSString *lng =[NSString stringWithFormat:@"%f",coordinate.longitude];
    [[FlickrManager sharedManager] getGeoPhotoWithLatitude:lat longitude:lng success:^(NSArray *photos) {
        _mainArray = [[NSMutableArray alloc] initWithArray:photos];
        [self.collectionView reloadData];
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refresh:(id)sender {
    [self getFlickrsWithCoordinate:currentLocation.coordinate];
}

- (IBAction)showBordeaux:(id)sender {
    [self getFlickrsWithCoordinate:CLLocationCoordinate2DMake(44.8377890, -0.5791800)];
}

#pragma mark - CLLocation delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
     CLLocation *newLocation = [locations lastObject];
    currentLocation = newLocation;
    
    //[self getFlickrsWithCoordinate:newLocation.coordinate];
}


#pragma mark - UICollectionView Datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _mainArray.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    FlickrPhoto *photo = _mainArray[indexPath.row];
    UIImageView *imageView = (UIImageView*)[cell.contentView viewWithTag:1];
    [imageView setImageWithURL:[NSURL URLWithString:[photo url]] placeholderImage:[UIImage imageNamed:@"placeholderFlickr"]];
    
    
    return cell;
}

@end
