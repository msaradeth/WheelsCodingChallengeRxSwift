//
//  User.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithData:(NSString*) name
         urlString:(NSString*) urlString
        reputation:(NSNumber*) reputation
             badge:(Badge*) badge
{
    if (self = [super init]) {
        self.name = name;
        self.urlString = urlString;
        self.reputation = reputation;
        self.badge = badge;
    }
    return self;
}

@end
