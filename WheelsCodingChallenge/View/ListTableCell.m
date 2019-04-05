//
//  ListTableCell.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "ListTableCell.h"
#import "WheelsCodingChallenge-Swift.h"
#import "UILabel+Ext.h"

@implementation ListTableCell


- (void)configure:(User*)item {
    self.name.text = item.name;
    self.reputation.text = [item.reputation formatWithCommas];
    self.goldBadge.text = item.badge.gold.stringValue;
    self.silverBadge.text = item.badge.silver.stringValue;
    self.bronzeBadge.text = item.badge.bronze.stringValue;

    if ([ImageCache.shared getWithId:item.urlString] != nil) {
        //Get image from cache
        self.gravator.image = [ImageCache.shared getWithId:item.urlString];
    } else {
        
        //Get, cache, and display image
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData *data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: item.urlString]];
            if ( data == nil ) return;
            UIImage *image = [UIImage imageWithData:data];
            [ImageCache.shared setWithId:item.urlString image:image];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.gravator.image = image;
            });
        });
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.goldCircle roundedDot];
    [self.silverCircle roundedDot];
    [self.bronzeCircle roundedDot];
}



@end
