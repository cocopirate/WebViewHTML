//
//  ViewController.m
//  WebViewHTML
//
//  Created by BitterBoy on 14-9-13.
//  Copyright (c) 2014年 coco. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.google.cn/"];
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"进入didStartLoad");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSString *errorDescription = [error localizedDescription];
    NSString *errorTitle = [NSString stringWithFormat:@"Error(%d)",error.code];
    UIAlertView *errorView = [[UIAlertView alloc]
                              initWithTitle:errorTitle
                              message:errorDescription
                              delegate:self
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK",
                              nil];
    [errorView show];
}

@end
