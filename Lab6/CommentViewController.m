//
//  CommentViewController.m
//  Lab6
//
//  Created by Mr.Vu on 5/15/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import "CommentViewController.h"
#import "AFNetworking.h"
#import "Comment.h"
#import "CommentCell.h"
#import "MyDatabase.h"
#import "CommentDB+CoreDataProperties.h"
#import "CommentDB.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"


@implementation CommentViewController

-(void)viewDidLoad {
    NSLog(@"%@",_url);
    _comments = [[NSMutableArray alloc]init];
    _arr = [NSArray array];
    
    [self getPostJson];
    
}

- (void) getPostJson{
    self.tbvCommet.separatorStyle = UITableViewCellSeparatorStyleNone;
    _arr = [MyDatabase getCommentByPostId:_pId];
    if(_arr.count > 0) {
        NSLog(@"commnet has been exists");
        self.tbvCommet.delegate = self;
        self.tbvCommet.dataSource = self;
        [_tbvCommet reloadData];
    }else {
        
        Reachability *reach = [Reachability reachabilityWithHostName:_url];
        reach.reachableOnWWAN = NO;
        
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(reportMessage)
//                                                     name:kReachabilityChangedNotification
//                                                   object:nil];
//        [reach startNotifier];

        
        NSURL *URL = [NSURL URLWithString:_url];
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject){
            
            for (NSDictionary *dict in responseObject) {
                Comment *post = [[Comment alloc]initCommentWithJson:dict];
                [_comments addObject:post];
                [MyDatabase insertCommentToDatabase:post];
            }
            self.tbvCommet.delegate = self;
            self.tbvCommet.dataSource = self;
            [self.tbvCommet reloadData];
            
        } failure:^(NSURLSessionDataTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];

    }
}

-(void) reportMessage {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Internet has connected" delegate:nil cancelButtonTitle:@"Cacel" otherButtonTitles: nil];
    [alert show];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if(_arr.count > 0) {
        return _arr.count;
    }
    
    return _comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if(cell == nil) {
        cell = [[CommentCell alloc]initCommentCell];
    } 
    

    if(_arr.count > 0) {
        cell.lblName.text = [NSString stringWithFormat:@"%@",[_arr[indexPath.row] name]];
        cell.lblPost.text = [_arr[indexPath.row] body];
    }else {
        cell.lblName.text = [NSString stringWithFormat:@"%@",[_comments[indexPath.row] name]];
        cell.lblPost.text = [_comments[indexPath.row] body];
    }
    
    
    
    return cell;
}


@end
