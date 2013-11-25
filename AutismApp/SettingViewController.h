//
//  SettingViewController.h
//  AutismApp
//
//  Created by Nickboy on 8/21/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCell.h"

@interface SettingViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate, UICollectionViewDataSource,UICollectionViewDelegate>{
    NSArray *array;
    NSString *type;

}

@property(strong, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)back:(id)sender;
- (IBAction)start:(id)sender;
@end