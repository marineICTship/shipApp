//
//  ViewController.h
//  ShipApp
//
//  Created by codepro on 2014/06/02.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *myMap;
- (IBAction)search:(id)sender;
- (IBAction)shipSummary:(id)sender;
- (IBAction)menu:(id)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *Toolbar;


@end
