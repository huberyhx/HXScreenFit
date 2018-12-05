//
//  HXScreenFitUtil.h
//  HXScreenFit
//
//  Created by haoxu.wang on 2018/10/18.
//  Copyright © 2018年 haoxu.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HXScreenFitUtil;

typedef HXScreenFitUtil *(^ HXScreenFitHandler)(CGFloat value);

@interface HXScreenFitUtil : NSObject

- (CGFloat (^)(CGFloat))defaultValue;
- (HXScreenFitHandler)iphone4;
- (HXScreenFitHandler)iphone5;
- (HXScreenFitHandler)iphone6;
- (HXScreenFitHandler)iphone6p;
- (HXScreenFitHandler)iphoneX;
- (HXScreenFitHandler)iphoneXSMax;

@end
