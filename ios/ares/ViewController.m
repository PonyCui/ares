//
//  ViewController.m
//  ares
//
//  Created by PonyCui on 2018/11/28.
//  Copyright © 2018年 XT Studio. All rights reserved.
//

#import "ViewController.h"
#import "ARESView.h"

@interface ViewController ()

@property (nonatomic, strong) ARESView *sampleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sampleView = [[ARESView alloc] initWithFrame:CGRectZero];
    self.sampleView.backgroundColor = [UIColor blackColor];
    ARESScript *script = [ARESScript decodeFromBundle:@"drawCircle.js" bundle:nil];
    if (script != nil) {
        ARESHandler *handler = [self.sampleView exec:script];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [handler invokeMethod:@"fillColor" arguments:@[@"yellow"]];
        });
    }
    [self.view addSubview:self.sampleView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.sampleView.frame = self.view.bounds;
}

@end
