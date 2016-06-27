//
//  TWPhotosCollectionViewController.h
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 13.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"
#import "Album+CoreDataProperties.h"
#import "TWFiltersCollectionCollectionViewController.h"

@interface TWPhotosCollectionViewController : UICollectionViewController

@property (strong,nonatomic) Album *album;

- (IBAction)cameraButtonBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
