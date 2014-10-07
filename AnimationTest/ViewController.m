//
//  ViewController.m
//  AnimationTest
//
//  Created by Simone Ferrini on 07/10/2014.
//  Copyright (c) 2014 Simone Ferrini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSLayoutConstraint *verticalPosition;

@property (strong, nonatomic) UIView *bouncingBox;
@property (strong, nonatomic) UIButton *startButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.bouncingBox];
    [self.view addSubview:self.startButton];
}

#pragma mark - Actions

- (void)start:(UIButton *)sender
{
    sender.enabled = NO;
    
    [UIView animateKeyframesWithDuration:5.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        self.bouncingBox.backgroundColor = [UIColor redColor];
        
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            self.verticalPosition.constant = 200.0;
            [self.view layoutIfNeeded];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            self.verticalPosition.constant = 50.0;
            [self.view layoutIfNeeded];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.125 animations:^{
            self.verticalPosition.constant = 200.0;
            [self.view layoutIfNeeded];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.875 relativeDuration:0.0625 animations:^{
            self.verticalPosition.constant = 50.0;
            [self.view layoutIfNeeded];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.9375 relativeDuration:0.03125 animations:^{
            self.verticalPosition.constant = 200.0;
            [self.view layoutIfNeeded];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.96875 relativeDuration:0.015625 animations:^{
            self.verticalPosition.constant = 50.0;
            [self.view layoutIfNeeded];
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            sender.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            sender.transform = CGAffineTransformIdentity;
        }];
        
    } completion:^(BOOL finished){
        sender.enabled = YES;
    }];
}

#pragma mark - Getter

- (UIView *)bouncingBox
{
    if (_bouncingBox) {
        return _bouncingBox;
    }
    
    _bouncingBox = [[UIView alloc] initWithFrame:CGRectZero];
    _bouncingBox.backgroundColor = [UIColor blackColor];
    _bouncingBox.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_bouncingBox
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]]; //x
    
    self.verticalPosition = [NSLayoutConstraint constraintWithItem:_bouncingBox
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:100.0]; //y
    [self.view addConstraint:self.verticalPosition];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_bouncingBox
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:100.0]]; //w
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_bouncingBox
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:100.0]]; //h
    
    return _bouncingBox;
}

- (UIButton *)startButton
{
    if (_startButton) {
        return _startButton;
    }
    
    _startButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [_startButton addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    [_startButton setTitle:@"Start" forState:UIControlStateNormal];
    _startButton.backgroundColor = [UIColor greenColor];
    _startButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_startButton
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]]; //x
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_startButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]]; //y
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_startButton
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:100.0]]; //w
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_startButton
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:100.0]]; //h
    
    return _startButton;
}

@end
