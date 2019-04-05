//
//  UILabel+Ext.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "UILabel+Ext.h"

@implementation UILabel (Ext)

- (void)roundedDot {
    self.layer.cornerRadius = self.bounds.size.height / 2;
    self.layer.masksToBounds = true;
}

@end
