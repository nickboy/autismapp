//
//  GameViewController.m
//  AutismApp
//
//  Created by Nickboy on 8/21/13.
//  Copyright (c) 2013 Nickboy. All rights reserved.
//

#import "GameViewController.h"
#import "ResultViewController.h"

@interface GameViewController ()
@property NSMutableArray *answerList;
@property NSMutableArray *questionPictureList;
@property NSArray *jpgFiles;
@end

@implementation GameViewController


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
                                 initWithTitle:@"Gaming"];
    navItem.leftBarButtonItem =backButton;
    [navBar pushNavigationItem:navItem animated:NO];
    
    
    
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bannerTapped:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;

    
    //ImageView selection
    UITapGestureRecognizer *myTapGestureA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapEventA:)];
    _SelectionA.userInteractionEnabled = YES;
    [_SelectionA addGestureRecognizer:myTapGestureA];
    
    
    
    UITapGestureRecognizer *myTapGestureB = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTapEventB:)];
    _SelectionB.userInteractionEnabled = YES;
    [_SelectionB addGestureRecognizer:myTapGestureB];
    //_SelectionB.userInteractionEnabled = YES;
    //[_SelectionB addGestureRecognizer:myTapGesture];
    
    NSLog(@"user select %@",self.questionType);
    [self prepareQuestionList];
    [self randomGenerateQuestions];
    
    
    _answerList = [[NSMutableArray alloc] init];
    
    

    //[synthesizer speakUtterance:synUtt];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) next:(id)sender
{
    ResultViewController *resultViewController =[[ResultViewController alloc] initWithNibName:@"ResultViewController" bundle:nil];
    [self.navigationController pushViewController:resultViewController animated:YES];
}

- (void) prepareQuestionList{
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSArray *dirFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    _jpgFiles = [dirFiles filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH '.jpg'"]];
    _questionPictureList=[[NSMutableArray alloc] init];
    for (NSObject * obj in _jpgFiles)
    {
        if ([[obj description] rangeOfString:self.questionType].location == NSNotFound) {
            NSLog(@"string does not contain %@",self.questionType);
            NSLog(@"File name %@",[obj description]);
        } else {
            [_questionPictureList addObject:obj];
            NSLog(@"%@",[obj description]);
        }
    }
}

-(void)randomGenerateQuestions{
    
    
    
    [_questionPictureList shuffle];
    self.answer = (arc4random()%2);
    
    //self.answer =arc4random()%[questionPictureList count];
    if([_questionPictureList count]>1){
        [_SelectionA setImage:[UIImage imageNamed:[_questionPictureList objectAtIndex:0]]];
        [_SelectionB setImage:[UIImage imageNamed:[_questionPictureList objectAtIndex:1]]];
    }
    
    
    NSString *answerString = [@"Please select " stringByAppendingString:[[_questionPictureList objectAtIndex:self.answer] substringWithRange:NSMakeRange(0, [[_questionPictureList objectAtIndex:self.answer] length]-4)]];
    [self speech:answerString];
    
    
}

-(void) speech:(NSString *)text{
    #define MY_SPEECH_RATE  0.1666
    #define MY_SPEECH_MPX  1.55
    
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    [utterance setRate:0.15f];
    [synthesizer speakUtterance:utterance];
    
    
}

//for UIImage touch event
- (BOOL)canResignFirstResponder{
    return TRUE;
}

-(void)gestureTapEventA:(UITapGestureRecognizer *)gesture {
    
    //_SelectionA.backgroundColor = [UIColor clearColor];
    if (self.answer == 0){
        if ([_answerList containsObject:[_questionPictureList objectAtIndex:0]]==FALSE) {
            [_answerList addObject:[_questionPictureList objectAtIndex:0]];
        }
        
        if([_answerList count] ==[_questionPictureList count])
        {
            [self speech:@"Congradualation, you get the all answer correct, here is your reward"];
            ResultViewController *controller = [[ResultViewController alloc] init];
            [self presentViewController:controller animated:YES completion:^{NSLog(@"load setting page done");}];
            
        }else {
            [self speech:@"Congradualation, you are correct"];
            [self randomGenerateQuestions];
        }

    }else{
        [self speech:@"Sorry, you are wrong, please try again."];
    }
}

-(void)gestureTapEventB:(UITapGestureRecognizer *)gesture {
    
    if (self.answer == 1){
        
        if ([_answerList containsObject:[_questionPictureList objectAtIndex:1]]==FALSE) {
            [_answerList addObject:[_questionPictureList objectAtIndex:1]];
        }
        
        if([_answerList count] ==[_questionPictureList count])
        {
            [self speech:@"Congradualation, you get the all answer correct, here is your reward"];
            ResultViewController *controller = [[ResultViewController alloc] init];
            [self presentViewController:controller animated:YES completion:^{NSLog(@"load setting page done");}];
            
        }else{
            [self speech:@"Congradualation, you are correct"];
            [self randomGenerateQuestions];
        }
    }else{
        [self speech:@"Sorry, you are wrong, please try again."];
    }
}



@end
