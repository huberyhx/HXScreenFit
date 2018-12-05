//
//  HXScreenFitUtil.m
//  HXScreenFit
//
//  Created by haoxu.wang on 2018/10/18.
//  Copyright © 2018年 haoxu.wang. All rights reserved.
//

#import "HXScreenFitUtil.h"

typedef NS_ENUM(NSInteger, HXScreenType) {
    HXScreenType_unknown,
    HXScreenType_iPhone4,
    HXScreenType_iPhone5,
    HXScreenType_iPhone6,
    HXScreenType_iPhone6p,
    HXScreenType_iPhoneX,
    HXScreenType_iPhoneXSMax
};

@implementation HXScreenFitUtil

static CGFloat TargetValue = MAXFLOAT;

#pragma mark - CGFLoat
- (CGFloat (^)(CGFloat))defaultValue {
    return ^(CGFloat defaultValue){
        if (TargetValue == MAXFLOAT) {
            return defaultValue;
        } else {
            CGFloat tem = TargetValue;
            TargetValue = MAXFLOAT;
            return tem;
        }
    };
}

#pragma mark - Public
- (HXScreenFitHandler)iphone4 {
    return ^(CGFloat value){
        [self adjustWithScreenType:HXScreenType_iPhone4 value:value];
        return self;
    };
}

- (HXScreenFitHandler)iphone5 {
    return ^(CGFloat value){
        [self adjustWithScreenType:HXScreenType_iPhone5 value:value];
        return self;
    };
}

- (HXScreenFitHandler)iphone6 {
    return ^(CGFloat value){
        [self adjustWithScreenType:HXScreenType_iPhone6 value:value];
        return self;
    };
}

- (HXScreenFitHandler)iphone6p {
    return ^(CGFloat value){
        [self adjustWithScreenType:HXScreenType_iPhone6p value:value];
        return self;
    };
}

- (HXScreenFitHandler)iphoneX {
    return ^(CGFloat value){
        [self adjustWithScreenType:HXScreenType_iPhoneX value:value];
        return self;
    };
}

- (HXScreenFitHandler)iphoneXSMax {
    return ^(CGFloat value){
        [self adjustWithScreenType:HXScreenType_iPhoneXSMax value:value];
        return self;
    };
}

#pragma mark - Private
- (void)adjustWithScreenType:(HXScreenType)screenType value:(CGFloat)value {
    if ([self currentScreenType] == screenType) {
        TargetValue = value;
    }
}

- (HXScreenType)currentScreenType {
    CGSize size = [UIScreen mainScreen].bounds.size;
    if (CGSizeEqualToSize(size, CGSizeMake(320, 480))) {
        return HXScreenType_iPhone4;
    } else if (CGSizeEqualToSize(size, CGSizeMake(320, 568))) {
        return HXScreenType_iPhone5;
    } else if (CGSizeEqualToSize(size, CGSizeMake(375, 667))) {
        return HXScreenType_iPhone6;
    } else if (CGSizeEqualToSize(size, CGSizeMake(414, 736))) {
        return HXScreenType_iPhone6p;
    } else if (CGSizeEqualToSize(size, CGSizeMake(375, 812))) {
        return HXScreenType_iPhoneX;
    } else if (CGSizeEqualToSize(size, CGSizeMake(414, 896))) {
        return HXScreenType_iPhoneXSMax;
    }
    return HXScreenType_unknown;
}

@end
