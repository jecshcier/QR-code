//
//  ViewController.h
//  QR-code
//
//  Created by jecshcier on 16/1/16.
//  Copyright © 2016年 jecshcier. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSString *urlname;

@end

