//
//  SearchViewController.m
//  ShipApp
//
//  Created by codepro on 2014/06/12.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize searchBar,SearchLabel;

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
    SearchLabel.text = [NSString stringWithFormat:@"%@",searchBar.text];
    
    
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



// 検索を実行する時に呼ばれる
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"searchBarSearchButtonClicked");

}

// テキストフィールド入力開始前に呼ばれる
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"searchBarShouldBeginEditing");
    
    return YES;
}

// テキストフィールドの入力開始時に呼ばれる
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"searchBarTextDidBeginEditing");
}

// テキストフィールドの入力完了前に呼ばれる
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"searchBarShouldEndEditing");
    SearchLabel.text = [NSString stringWithFormat:@"　"];
    
    return YES;
}



- (IBAction)returnButton:(id)sender {
}


- (IBAction)searchButton:(id)sender {
}
@end
