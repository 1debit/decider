//
//  ELViewController.m
//  LunchDecider3000
//
//  Created by 1debit on 10/8/13.
//  Copyright (c) 2013 1debit. All rights reserved.
//

#import "ELViewController.h"

@interface NSArray (Random)
- (id) randomObject;
@end

@implementation NSArray (Random)

- (id) randomObject
{
    if ([self count] == 0) {
        return nil;
    }
    return [self objectAtIndex: arc4random() % [self count]];
}

@end

@interface ELViewController ()

@end

@implementation ELViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self personToPickDefaultState];
    
    self.employeeList = @[
                          @"Eric Lewis",
                          @"Beth Vogelsang",
                          @"Ryan King",
                          @"Chris Britt",
                          @"Joey Trevino",
                          @"Loren Scott",
                          @"Kyle Daley",
                          @"Boris de Souza",
                          ];
    
    self.funnyWaitingTerms = @[@"Seeking...", @"Loading...", @"Uno momento...", @"Looking...", @"Chill out...", @"Dude, oww...", @"Manners, please...", @"Ohh, right there..."];
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)personToPickDefaultState{
    self.personPickedLabel.text = @"Shake Me.";
}

- (void)personToBePicked{
    self.personPickedLabel.text = [self.employeeList randomObject];
}

- (void)viewWillAppear:(BOOL)animated{
    [self personToPickDefaultState];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
    	self.personPickedLabel.text = [self.funnyWaitingTerms randomObject];
        [self performSelector:@selector(personToBePicked) withObject:self afterDelay:1.1];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
