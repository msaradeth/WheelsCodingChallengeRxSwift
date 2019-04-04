//
//  AddUserVC.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "AddUserVC.h"

@interface AddUserVC ()
@end

@implementation AddUserVC
@synthesize tableView;
@synthesize items;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVC];
    [self loadData];
}


#pragma mark - setup VC
- (void)setupVC {
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"AddUserCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}


#pragma mark - Add New User
- (IBAction)addUserAction:(id)sender {
    User *user = [self getUser];
    [self.delegate addNewUser:user];
    [self.navigationController popViewControllerAnimated:true];
}
- (NSNumber*) getItem:(int)index {
    TextFieldItem *item = items[index];
    NSNumber *number = @([item.text intValue]);
    return  number;
}



#pragma mark - UITableViewDataSource, UITextFieldDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    AddUserCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textField.delegate = self;
    [cell configure: items[indexPath.row] row:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    ((TextFieldItem*)items[textField.tag]).text = textField.text;
}


#pragma mark - Helper methods
- (User*)getUser {
    Badge *badge = [[Badge alloc] initWithData:[self getItem:2]
                                        silver:[self getItem:3]
                                        bronze:[self getItem:4]];
    User *user = [[User alloc] initWithData:((TextFieldItem*)items[0]).text
                                  urlString:@"personPlaceholder"
                                 reputation:[self getItem:1]
                                      badge:badge];
    return user;
}

- (void) loadData {
    items = [[NSMutableArray alloc] init];
    [items addObject:[[TextFieldItem alloc] initWithData:@"" placeHolder:@"Enter name" keyboardType:UIKeyboardTypeNamePhonePad] ];
    [items addObject:[[TextFieldItem alloc] initWithData:@"" placeHolder:@"Enter reputation" keyboardType:UIKeyboardTypeNumberPad] ];
    [items addObject:[[TextFieldItem alloc] initWithData:@"" placeHolder:@"Enter gold badge" keyboardType:UIKeyboardTypeNumberPad] ];
    [items addObject:[[TextFieldItem alloc] initWithData:@"" placeHolder:@"Enter silver badge" keyboardType:UIKeyboardTypeNumberPad] ];
    [items addObject:[[TextFieldItem alloc] initWithData:@"" placeHolder:@"Enter bronze badge" keyboardType:UIKeyboardTypeNumberPad] ];
}

@end
