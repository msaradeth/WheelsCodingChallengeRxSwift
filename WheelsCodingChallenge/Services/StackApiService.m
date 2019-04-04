//
//  StackApiService.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "StackApiService.h"
#import "User.h"
#import "Badge.h"

@implementation StackApiService


+(void) loadData:(void (^)(NSMutableArray*))completion {
    NSMutableArray *users = [[NSMutableArray alloc] init];

    NSString *urlString = @"https://api.stackexchange.com/2.2/users?site=stackoverflow&page=1&sort=reputation&order=desc";
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;        
        if(httpResponse.statusCode == 200) { //Success
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSMutableArray *items = [json objectForKey:@"items"];
            
            for (NSDictionary *item in items) {
                User *user = [[User alloc] init];
                //Parse User
                user.name = [item objectForKey:@"display_name"];
                user.urlString = [item objectForKey:@"profile_image"];
                user.reputation = [item objectForKey:@"reputation"];
                
                //Parse Badge Count
                NSDictionary *badgeCounts = [item objectForKey:@"badge_counts"];
                user.badge = [[Badge alloc] initWithData:[badgeCounts objectForKey:@"gold"]
                                                    silver:[badgeCounts objectForKey:@"silver"]
                                                    bronze:[badgeCounts objectForKey:@"bronze"]];
                [users addObject:user];
            }
            completion(users);
            
        }else {
            NSLog(@"Handle Error");
            completion(users);
        }
    }];
    
    [dataTask resume];
}

@end
