//
//  ViewController.m
//  QR-code
//
//  Created by jecshcier on 16/1/16.
//  Copyright © 2016年 jecshcier. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _webView.delegate =self;
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.1.111:3000"]];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"QRsource/index" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
//    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"QRsource/source/script" withExtension:@"js"] encoding:NSUTF8StringEncoding error:nil]];
    self.automaticallyAdjustsScrollViewInsets= NO;
    [_webView loadRequest:request];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (_urlname) {
        int dataId = 0;
        if ([_urlname hasPrefix:@"http://"]) {
            dataId = 1;
        }
        
//        [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"checkresult('%@',%d);",_urlname,dataId]];
        _urlname = nil;
    }
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    if([url hasSuffix:@"camera/click"]){
        //获取storyboard: 通过bundle根据storyboard的名字来获取我们的storyboard,
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //由storyboard根据myView的storyBoardID来获取我们要切换的视图
        ViewController *scanView = [story instantiateViewControllerWithIdentifier:@"QR-code"];
        //由navigationController推向我们要推向的view
        [self.navigationController pushViewController:scanView animated:YES];
        return NO;
    }
    return YES;
}


@end
