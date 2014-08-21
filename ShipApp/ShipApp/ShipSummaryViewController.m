//
//  ShipSummaryViewController.m
//  ShipApp
//
//  Created by codepro on 2014/06/23.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import "ShipSummaryViewController.h"

@interface ShipSummaryViewController () <UITableViewDataSource, UITableViewDelegate>{
    NSDictionary *shipArray;
    NSArray *check;
}

//
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ShipSummaryViewController

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
    
     self.dataArray = [NSMutableArray new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 157;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *reuseIdentifire = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifire];
    if( cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifire];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ship" ofType:@"txt"];
    NSData *shipjson = [NSData dataWithContentsOfFile:path];
    NSDictionary *shipjsonobj = [NSJSONSerialization JSONObjectWithData:shipjson options:0 error:nil];
    
    //cell.textLabel.text = @"表示する文字";
    
    //値とキーを、それぞれ配列として取得
    NSArray *kArr = [shipjsonobj allKeys];
    NSArray *vArr = [shipjsonobj allValues];
    
    //NSArray *kArr2 = [vArr allKeys];
    //NSArray *vArr2 = [vArr allValues];
    
    /*for(int j=0; j < vArr.count; j++){
        NSLog(@"%d キー1[%@] 値=[%@]",vArr.count, kArr[j],vArr[j]);
    }*/
    
    //NSLog(@"値=[%@]", shipjsonobj[@"Ship"][@"name"]);
    for(id key in[shipjsonobj keyEnumerator]) {
        //NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"mmsi"]);
        //NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"latlng"]);
        //NSLog(@"キー1[%@] 値=[%@]", key,shipjsonobj[key][@"name"]);
        //cell.textLabel.text = (@"%@",shipjsonobj[key][@"name"]);
        //cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@",shipjsonobj[key][@"name"]];
        
        //NSMutableDictionary *nameArry = shipjsonobj[key][@"name"];
        //NSLog(@"値=[%@]",nameArry[@"name"]);
    }
    
    for (int i = 0;i < 157;i++) {
        if(indexPath.row == i){
            cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@",shipjsonobj[@"ships"][i][@"Ship"][@"name"]];
        }
    }
    
    //文字の色
    //cell.textLabel.textColor = [UIColor brownColor];
    //文字サイズ
    cell.textLabel.font = [UIFont systemFontOfSize:30];
    //チェックマーク
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSString *reuseIdentifire = @"Cell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifire];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //選択されたときに行うこと
    NSLog(@"セクション%dの%d行目",indexPath.section, indexPath.row);
    
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark){
		cell.accessoryType = UITableViewCellAccessoryNone;
	}else{
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
}

/*- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
	cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ReturnButton:(id)sender {
}
@end
