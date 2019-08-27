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
    WKWebView *webView = [[WKWebView alloc] initWithFrame:[self bounds]];
    webView.navigationDelegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [webView loadRequest:request];
    
    // Hide webview while loading
    [webView setHidden:true];
    
    [self addSubview:webView];
    return self;
}

// Show webview when finished loading
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation;
{
    [webView setHidden:false];
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

// Override default listeners

- (NSView *)hitTest:(NSPoint)aPoint {
    return self;
}

- (void)keyDown:(NSEvent *)theEvent {
    return;
}

- (void)keyUp:(NSEvent *)theEvent {
    return;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)resignFirstResponder {
    return NO;
}

@end
