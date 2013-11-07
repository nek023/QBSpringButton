//
//  QBSpringButton.h
//  QBSpringButton
//
//  Created by Tanaka Katsuma on 2013/11/07.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QBSpringButton : UIButton

@property (nonatomic, assign) CFTimeInterval shrinkDuration;
@property (nonatomic, assign) CFTimeInterval bounceDuration;
@property (nonatomic, assign) CGFloat minimumScale;
@property (nonatomic, assign) NSUInteger numberOfBounces;
@property (nonatomic, assign) BOOL shouldOvershoot;
@property (nonatomic, assign) BOOL shake;

@end
