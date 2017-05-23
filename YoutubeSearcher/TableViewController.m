//
//  TableViewController.m
//  YoutubeSearcher
//
//  Created by Admin on 21.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "TableViewController.h"
#import "SearchResultModel.h"
#import "Song.h"

@interface TableViewController () <UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;
@property(strong,nonatomic) SearchResultModel *model;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar=[UISearchBar new];
    self.searchBar.placeholder=@"Поиск песни";
    self.tableView.tableHeaderView=self.searchBar;
    self.searchBar.delegate=self;
    [self.searchBar becomeFirstResponder];
    [self.tableView setContentInset:UIEdgeInsetsMake(30,0 ,0,0)];
    [self.searchBar sizeToFit];
    
    self.model=[SearchResultModel new];  
    
}

#pragma mark - Search Bar Delegate

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *request=searchBar.text;
    if (request)
    {
        __weak typeof (self) weakself=self;
        [self.model getSongs:request  withCompletionHandler:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakself.tableView reloadData];
            });
        }];

        
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    Song *song=self.model.songs[indexPath.row];
    cell.textLabel.text =[NSString stringWithFormat:@"%@ - %@",song.artist,song.name];
    return cell;
}


@end
