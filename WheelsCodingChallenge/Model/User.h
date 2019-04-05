//
//  User.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Badge.h"
#import "NSNumber+Ext.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) NSNumber *reputation;
@property (strong, nonatomic) Badge *badge;

- (id)initWithData:(NSString*) name
            urlString:(NSString*) urlString
            reputation:(NSNumber*) reputation
            badge:(Badge*) badge;

@end

NS_ASSUME_NONNULL_END
