//
//  p5_js_screen_saverView.m
//  p5.js-screen-saver
//
//  Created by Kenta Hara on 11/3/14.
//  Copyright (c) 2014 Kenta Hara.
//  MIT License

#import "p5_js_screen_saverView.h"
#import <WebKit/WebKit.h>

@implementation p5_js_screen_saverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
   
    // generate path
    NSString *path = [[NSBundle bundleForClass:self.class].resourcePath stringByAppendingString:@"/index.html"];
    NSString *URLString = [[NSURL fileURLWithPath:path isDirectory:NO] description];
    NSURL *url = [NSURL URLWithString:URLString];
   
    // add webview
    WebView *webView = [[WebView alloc] initWithFrame:frame];
    webView.frameLoadDelegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [webView.mainFrame loadRequest:request];
    [self addSubview:webView];
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
