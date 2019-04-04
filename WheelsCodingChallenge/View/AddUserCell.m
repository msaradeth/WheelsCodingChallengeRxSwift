//
//  AddUserCell.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "AddUserCell.h"

@implementation AddUserCell
@synthesize textField;


- (void)configure:(TextFieldItem*)item row:(NSInteger)row {
    textField.text = item.text;
    textField.placeholder = item.placeHolder;
    textField.keyboardType = item.keyboardType;
    textField.tag = row;
}

@end
