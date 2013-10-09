//
//  ELViewController.h
//  LunchDecider3000
//
//  Created by 1debit on 10/8/13.
//  Copyright (c) 2013 1debit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *personPickedLabel;
@property (nonatomic, strong) NSArray *employeeList;
@property (nonatomic, strong) NSArray *funnyWaitingTerms;

@end
