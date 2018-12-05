//
//  ARESJSImage.m
//  ares
//
//  Created by PonyCui on 2018/12/4.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESJSImage.h"
#import "ARESJSBridge.h"
#import "ARESView.h"

@implementation ARESJSImage

- (void)setSrc:(NSString *)src {
    _src = src;
    [self loadImage];
}

- (void)setOnload:(JSValue *)onload {
    self.onloadManagedValue = [JSManagedValue managedValueWithValue:onload andOwner:self];
}

- (void)loadImage {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.src != nil) {
            self.image = [UIImage imageNamed:self.src];
            JSValue *onload = [self.onloadManagedValue value];
            if (self.image != nil && onload) {
                [onload callWithArguments:nil];
                [[ARESJSBridge viewWithContext:onload.context] update];
            }
        }
    });
}

@end
