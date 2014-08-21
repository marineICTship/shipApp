//
//  ViewController.h
//  ShipApp
//
//  Created by codepro on 2014/06/02.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *lm;
    double latitude;
    double longitude;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapview;


- (IBAction)shipSummary:(id)sender;
- (IBAction)menu:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *Toolbar;

//@interface ViewController : UIViewController

@end
