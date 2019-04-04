//
//  AddUserVC.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListVC.h"
#import "AddUserCell.h"
#import "TextFieldItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddUserVC : UIViewController <UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *items;
@property (weak, nonatomic) id<ListVCDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
