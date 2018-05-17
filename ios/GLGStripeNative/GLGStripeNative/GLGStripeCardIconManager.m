//
//  GLGStripeCardIconManager.m
//  GLGStripeNative
//
//  Created by Vignesh Rajasekaran on 17/5/18.
//  Copyright © 2018 Glorgo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import <Stripe/Stripe.h>

@interface GLGStripeCardIconManager : RCTViewManager
@end

@implementation GLGStripeCardIconManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[STPImageLibrary visaCardImage]];
    return imageView;
}

@end
