//
//  MenuViewController.h
//  ShipApp
//
//  Created by codepro on 2014/06/13.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MenuViewController : UIViewController
{
    UISlider *slider;
    
}

- (IBAction)MRButton:(id)sender;

@property (weak, nonatomic) IBOutlet MKMapView *Map2;

- (IBAction)MarineMapSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *MarineMapSwitch;

- (IBAction)MeshSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *MeshSwitch;

- (IBAction)WakeSlider:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *WakeSlider;

@property (weak, nonatomic) IBOutlet UILabel *mylabel;


@end
