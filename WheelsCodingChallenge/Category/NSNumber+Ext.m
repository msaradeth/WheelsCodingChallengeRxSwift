//
//  NSNumber+Ext.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "NSNumber+Ext.h"

@implementation NSNumber (Ext)

- (NSString*)formatWithCommas {
    NSNumberFormatter * formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *numberWithCommas =  [formatter stringFromNumber:self];
    return numberWithCommas;
}

@end
