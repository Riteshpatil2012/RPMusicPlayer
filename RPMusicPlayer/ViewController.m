//
//  ViewController.m
//  RPMusicPlayer
//
//  Created by Ritesh on 04/11/16.
//  Copyright © 2016 riteshpatil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isPlaying = false;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)initializeAudioPlayer {
    
    BOOL status = false;
    NSURL *musicURL = [[NSBundle mainBundle]URLForResource:@"bolo" withExtension:@"mp3"];
    if (musicURL != nil) {
        NSError *error;
        audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:&error];
        
        if (error != nil) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            status = true;
        }
    }
    
    return status;
}


- (IBAction)PlayPauseButton:(id)sender {
    
    UIButton *button = sender;
    
    if ([button.titleLabel.text isEqualToString:@"Play"]) {
        //start playing and rename button title to pause
        
        if (isPlaying) {
            [audioPlayer play];
        }
        else {
            if ([self initializeAudioPlayer]) {
                [audioPlayer play];
                isPlaying = true;
            }
            else {
                NSLog(@"Something went wrong while initializing audio player.");
            }
        }
        
        [button setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else if ([button.titleLabel.text isEqualToString:@"Pause"]) {
        //start playing and rename button title to pause
        [audioPlayer pause];
        [button setTitle:@"Play" forState:UIControlStateNormal];
        
    }
    

}

- (IBAction)StopButton:(id)sender {
    [audioPlayer stop];
   isPlaying = false;
    
    [self.playbutton setTitle:@"Play" forState:UIControlStateNormal];
}
@end
