//
//  UHCLViewController.h
//  AutismApp
//
//  Created by Nickboy on 4/5/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UHCLInfoViewController.h"

@interface UHCLViewController : UIViewController
- (IBAction)login:(id)sender;
- (IBAction)showRegister:(id)sender;
- (IBAction)cleanContent:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end
