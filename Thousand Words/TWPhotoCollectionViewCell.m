//
//  TWPhotoCollectionViewCell.m
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 13.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import "TWPhotoCollectionViewCell.h"
#define IMAGEVIEW_BORDER_LENGTH 5

@implementation TWPhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setup];
        
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if(self)
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    [self.contentView addSubview:self.imageView];
    }

@end
