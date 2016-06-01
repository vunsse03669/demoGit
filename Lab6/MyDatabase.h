//
//  MyDatabase.h
//  Lab6
//
//  Created by Mr.Vu on 5/17/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comment.h"

@interface MyDatabase : NSObject

+ (NSArray *)getCommentByPostId:(NSNumber *)pId;
+ (NSArray *)getALLComment;
+ (BOOL)insertCommentToDatabase:(Comment *)com;

@end
