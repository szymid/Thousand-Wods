//
//  TWCoreDataHelper.m
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 13.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import "TWCoreDataHelper.h"
#import <UIKit/UIKit.h>

@implementation TWCoreDataHelper

+ (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    
    return context;
}

@end
