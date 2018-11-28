//
//  ARESView.h
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARESScript.h"
#import "ARESHandler.h"

NS_ASSUME_NONNULL_BEGIN

@class ARESCommand;

@interface ARESView : UIView

- (nonnull ARESHandler *)exec:(nonnull ARESScript *)script;
- (void)addCommand:(ARESCommand *)command;

@end

NS_ASSUME_NONNULL_END
