//
//  Photo+CoreDataProperties.h
//  Thousand Words
//
//  Created by Boguslaw Dawidow on 14.11.2015.
//  Copyright © 2015 Szymon Dawidow. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Photo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Photo (CoreDataProperties)

@property (nullable, nonatomic, retain) id image;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) Album *albumBook;

@end

NS_ASSUME_NONNULL_END
