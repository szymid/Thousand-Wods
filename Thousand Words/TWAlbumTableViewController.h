//
//  TWAlbumTableViewController.h
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 11.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TWAlbumTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *albums;

- (IBAction)addAlbumBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
