//
//  GameViewController.h
//  AutismApp
//
//  Created by Nickboy on 8/21/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "NSMutableArray+Shuffling.h"

@class FliteTTS;

@interface GameViewController : UIViewController{
    FliteTTS *fliteEngine;
}
- (IBAction)next:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *SelectionA;
@property (weak, nonatomic) IBOutlet UIImageView *SelectionB;
@property (weak, nonatomic) NSString *questionType;
@property (assign, nonatomic) int  answer;


@end
