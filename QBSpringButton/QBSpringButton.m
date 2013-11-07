//
//  QBSpringButton.m
//  QBSpringButton
//
//  Created by Tanaka Katsuma on 2013/11/07.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import "QBSpringButton.h"

// SKBounceAnimation
#import "SKBounceAnimation.h"

@implementation QBSpringButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    // Property settings
    self.shrinkDuration = 0.08;
    self.bounceDuration = 0.34;
    self.minimumScale = 0.85;
    self.numberOfBounces = 2;
    self.shouldOvershoot = YES;
    self.shake = NO;
    
    // Add actions
    [self addTarget:self action:@selector(didTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(didTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(didTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
}


#pragma mark - Actions

- (void)didTouchDown:(id)sender
{
    CAKeyframeAnimation *shrinkAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shrinkAnimation.values = @[
                               [NSValue valueWithCATransform3D:CATransform3DIdentity],
                               [NSValue valueWithCATransform3D:CATransform3DMakeScale(self.minimumScale, self.minimumScale, self.minimumScale)]
                               ];
    shrinkAnimation.duration = self.shrinkDuration;
    shrinkAnimation.removedOnCompletion = NO;
    shrinkAnimation.fillMode = kCAFillModeForwards;
    
    [self.layer addAnimation:shrinkAnimation forKey:@"shrinkAnimation"];
}

- (void)didTouchUp:(id)sender
{
    [self.layer removeAllAnimations];
    
    SKBounceAnimation *bounceAnimation = [SKBounceAnimation animationWithKeyPath:@"transform"];
    bounceAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(self.minimumScale, self.minimumScale, self.minimumScale)];
    bounceAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    bounceAnimation.duration = self.bounceDuration;
    bounceAnimation.numberOfBounces = self.numberOfBounces;
    bounceAnimation.shouldOvershoot = self.shouldOvershoot;
    bounceAnimation.shake = self.shake;
    
    [self.layer addAnimation:bounceAnimation forKey:@"bounceAnimation"];
}

@end
