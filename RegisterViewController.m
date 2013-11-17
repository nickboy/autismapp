//
//  RegisterViewController.m
//  AutismApp
//
//  Created by Nickboy on 8/21/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0,768,44)];
    [self.view addSubview:navBar];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStylePlain
                                   target:self action:@selector(back:)] ;
    
    UINavigationItem *navItem = [[UINavigationItem alloc]
                                 initWithTitle:@"Register for new user"];
    navItem.leftBarButtonItem =backButton;
    [navBar pushNavigationItem:navItem animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
