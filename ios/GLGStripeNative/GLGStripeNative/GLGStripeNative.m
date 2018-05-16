//
//  GLGStripeNative.m
//  GLGStripeNative
//
//  Created by Vignesh Rajasekaran on 15/5/18.
//  Copyright © 2018 Glorgo. All rights reserved.
//

#import "GLGStripeNative.h"
#import <React/RCTUtils.h>
#import <React/RCTConvert.h>

@implementation GLGStripeNative
{
    RCTPromiseResolveBlock promiseResolver;
    RCTPromiseRejectBlock promiseRejector;
}

RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport
{
    return @{ USER_CANCELLED: USER_CANCELLED };
}

RCT_EXPORT_METHOD(openAddCardSourceView:(NSDictionary *)options
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject) {
    STPPaymentConfiguration *configuration = [[STPPaymentConfiguration alloc] init];
    configuration.publishableKey = options[@"publishableKey"];
    configuration.createCardSources = YES;

    STPTheme *theme = [[STPTheme alloc] init];

    promiseResolver = resolve;
    promiseRejector = reject;
    STPAddCardViewController *addCardViewController = [[STPAddCardViewController alloc] initWithConfiguration:configuration theme:theme];
    addCardViewController.delegate = self;

    // STPAddCardViewController must be shown inside a UINavigationController.
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:addCardViewController];
    [RCTPresentedViewController() presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark STPAddCardViewControllerDelegate

- (void)addCardViewControllerDidCancel:(STPAddCardViewController *)addCardViewController {
    [RCTPresentedViewController() dismissViewControllerAnimated:YES completion:nil];
    promiseRejector(USER_CANCELLED, @"User cancelled controller", nil);
}

- (void)addCardViewController:(STPAddCardViewController *)addCardViewController
              didCreateSource:(nonnull STPSource *)source
                   completion:(nonnull STPErrorBlock)completion {
    [RCTPresentedViewController() dismissViewControllerAnimated:YES completion:nil];
    completion(nil);
    promiseResolver(source.stripeID);
}

- (void)addCardViewController:(STPAddCardViewController *)addCardViewController
               didCreateToken:(nonnull STPToken *)token completion:(nonnull STPErrorBlock)completion {
    [RCTPresentedViewController() dismissViewControllerAnimated:YES completion:nil];
    completion(nil);
    promiseResolver(token.stripeID);
}

@end
