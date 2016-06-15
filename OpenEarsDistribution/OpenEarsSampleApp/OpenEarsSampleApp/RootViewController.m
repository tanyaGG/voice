//
//  RootViewController.m
//  OpenEarsSampleApp
//
//  Created by Tanya Gygi on 6/15/16.
//  Copyright © 2016 Politepix. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
    UIButton *voiceButton = [[UIButton alloc] init];
    UIImage *btnImage = [UIImage imageNamed:@"mic"];
    [voiceButton setBackgroundImage:btnImage forState:UIControlStateNormal];
    [voiceButton addTarget:self action:@selector(startButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:voiceButton];
    
    voiceButton.translatesAutoresizingMaskIntoConstraints = NO;
    [voiceButton addConstraint:[NSLayoutConstraint constraintWithItem:voiceButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:100]];
    [voiceButton addConstraint:[NSLayoutConstraint constraintWithItem:voiceButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1 constant:100]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:voiceButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:voiceButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

}

#pragma mark UI

- (IBAction) startButtonAction {

    ViewController *vc = [[ViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    vc.doneHandler = ^(NSString *phrase) {
        NSLog(@"phrase %@", phrase);
    };
    [self presentViewController:vc animated:YES completion:nil];

}

@end
