//
//  ARESJSImage.h
//  ares
//
//  Created by PonyCui on 2018/12/4.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ARESJSOnloadCallback)(void);

@protocol ARESJSImage <JSExport>

@property (nonatomic, strong) NSString *src;
@property (nonatomic, strong) JSValue *onload;

@end

@interface ARESJSImage : NSObject<ARESJSImage>

@property (nonatomic, strong) NSString *src;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) JSValue *onload;
@property (nonatomic, strong) JSManagedValue *onloadManagedValue;

@end

NS_ASSUME_NONNULL_END
