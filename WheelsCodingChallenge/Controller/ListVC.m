//
//  ListVC.m
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/4/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

#import "ListVC.h"
#import "ListTableCell.h"
#import "AddUserVC.h"

@interface ListVC ()

@end

@implementation ListVC
@synthesize tableView;
@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupVC];
    
    #pragma mark - Load data from server
    [StackApiService loadData:^(NSMutableArray *items) {
        self.items = items;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - Setup VC
- (void)setupVC {
    self.navigationController.navigationBar.prefersLargeTitles = true;
    items = [[NSMutableArray alloc] init];
    tableView.dataSource = self;
    [tableView registerNib:[UINib nibWithNibName:@"ListTableCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}


#pragma mark - Add new user button action
- (IBAction)addButtonAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StackUserList" bundle:nil];
    AddUserVC *vc = [storyboard instantiateViewControllerWithIdentifier:@"AddUserVC"];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:true];
}


#pragma mark - addNewUser - ListVCDelegate
- (void)addNewUser:(nonnull User *)user {
    [self.items addObject:user];
    [self.tableView reloadData];
}



#pragma mark - UITableViewDataSource, UITextFieldDelegate
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ListTableCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell configure:items[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}


@end
