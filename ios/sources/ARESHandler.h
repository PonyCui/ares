//
//  ARESHandler.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

@class ARESView;

@interface ARESHandler : NSObject

@property (nonatomic, strong) JSManagedValue *managedValue;
@property (nonatomic, weak) ARESView *view;

- (void)invokeMethod:(NSString *)method
           arguments:(nullable NSArray *)arguments;

@end

NS_ASSUME_NONNULL_END
