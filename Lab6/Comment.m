//
//  Comment.m
//  Lab6
//
//  Created by Mr.Vu on 5/15/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import "Comment.h"

@implementation Comment

- (id) initCommentWithJson:(NSDictionary *)dict;{
    self = [super init];
    if(self) {
        self.postId = dict[@"postId"];
        self.cid = dict[@"id"];
        self.name = dict[@"name"];
        self.email = dict[@"email"];
        self.body = dict[@"body"];
    }
    
    return self;
}

@end
