//
//  ARESScript.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARESScript : NSObject

+ (nullable ARESScript *)decodeFromBundle:(nonnull NSString *)named bundle:(nullable NSBundle *)bundle;

@property (nonatomic, readonly, nonnull) NSString *evalScript;

- (instancetype)initWithEvalScript:(nonnull NSString *)evalScript;

@end

NS_ASSUME_NONNULL_END
