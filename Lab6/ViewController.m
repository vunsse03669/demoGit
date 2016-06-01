//
//  ViewController.m
//  Lab6
//
//  Created by Mr.Vu on 5/14/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Post.h"
#import "PostCell.h"
#import "CommentViewController.h"
#import "Reachability.h"

#define URL_POST  @"http://jsonplaceholder.typicode.com/posts"

@interface ViewController ()

@property NSMutableArray *arr;
@property NSMutableArray *imageArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArr = [[NSMutableArray alloc]initWithObjects:@"genres-image-underground_rap@3x.png",
    @"genres-image-wedding_music@3x.png",
    @"genres-image-soul@3x.png",
    @"genres-image-house@3x.png",
    @"genres-image-disco@3x.png",
    @"genres-image-opera@3x.png", nil];
    
    _arr = [[NSMutableArray alloc]init];
    [self getPostJson];
    Reachability *reach = [Reachability reachabilityWithHostName:URL_POST];
    reach.reachableOnWWAN = NO;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(reportMessage)
//                                                 name:kReachabilityChangedNotification
//                                               object:nil];
//    [reach startNotifier];
}


-(void) reportMessage {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Internet was disconnected" delegate:nil cancelButtonTitle:@"Cacel" otherButtonTitles: nil];
    [alert show];
    
}

- (void) getPostJson{
    
    NSURL *URL = [NSURL URLWithString:URL_POST];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject){
        
        for (NSDictionary *dict in responseObject) {
            Post *post = [[Post alloc]initWithDictionary:dict];
            [_arr addObject:post];
        }
        self.tbvPost.delegate = self;
        self.tbvPost.dataSource = self;
        self.tbvPost.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.tbvPost reloadData];
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

#pragma mark - tableView

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath; {
    CommentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"CommentViewController"];
    
    NSNumber *postId = [_arr[indexPath.row] mid];
    NSString *url = [NSString stringWithFormat:@"http://jsonplaceholder.typicode.com/comments?postId=%@",postId];
    vc.url = url;
    vc.pId = postId;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil){
        cell = [[PostCell alloc]initPostCell];
    }
    
    cell.lblId.text = [NSString stringWithFormat:@"#%@", [_arr[indexPath.row] mid]];
    cell.lblTitle.text = [NSString stringWithFormat:@"%@", [_arr[indexPath.row] title]];
    cell.lblBody.text = [NSString stringWithFormat:@"%@", [_arr[indexPath.row] body]];
    
    return cell;
}

#pragma mark - collection view

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return _imageArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ColCell" forIndexPath:indexPath];
    UIImageView *imvIcon = [cell.contentView viewWithTag:1];
    imvIcon.layer.cornerRadius = 13.0f;
    imvIcon.clipsToBounds = YES;
    imvIcon.layer.borderColor = [UIColor whiteColor].CGColor;
    imvIcon.layer.borderWidth = 2.0f;
    imvIcon.image = [UIImage imageNamed:_imageArr[indexPath.row]];
    
    return cell;
}


@end
