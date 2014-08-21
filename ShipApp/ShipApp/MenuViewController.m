//
//  MenuViewController.m
//  ShipApp
//
//  Created by codepro on 2014/06/13.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController (){
    float Svalue;
}

@end

@implementation MenuViewController
@synthesize Map2,MarineMapSwitch,MeshSwitch,WakeSlider,mylabel,BoatSwitch;

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
    MKCoordinateRegion region = Map2.region;
    region.center.latitude = 34.551246;
    region.center.longitude = 135.188034;
    region.span.latitudeDelta = 0.5;
    region.span.longitudeDelta = 0.5;
    [Map2 setRegion:region animated:YES];
    Map2.delegate = self;
    
    Svalue = 0.0;

}

//線を引くための
/*[super viewDidLoad];
CLLocationCoordinate2D transamericaCenter = {37.79520324238053, -122.40283370018005};
CLLocationCoordinate2D coliseumCenter = {41.890289963005124, 12.492302656173706};
//CLLocationCoordinate2D points[] = { [37.774929, -122.419416], [40.714353, -74.005973] };
MKGeodesicPolyline *geodesic;
geodesic = [MKGeodesicPolyline polylineWithCoordinates:&points[0]
                                                 count:2];
[self.Map2 addOverlay:geodesic];*/

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView
            rendererForOverlay:(id < MKOverlay >)overlay
{
    MKPolylineRenderer *renderer =
    [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor orangeColor];
    renderer.lineWidth = 6.0;
    return renderer;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)MRButton:(id)sender {
}
- (IBAction)MarineMapSwitch:(id)sender {
}

- (IBAction)MeshSwitch:(id)sender {
    
}

- (IBAction)WakeSlider:(id)sender {
    //UISlider *WakeSlider = [[UISlider alloc] init];
    
    // スライダーの初期化...
    [WakeSlider addTarget:self
               action:@selector(sliderChanging:)
     forControlEvents:UIControlEventValueChanged];
    
    
}
- (void)sliderChanging:(UISlider*)sender {
    
    NSLog(@"スライダーの値が変わりました");
    
    //スライダーの現在値を取得
    WakeSlider.value = round(WakeSlider.value);
    Svalue = WakeSlider.value;
    
    //ラベルに現在値を表示
    if(0 <= Svalue && Svalue < 1){
        mylabel.text = [NSString stringWithFormat:@"表示(薄)"];
    }else if(1 <= Svalue && Svalue < 2){
        mylabel.text = [NSString stringWithFormat:@"表示(中)"];
    }else if(2 <= Svalue && Svalue < 3){
        mylabel.text = [NSString stringWithFormat:@"表示(濃)"];
    }
}
- (IBAction)BoatSwitch:(id)sender {
    
        if (self.BoatSwitch.on != YES) {
            [self.WakeSlider setEnabled:NO];
            //mylabel.text = [NSString stringWithFormat:@" "];
        }else {
            self.WakeSlider.enabled = YES;

        }
    
}
@end
