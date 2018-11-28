//
//  ARESHandler.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ARESHandler.h"

@implementation ARESHandler

- (void)invokeMethod:(NSString *)method arguments:(NSArray *)arguments {
    JSValue *value = self.managedValue.value;
    if (value != nil) {
        [value invokeMethod:method withArguments:arguments];
    }
}

@end
