//
//  TWCoreDataHelper.h
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 13.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"
#import "Album+CoreDataProperties.h"

@interface TWCoreDataHelper : NSObject


+ (NSManagedObjectContext *)managedObjectContext;

@end
