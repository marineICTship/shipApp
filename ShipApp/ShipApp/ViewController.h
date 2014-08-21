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
#import <Foundation/Foundation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *lm;
    double latitude;
    double longitude;
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

/*@interface MapViewController : UIViewController<MKMapViewDelegate> {
    MKMapView* mapView;
}*/


- (IBAction)shipSummary:(id)sender;
- (IBAction)menu:(id)sender;
@property (nonatomic, retain) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UIToolbar *Toolbar;

//@interface ViewController : UIViewController

@end

@interface CustomAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *annotationTitle;
    NSString *annotationSubtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *annotationTitle;
@property (nonatomic, retain) NSString *annotationSubtitle;
- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationannSubtitle;
- (NSString *)title;
- (NSString *)subtitle;

@end
