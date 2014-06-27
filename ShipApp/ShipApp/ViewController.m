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
@synthesize myMap;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MKCoordinateRegion region = myMap.region;
    region.center.latitude = 34.551246;
    region.center.longitude = 135.188034;
    region.span.latitudeDelta = 0.5;
    region.span.longitudeDelta = 0.5;
    [myMap setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//jsonデータ
/*- (void)viewWillAppear:(BOOL)animated{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shipss_json" ofType:@"txt"];
    NSData *shipjson = [NSData dataWithContentsOfFile:path];
    NSDictionary *shipjsonobj = [NSJSONSerialization JSONObjectWithData:shipjson options:0 error:nil];
    
    for(id key in[shipjsonobj keyEnumerator]) {
        NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"mmsi"]);
        NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"latlng"]);
        NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"name"]);
    }
    
}*/

- (IBAction)MenuButton:(id)sender {
}
- (IBAction)search:(id)sender {
    [self performSegueWithIdentifier:@"s" sender:self];
    
}

- (IBAction)shipSummary:(id)sender {
}

- (IBAction)menu:(id)sender {
}
@end
