    //
//  ResultViewController.m
//  AutismApp
//
//  Created by Nickboy on 10/14/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import "ResultViewController.h"
#import "SettingViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *urlString = @"http://r2---sn-ufuxaxjvh-q4fe.googlevideo.com/videoplayback?ratebypass=yes&expire=1383608161&itag=18&ipbits=0&mt=1383584828&ms=au&id=ca423603df8663eb&fexp=919110%2C941001%2C914504%2C911928%2C924616%2C907231%2C907240&sver=3&source=youtube&upn=pSTprFhaJeE&mv=m&sparams=id%2Cip%2Cipbits%2Citag%2Cratebypass%2Csource%2Cupn%2Cexpire&key=yt5&ip=129.7.242.209&title=Celebration%20Dance%20%5B360p%5D&signature=855C8B82A14CA5A02923D45EAE8DB4418FAEA4A4.B7981C59061FC0A409593AE8ECDD70B27FE8B97E";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
}
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToSetting:(id)sender {
    SettingViewController *controller = [[SettingViewController alloc] init];
    [self presentViewController:controller animated:YES completion:^{NSLog(@"load setting page donedone");}];
    
}
@end
