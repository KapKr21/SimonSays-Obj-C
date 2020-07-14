//
//  ViewController.h
//  SimonSays
//
//  Created by Kapil Khatri on 17/04/19.
//  Copyright © 2019 Kapil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer;
    NSTimer *simonTimer;
    
    int timeInt;
    int scoreInt;
    int modeInt;
}

@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet UIButton *startGameOutlet;

@property (nonatomic,strong) UISwipeGestureRecognizer *leftSwipe;
@property (nonatomic,strong) UISwipeGestureRecognizer *rightSwipe;
@property (nonatomic,strong) UISwipeGestureRecognizer *upSwipe;
@property (nonatomic,strong) UISwipeGestureRecognizer *downSwipe;

- (IBAction)startGame:(id)sender;


@end

