//
//  CommentViewController.h
//  Lab6
//
//  Created by Mr.Vu on 5/15/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"

@interface CommentViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbvCommet;
@property NSString *url;
@property NSMutableArray *comments;
@property NSNumber *pId;
@property NSArray *arr;

@end
