//
//  TextFieldItem.h
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldItem: NSObject

@property (strong, nonatomic) NSString* text;
@property (strong, nonatomic) NSString* placeHolder;
@property UIKeyboardType keyboardType;

+ (NSMutableArray*) loadData;

- (id)initWithData:(NSString*) text
       placeHolder:(NSString*) placeHolder
      keyboardType:(UIKeyboardType) keyboardType;

@end

NS_ASSUME_NONNULL_END
