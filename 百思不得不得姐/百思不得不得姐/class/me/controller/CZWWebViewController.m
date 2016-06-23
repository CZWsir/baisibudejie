//
//  CZWWebViewController.m
//  百思不得不得姐
//
//  Created by chenzewei on 16/6/23.
//  Copyright © 2016年 百度. All rights reserved.
//

#import "CZWWebViewController.h"
#import <WebKit/WebKit.h>
@interface CZWWebViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak ,nonatomic)WKWebView *Wk;
@end

@implementation CZWWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *Wk = [[WKWebView alloc]initWithFrame:self.view.bounds];
    self.Wk = Wk;
  
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:self.url];
    
    [Wk loadRequest:request];
    
    
    [self.view insertSubview:Wk belowSubview:self.progressView];
    
    [Wk addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
//    NSLog(@"%@",change[@"new"]);
    
    NSString *str = change[@"new"];
    NSLog(@"%f",str.floatValue);
    self.progressView.progress = str.floatValue;
    
    self.progressView.hidden = str.floatValue >= 1.0;
}
- (void)dealloc
{
    [self.Wk removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
