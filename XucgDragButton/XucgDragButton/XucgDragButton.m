//
//  XucgDragButton.m
//  XucgDragButton
//
//  Created by xucg on 9/29/16.
//  Copyright © 2016 xucg. All rights reserved.
//

#import "XucgDragButton.h"

#define kPadding 5
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width   // 当前屏幕宽
#define kScreenHeight [UIScreen mainScreen].bounds.size.height  // 当前屏幕高
#define kSelfX        self.frame.origin.x
#define kSelfWidth    self.frame.size.width
#define kSelfY        self.frame.origin.y
#define kSelfHeight   self.frame.size.height

@implementation XucgDragButton

- (instancetype)init {
    self = [super init];
    if (self) {
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        panGesture.maximumNumberOfTouches = 1;
        panGesture.minimumNumberOfTouches = 1;
        panGesture.delegate = (id<UIGestureRecognizerDelegate>)self;
        [self addGestureRecognizer:panGesture];
    }
    
    return self;
}

- (void)handlePanGesture:(UIPanGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [gesture locationInView:self.superview];
        [self setCenter:location];
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint location = [gesture locationInView:self.superview];
        CGRect newFrame = self.frame;
        newFrame.origin.x = location.x - kSelfWidth / 2;
        newFrame.origin.y = location.y - kSelfHeight / 2;
        self.frame = newFrame;
        
        float marginLeft = kSelfX;
        float marginRight = kScreenWidth - kSelfX - kSelfWidth;
        float marginTop = kSelfY;
        float marginBottom = kScreenHeight - kSelfY - kSelfHeight;
        [UIView animateWithDuration:0.125 animations:^(void) {
            if (marginTop < 60) {
                CGFloat tmpX = marginLeft < marginRight ? (marginLeft < kPadding ? kPadding : kSelfX) : (marginRight < kPadding ? (kScreenWidth - kSelfWidth - kPadding) : kSelfX);
                self.frame = CGRectMake(tmpX, kPadding, kSelfWidth, kSelfHeight);
            } else if (marginBottom < kPadding) {
                CGFloat tmpX = marginLeft < marginRight ? (marginLeft < kPadding ? kPadding : kSelfX) : (marginRight < kPadding ? (kScreenWidth - kSelfWidth - kPadding) : kSelfX);
                self.frame = CGRectMake(tmpX, kScreenHeight - kSelfHeight - kPadding, kSelfWidth, kSelfHeight);
            } else {
                CGFloat tmpX = marginLeft < marginRight ? kPadding : (kScreenWidth - kSelfWidth-kPadding);
                self.frame = CGRectMake(tmpX, kSelfY, kSelfWidth, kSelfHeight);
            }
        }];
    }
}

@end
