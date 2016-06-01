//
//  CommentDB+CoreDataProperties.h
//  Lab6
//
//  Created by Mr.Vu on 5/17/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CommentDB.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentDB (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *postId;
@property (nullable, nonatomic, retain) NSNumber *cid;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *body;

@end

NS_ASSUME_NONNULL_END
