//
//  GLGStripeNative.h
//  GLGStripeNative
//
//  Created by Vignesh Rajasekaran on 15/5/18.
//  Copyright © 2018 Glorgo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Stripe/Stripe.h>
#import <React/RCTBridgeModule.h>

@interface GLGStripeNative : NSObject <RCTBridgeModule, STPAddCardViewControllerDelegate>

@end
