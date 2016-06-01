//
//  Comment.h
//  Lab6
//
//  Created by Mr.Vu on 5/15/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property NSNumber *postId;
@property NSNumber *cid;
@property NSString *name;
@property NSString *email;
@property NSString *body;

- (id) initCommentWithJson:(NSDictionary *)dict;

@end
