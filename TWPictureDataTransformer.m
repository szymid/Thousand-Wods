//
//  TWPictureDataTransformer.m
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 14.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import "TWPictureDataTransformer.h"
#import <UIKit/UIKit.h>

@implementation TWPictureDataTransformer

+(Class)transformedValueClass
{
    return [NSData class];
}

+(BOOL)allowsReverseTransformation
{
    return YES;
}

-(id)transformedValue:(id)value
{
    return UIImagePNGRepresentation(value);
}

-(id)reverseTransformedValue:(id)value
{
    UIImage *image = [UIImage imageWithData:value];
    return image;
}
@end
