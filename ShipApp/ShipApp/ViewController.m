//
//  ViewController.m
//  ShipApp
//
//  Created by codepro on 2014/06/02.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView;



//map_view.delegate = self;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MKCoordinateRegion region = mapView.region;
    region.center.latitude = 34.551246;
    region.center.longitude = 135.188034;
    region.span.latitudeDelta = 0.5;
    region.span.longitudeDelta = 0.5;
    [mapView setRegion:region animated:YES];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ship" ofType:@"txt"];
    NSData *shipjson = [NSData dataWithContentsOfFile:path];
    NSMutableDictionary *shipjsonobj = [NSJSONSerialization JSONObjectWithData:shipjson options:0 error:nil];
    
    for(int i = 0; i < 157; i++){
        NSString *lat = (NSString*)shipjsonobj[@"ships"][i][@"Ship"][@"latlng"][0];
        NSString *lon = (NSString*)shipjsonobj[@"ships"][i][@"Ship"][@"latlng"][1];
        NSString *name = (NSString*)shipjsonobj[@"ships"][i][@"Ship"][@"name"];
        NSString *mmsi = (NSString*)shipjsonobj[@"ships"][i][@"Ship"][@"mmsi"];
        
        MKPointAnnotation *pin = [[MKPointAnnotation alloc]init];
        CLLocationCoordinate2D point;
        //point.latitude = 41.842;
        //point.longitude = 140.7669;
        point.latitude = lat.doubleValue;
        point.longitude = lon.doubleValue;
        [pin setCoordinate:point];
        pin.title = name;
        pin.subtitle = mmsi;
        [mapView addAnnotation:pin];
        
    }
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"boat" ofType:@"txt"];
    NSData *boatjson = [NSData dataWithContentsOfFile:path1];
    NSMutableDictionary *boatjsonobj = [NSJSONSerialization JSONObjectWithData:boatjson options:0 error:nil];
    
    for(int j = 0; j < 11; j++){
        NSString *lat = (NSString*)boatjsonobj[@"boats"][j][@"Boat"][@"latlngs"][0][0];
        NSString *lon = (NSString*)boatjsonobj[@"boats"][j][@"Boat"][@"latlngs"][0][1];
        NSString *idb = (NSString*)boatjsonobj[@"boats"][j][@"Boat"][@"id"];
        NSString *time = (NSString*)boatjsonobj[@"boats"][j][@"Boat"][@"timestamp"];
        
        MKPointAnnotation *pin1 = [[MKPointAnnotation alloc]init];
        CLLocationCoordinate2D point1;
        //point.latitude = 41.842;
        //point.longitude = 140.7669;
        point1.latitude = lat.doubleValue;
        point1.longitude = lon.doubleValue;
        [pin1 setCoordinate:point1];
        pin1.title = idb;
        pin1.subtitle = time;
        [mapView addAnnotation:pin1];
        mapView.delegate = self;
        
    }

}

/*- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnocation:(id <MKAnnotation>) Annotation{
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier: @"my_annotaion"];
    
    if(annotationView == nil){
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation: Annotation reuseIdentifier:@"my_annotaion"];
    }else{
        annotationView.annotation = Annotation;
    }
    
    //annotationView.animatesDrop = YES;
    //annotationView.canShowCallout = YES;
    annotationView.pinColor = MKPinAnnotationColorPurple;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//線を引くための
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineView *view = [[MKPolylineView alloc]initWithOverlay:overlay];
    view.strokeColor = [UIColor redColor];
    view.lineWidth = 10.0;
    return view;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    mapView.showsUserLocation = YES;
    CLLocationCoordinate2D coords[2];
    coords[0] = CLLocationCoordinate2DMake(34.551246, 135.188034);
    coords[1] = CLLocationCoordinate2DMake(36.58621, 136.15651);
    
    MKPolyline *line = [MKPolyline polylineWithCoordinates:coords count:2];
    
    //---線を引く
    [mapView addOverlay:line];
    
    
}

//jsonデータ
- (void)viewWillAppear:(BOOL)animated{
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"ships_json" ofType:@"txt"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ship" ofType:@"txt"];
    NSData *shipjson = [NSData dataWithContentsOfFile:path];
    NSMutableDictionary *shipjsonobj = [NSJSONSerialization JSONObjectWithData:shipjson options:0 error:nil];
    //NSMutableDictionary *shipjsonobj = [NSMutableDictionary dictionary];
    //shipjsonobj = shipjsonobj0[@"ships"][0];
    for(int k = 0;k < 139;k++){
        //NSArray shipjsonobj[k] = shipjsonobj0[@"ships"][k];
    }
    
    
    for(id key in[shipjsonobj keyEnumerator]) {
        //NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key]);
        //NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"Ship"][@"mmsi"]);
        NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][137][@"Ship"][@"latlng"][0]);
        //NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"name"]);
    }
    NSArray *kArr = [shipjsonobj allKeys];
    NSArray *vArr = [shipjsonobj allValues];
    for(int j=0; j < vArr.count; j++){
        //NSLog(@"%d キー1[%@] 値=[%@]",vArr.count, kArr[j],vArr[j]);
    }

    
}



- (IBAction)shipSummary:(id)sender {
}

- (IBAction)menu:(id)sender {
}
@end
