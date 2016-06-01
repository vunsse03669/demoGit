//
//  CommentCell.h
//  Lab6
//
//  Created by Mr.Vu on 5/15/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import <UIKit/UIKit.h>

    @interface CommentCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UILabel *lblName;
    @property (weak, nonatomic) IBOutlet UILabel *lblPost;

    - (id)initCommentCell;

@end
