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
@property (weak, nonatomic) IBOutlet UIToolbar *myToolbar;
- (IBAction)MenuButton:(id)sender;

@end
