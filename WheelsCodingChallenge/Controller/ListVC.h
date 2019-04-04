//
//  ListVC.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackApiService.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ListVCDelegate <NSObject>
@required
-(void) addNewUser:(User*)user;
@end

@interface ListVC : UIViewController <UITableViewDataSource, ListVCDelegate> {
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *items;

@end

NS_ASSUME_NONNULL_END
