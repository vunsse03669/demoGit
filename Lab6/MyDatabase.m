//
//  MyDatabase.m
//  Lab6
//
//  Created by Mr.Vu on 5/17/16.
//  Copyright © 2016 Mr.Vu. All rights reserved.
//

#import "MyDatabase.h"
#import "CommentDB.h"
#import "CommentDB+CoreDataProperties.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation MyDatabase

+ (NSArray *)getCommentByPostId:(NSNumber *)pId; {
    
    NSManagedObjectContext *moc = APPDELEGATE.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"CommentDB"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"postId == %@",pId ]];
    
    NSError *error = nil;
    NSArray *result = [moc executeFetchRequest:request error:&error];
    if(!result) {
        NSLog(@": %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return result;
}

+ (NSArray *)getALLComment; {
    NSManagedObjectContext *moc = APPDELEGATE.managedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"CommentDB"];
    
    NSError *error = nil;
    NSArray *result = [moc executeFetchRequest:request error:&error];
    if(!result) {
        NSLog(@": %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return result;

}

+ (BOOL)insertCommentToDatabase:(Comment *)com {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([CommentDB class])
                                                         inManagedObjectContext:APPDELEGATE.managedObjectContext];
    CommentDB *comment = [[CommentDB alloc] initWithEntity:entityDescription insertIntoManagedObjectContext:APPDELEGATE.managedObjectContext];
    [comment setPostId:com.postId];
    [comment setCid:com.cid];
    [comment setName:com.name];
    [comment setEmail:com.email];
    [comment setBody :com.body];
    NSError *errorr = nil;
    return [comment.managedObjectContext save:&errorr];
}

@end
