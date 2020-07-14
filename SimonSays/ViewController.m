//
//  ViewController.m
//  SimonSays
//
//  Created by Kapil Khatri on 17/04/19.
//  Copyright © 2019 Kapil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    self.rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeHandler:)];
    self.upSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    self.downSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
    
    self.leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    self.upSwipe.direction = UISwipeGestureRecognizerDirectionUp;
    self.downSwipe.direction = UISwipeGestureRecognizerDirectionDown;
                                
    
    [self.view addGestureRecognizer:self.leftSwipe];
    [self.view addGestureRecognizer:self.rightSwipe];
    [self.view addGestureRecognizer:self.upSwipe];
    [self.view addGestureRecognizer:self.downSwipe];
    
    
    self.lable.layer.cornerRadius = 20;
    self.lable.clipsToBounds = YES;
    
    
    timeInt = 20;
    scoreInt = 0;
    modeInt = 0;
    
    self.timeLable.text = [NSString stringWithFormat:@"Time : %i",timeInt];
    self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
    
    
    
}


- (IBAction)startGame:(id)sender
{
    if(timeInt == 20)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        
        self.startGameOutlet.enabled = NO;
        self.startGameOutlet.alpha = 0.5;
        
        [self simonSays];
        
        modeInt = 1;
        
    }
    
    if(timeInt == 0)
    {
        timeInt = 20;
        scoreInt = 0;
        
        self.timeLable.text = [NSString stringWithFormat:@"Time : %i",timeInt];
        self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
        
        [self.startGameOutlet setTitle:@"Start Game" forState:UIControlStateNormal];
        
        self.lable.text = @"Simon Says";
        
    }
}

-(void)updateTimer
{
    timeInt -= 1;
    self.timeLable.text = [NSString stringWithFormat:@"Time : %i",timeInt];
    
    if(timeInt == 0)
    {
        [timer invalidate];
        [simonTimer invalidate];
        
        modeInt = 0;
        
        self.startGameOutlet.enabled = YES;
        self.startGameOutlet.alpha = 1.0;
        [self.startGameOutlet setTitle:@"Restart Game" forState:UIControlStateNormal];
        
        
        
    }
}

-(void)simonSays
{
    NSArray *array = @[@"Swipe Left",
                       @"Swipe Right",
                       @"Swipe Up",
                       @"Swipe Down",
                       @"Up",
                       @"Down",
                       @"Right",
                       @"Left"];
    
    int randomWord = arc4random()% array.count;
    self.lable.text = array[randomWord];
    
    
    simonTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(simonSays) userInfo:nil repeats:NO];
}

-(void)swipeHandler:(UISwipeGestureRecognizer *) sender
    {
        
    if(modeInt == 1)
    {
        if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
        {
            [simonTimer invalidate];
            
            if([self.lable.text isEqualToString:@"Swipe Left"])
            {
                scoreInt += 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
            else
            {
                scoreInt -= 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
        }
        
        if(sender.direction == UISwipeGestureRecognizerDirectionRight)
        {
            [simonTimer invalidate];
            
            if([self.lable.text isEqualToString:@"Swipe Right"])
            {
                scoreInt += 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
            else
            {
                scoreInt -= 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
        }
        
        if(sender.direction == UISwipeGestureRecognizerDirectionUp)
        {
            [simonTimer invalidate];
            
            if([self.lable.text isEqualToString:@"Swipe Up"])
            {
                scoreInt += 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
            else
            {
                scoreInt -= 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
        }
        
        if(sender.direction == UISwipeGestureRecognizerDirectionDown)
        {
            [simonTimer invalidate];
            
            if([self.lable.text isEqualToString:@"Swipe Down"])
            {
                scoreInt += 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
            else
            {
                scoreInt -= 1;
                self.scoreLable.text = [NSString stringWithFormat:@"Score : %i",scoreInt];
                
                [self simonSays];
            }
        }
        
    }
        
    }
@end
