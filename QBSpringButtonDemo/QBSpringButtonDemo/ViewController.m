//
//  ViewController.m
//  QBSpringButtonDemo
//
//  Created by Tanaka Katsuma on 2013/11/07.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import "ViewController.h"

// QBSpringButton
#import "QBSpringButton.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet QBSpringButton *springButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Spring button settings
    self.springButton.minimumScale = 0.92;
}

@end
