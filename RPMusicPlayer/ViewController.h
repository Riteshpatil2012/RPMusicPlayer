//
//  ViewController.h
//  RPMusicPlayer
//
//  Created by Ritesh on 04/11/16.
//  Copyright © 2016 riteshpatil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    BOOL isPlaying;
}

- (IBAction)PlayPauseButton:(id)sender;
- (IBAction)StopButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *playbutton;

@end

