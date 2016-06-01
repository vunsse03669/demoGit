//
//  Post.h
//  Lab6
//
//  Created by Mr.Vu on 5/14/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property NSNumber *userId;
@property NSNumber *mid;
@property NSString *title;
@property NSString *body;

- (id)initWithDictionary : (NSDictionary *)dict;

@end
