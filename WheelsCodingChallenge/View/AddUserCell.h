//
//  AddUserCell.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddUserCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (void)configure:(TextFieldItem*)item row:(NSInteger)row;

@end

NS_ASSUME_NONNULL_END
