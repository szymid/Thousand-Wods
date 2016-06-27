//
//  TWPhotoDetailViewController.m
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 22.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import "TWPhotoDetailViewController.h"
#import "Photo.h"
#import "TWFiltersCollectionCollectionViewController.h";

@interface TWPhotoDetailViewController ()

@end

@implementation TWPhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.imageView.image = self.photo.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Filter Segue"])
        NSLog(@"Filter Segue");
    {
        if ([segue.destinationViewController isKindOfClass:[TWFiltersCollectionCollectionViewController class]])
        {
            TWFiltersCollectionCollectionViewController *targetVC = segue.destinationViewController;
            targetVC.photo = self.photo;
            
        }
    }
    NSLog(@"\nAfter Segue");
}


- (IBAction)addFilterButtonPressed:(UIButton *)sender
{
    NSLog(@"addFilterButtonPressed");
}

- (IBAction)deleteButtonPressed:(UIButton *)sender
{
    [[self.photo managedObjectContext] deleteObject:self.photo];
    
    NSError *error = nil;
    [[self.photo managedObjectContext] save:&error];
    
    if (error)
    {
        NSLog(@"error");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
