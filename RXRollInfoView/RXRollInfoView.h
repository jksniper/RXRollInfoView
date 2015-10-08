//
//  RXRollInfoView.h
//  RXRollInfoView
//
//  Created by wwx on 15/9/29.
//  Copyright © 2015年 shadow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXRollInfoView : UIView
@property (nonatomic,assign)NSInteger RollDirection;
-(void)setInfoStringsArray:(NSArray *)array andRollDuration:(CGFloat)seconds;

@end
