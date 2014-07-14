//
//  SearchViewController.h
//  ShipApp
//
//  Created by codepro on 2014/06/12.
//  Copyright (c) 2014年 FutureUniversityHakodate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
- (IBAction)returnButton:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)searchButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *SearchLabel;

@end
