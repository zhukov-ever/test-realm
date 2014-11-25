//
//  TableViewController.m
//  test-realm
//
//  Created by Nikita on 21/11/14.
//  Copyright (c) 2014 Zhn. All rights reserved.
//

#import "TableViewController.h"
#import "CatsManager.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - handlers

- (IBAction)addCatHandler:(id)sender
{
    [[CatsManager shared] addRandomCat];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[[CatsManager shared].catsSet count]-1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    
}

- (IBAction)closeAppHandler:(id)sender
{
    //never use "exit(0);" in production!
    exit(0);
}



#pragma mark - UITableViewControllerdDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[CatsManager shared].catsSet count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatCell"
                                                            forIndexPath:indexPath];
    
    Cat* _cat = [[CatsManager shared].catsSet objectAtIndex:indexPath.row];
    cell.textLabel.text = _cat.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", _cat.strangeProperty];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [[CatsManager shared] removeCatAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Cat* _cat = [[CatsManager shared].catsSet objectAtIndex:indexPath.row];
    [[CatsManager shared] changeCatRandomly:_cat];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end
