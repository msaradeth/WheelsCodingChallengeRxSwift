//
//  StackApiService.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackApiService : NSObject

+(void) loadData:(void (^)(NSMutableArray*))completion;

@end





NS_ASSUME_NONNULL_END


