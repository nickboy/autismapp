//
//  UHCLViewController.m
//  AutismApp
//
//  Created by Nickboy on 4/5/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import "UHCLViewController.h"
#import "RegisterViewController.h"
#import "SettingViewController.h"

@interface UHCLViewController ()
@property (nonatomic, strong) NSMutableData *responseData;

@end

@implementation UHCLViewController
@synthesize responseData = _responseData;
@synthesize username;
@synthesize password;
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
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:infoButton];
    [self.navigationItem setRightBarButtonItem:rightBarButton animated:YES];
    [infoButton addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
    self.title = @"Autism App";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//custom methods
- (void) showInfo:(id)sender
{
    UHCLInfoViewController *infoViewController =[[UHCLInfoViewController alloc] initWithNibName:@"UHCLInfoViewController" bundle:nil];
    [self.navigationController pushViewController:infoViewController animated:YES];
}



- (IBAction)login:(id)sender {
    NSLog(@"username is %@",username.text);
    NSLog(@"password is %@",password.text);
                            
    NSString *urlString = [NSString stringWithFormat:@"http://assistech.i2c.cs.uh.edu/rest/index.php/login/%@/%@",username.text,password.text];
                             
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection
     sendAsynchronousRequest:urlRequest
     queue:queue completionHandler:^(NSURLResponse *reponse , NSData *data, NSError *error) {
         if([data length]>0 && error==nil){
             dispatch_async(dispatch_get_main_queue(), ^{
                 NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                 if([result isEqualToString:@"Failed"]){
                     UIAlertView *alert = [[UIAlertView alloc]
                                           initWithTitle:@"Login result"
                                           message:result delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles:nil,nil, nil];
                     [alert show];
                 }
                 if([result isEqualToString:@"Success"]){
                     NSLog(@"login successed");
                     SettingViewController *controller = [[SettingViewController alloc] init];
                     [self presentViewController:controller animated:YES completion:^{NSLog(@"load setting page donedone");}];
                     
                 }
                 
                 
             });
         }
     }];
    
    for (UIView *view in self.view.subviews)
    {
        
    }
}

- (IBAction)showRegister:(id)sender {
    RegisterViewController *controller = [[RegisterViewController alloc] init];
    [self presentViewController:controller animated:YES completion:^{NSLog(@"load register page donedone");}];
}

- (IBAction)cleanContent:(id)sender {
    password.text = @"";
    username.text = @"";
}


-(BOOL) textFieldShouldReturn:(UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;


}




@end
