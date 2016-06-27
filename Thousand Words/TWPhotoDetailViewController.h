//
//  TWPhotoDetailViewController.h
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 22.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface TWPhotoDetailViewController : UIViewController

@property (strong,nonatomic) Photo *photo;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)addFilterButtonPressed:(UIButton *)sender;
- (IBAction)deleteButtonPressed:(UIButton *)sender;


@end
