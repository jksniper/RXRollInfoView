//
//  RXRollInfoView.m
//  RXRollInfoView
//
//  Created by wwx on 15/9/29.
//  Copyright © 2015年 shadow. All rights reserved.
//

#import "RXRollInfoView.h"
@interface RXRollInfoView()
{
    UILabel *label;
    NSTimer *timer;
    NSArray *infoArray;
    NSInteger infoCount;
}
@end

@implementation RXRollInfoView

//if not create with nib this will be called
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //do something
        self.layer.masksToBounds = YES;
        
    }
    return self;
}

-(void)setInfoStringsArray:(NSArray *)array andRollDuration:(CGFloat)seconds{
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:label];
    label.backgroundColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    if (array.count!=0) {
        infoArray = array;
        label.text = array[0];
        infoCount = 0;
        [self beginTimerWithDuration:seconds];
        
    }else{
        label.text = @"默认信息...";
    }
}

#pragma mark - 开始计时器
-(void)beginTimerWithDuration:(CGFloat)timerDuration{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:timerDuration target:self selector:@selector(timerSel) userInfo:nil repeats:YES];
        [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    }
}

-(void)timerSel{
    
//    [UIView animateWithDuration:.2 animations:^{
//        label.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
//    } completion:^(BOOL finished) {
//        
//        infoCount++;
//        if (infoCount == infoArray.count) {
//            infoCount = 0;
//        }
//        label.text = infoArray[infoCount];
//        label.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
//        
//        [UIView animateWithDuration:.2 animations:^{
//            label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
//        } completion:^(BOOL finished) {
//            
//        }];
//    }];
    
    [self fadeLayer:label.layer];
    
    infoCount++;
    if (infoCount == infoArray.count) {
        infoCount = 0;
    }
    label.text = infoArray[infoCount];
    
}

#pragma mark - 停止计时器并移除
-(void)stopTimer{
    [timer invalidate];
    timer = nil;
}

-(void)dealloc{
    [timer invalidate];
    timer = nil;
}

//渐隐
-(void)fadeLayer:(CALayer *)layer{
    //CATransition
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = .5;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = kCATransitionFade;
    animation.type = @"cube";
    
    if (self.RollDirection == 0) {
        animation.subtype = kCATransitionFromBottom;
    }else if (self.RollDirection == 1){
        animation.subtype = kCATransitionFromTop;
    }else if (self.RollDirection == 2){
        animation.subtype = kCATransitionFromLeft;
    }else if (self.RollDirection == 3){
        animation.subtype = kCATransitionFromRight;
    }else{
        animation.subtype = kCATransitionFromBottom;
    }
    
    [layer addAnimation:animation forKey:@"animation"];
}

@end
