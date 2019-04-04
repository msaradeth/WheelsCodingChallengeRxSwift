//
//  ListTableCell.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *gravator;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *reputation;
@property (weak, nonatomic) IBOutlet UILabel *goldCircle;
@property (weak, nonatomic) IBOutlet UILabel *goldBadge;
@property (weak, nonatomic) IBOutlet UILabel *silverCircle;
@property (weak, nonatomic) IBOutlet UILabel *silverBadge;
@property (weak, nonatomic) IBOutlet UILabel *bronzeCircle;
@property (weak, nonatomic) IBOutlet UILabel *bronzeBadge;


- (void)configure:(User*)item;

@end

NS_ASSUME_NONNULL_END
