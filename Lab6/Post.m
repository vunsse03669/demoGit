//
//  Post.m
//  Lab6
//
//  Created by Mr.Vu on 5/14/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import "Post.h"

@implementation Post

- (id)initWithDictionary : (NSDictionary *)dict; {
    self = [super init];
    if(self) {
        self.userId = dict[@"userId"];
        self.mid = dict[@"id"];
        self.title = dict[@"title"];
        self.body = dict[@"body"];
    }
    
    return self;
}


@end
