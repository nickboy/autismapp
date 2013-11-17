//
//  SettingViewController.m
//  AutismApp
//
//  Created by Nickboy on 8/21/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import "SettingViewController.h"
#import "GameViewController.h"


@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize picker;



NSArray *categoryArray;

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
                                   style:UIBarButtonSystemItemCancel
                                   target:self action:@selector(back:)] ;
    
    UINavigationItem *navItem = [[UINavigationItem alloc]
                                 initWithTitle:@"Settings"];
    navItem.leftBarButtonItem =backButton;
    [navBar pushNavigationItem:navItem animated:NO];
    
    categoryArray =[NSArray arrayWithObjects:@"Color",@"Letter",@"Shape",@"Number", nil];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    [self doBundle];
    
    NSURL *url=[[NSURL alloc] initWithString:@"http://www.yahoo.com"];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [_webview loadRequest:request];
    
    
    
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

- (IBAction)start:(id)sender {
    GameViewController *game = [[GameViewController alloc] init];
    game.questionType = type;
    [self presentViewController:game animated:YES completion:^{NSLog(@"load the game");}];
    
}


//question type picker
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [categoryArray objectAtIndex:row];
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [categoryArray count];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"User select %@",[categoryArray objectAtIndex:row]);
    type = [categoryArray objectAtIndex:row];
}




//get picture list
-(void) doBundle {
    NSBundle *bundle = [NSBundle mainBundle];
    if(bundle){
        NSString* resourcePath = [bundle resourcePath];
        NSString* documentsPath = [resourcePath stringByAppendingPathComponent:@""];
        
        
        NSDictionary* dict = [bundle infoDictionary];
        NSString* version = [dict objectForKey:@"CFBundleShortVersionString"];
        NSLog(@"%@",version);
        
        NSString* filePath = [bundle pathForResource:@"" ofType:@"jpg"];
        
        NSLog(@"path : %@", documentsPath);
        
        NSError * error;
        NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsPath error:&error];
        NSLog(@"Directory contents : %@", directoryContents);
        
        NSArray * imageContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filePath error:&error];
        NSLog(@"Directory contents : %@", imageContents);
        
    }else {
        NSLog(@"can not open bundle");
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 300;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (MyCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor grayColor];
    NSString* title = [NSString stringWithFormat:@"Video %i",indexPath.row];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    [titleLabel setText:title];
    
    
//    NSURL *url=[[NSURL alloc] initWithString:@"http://www.yahoo.com"];
//    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
//    UIWebView *videoWeb = (UIWebView *)[cell viewWithTag:101];
//    [videoWeb loadRequest:request];
    
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = (MyCell*)[collectionView cellForItemAtIndexPath:indexPath];
    NSArray *views = [cell.contentView subviews];
    UILabel *label = [views objectAtIndex:0];
    NSLog(@"Select %@",label.text);
    cell.backgroundColor = [UIColor blueColor];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = (MyCell*)[collectionView cellForItemAtIndexPath:indexPath];
    NSArray *views = [cell.contentView subviews];
    UILabel *label = [views objectAtIndex:0];
    NSLog(@"Select %@",label.text);
    cell.backgroundColor = [UIColor grayColor];
}






@end
