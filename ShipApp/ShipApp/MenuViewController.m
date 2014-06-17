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
@synthesize Map2,MarineMapSwitch,MeshSwitch,WakeSlider,mylabel;

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
    
    Svalue = 1.0;
    //mylabel.text = [NSString stringWithFormat:@"表示(薄)"];

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
        mylabel.text = [NSString stringWithFormat:@"非表示"];
    }else if(1 <= Svalue && Svalue < 2){
        mylabel.text = [NSString stringWithFormat:@"表示(薄)"];
    }else if(2 <= Svalue && Svalue < 3){
        mylabel.text = [NSString stringWithFormat:@"表示(中)"];
    }else if(3 <= Svalue && Svalue < 4){
        mylabel.text = [NSString stringWithFormat:@"表示(濃)"];
    }
}
@end
