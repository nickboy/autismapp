//
//  MyCell.h
//  TestCollectionViewWithXIB
//
//  Created by Nickboy on 10/11/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (strong, nonatomic) IBOutlet UIWebView *videoWeb;


@end
