//
//  Badge.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "Badge.h"

@implementation Badge

- (id)initWithData:(NSNumber*) gold
            silver:(NSNumber*) silver
            bronze:(NSNumber*) bronze
{
    if (self = [super init]) {
        self.gold = gold;
        self.silver = silver;
        self.bronze = bronze;
    }
    return self;
}

@end
