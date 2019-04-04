//
//  Badge.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Badge : NSObject

@property (strong, nonatomic) NSNumber *gold;
@property (strong, nonatomic) NSNumber *silver;
@property (strong, nonatomic) NSNumber *bronze;

- (id)initWithData:(NSNumber*) gold
            silver:(NSNumber*) silver
            bronze:(NSNumber*) bronze;

@end

NS_ASSUME_NONNULL_END
