//
//  ViewController.m
//  PPTest
//
//  Created by Anderson,Derek on 10/3/18.
//  Copyright © 2018 paypal. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (strong, nonatomic) WKWebView *webview;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
    
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]
                                             init];
    
    // Below setting fixes the WKwebview CORS error
    [configuration setValue:@TRUE forKey:@"allowUniversalAccessFromFileURLs"];
    
    NSString* filePath = [[[NSBundle mainBundle] resourcePath]
                          stringByAppendingPathComponent:@"ppTest.html"];
    if(filePath != nil)
    {
        _webview=[[WKWebView alloc]initWithFrame:[UIScreen mainScreen].bounds configuration:configuration];
        NSURL *nsurl=[NSURL fileURLWithPath:filePath];
        NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
        [_webview loadRequest:nsrequest];
        [self.view addSubview:_webview];
    }
    else
    {
        NSLog(@"file not exists in the path");
    }
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
