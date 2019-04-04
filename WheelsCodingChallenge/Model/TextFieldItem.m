//
//  TextFieldItem.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "TextFieldItem.h"

@implementation TextFieldItem

- (id)initWithData:(NSString*) text
       placeHolder:(NSString*) placeHolder
      keyboardType:(UIKeyboardType) keyboardType
{
    if (self = [super init]) {
        self.text = text;
        self.placeHolder = placeHolder;
        self.keyboardType = keyboardType;
    }
    return self;
}

@end
