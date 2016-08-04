//
//  ViewController.m
//  AutoTableViewCellHeightDemo
//
//  Created by leijin on 16/8/4.
//  Copyright © 2016年 xel. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+XEL_AutoHeightCell.h"
#import "TableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
    NSLog(@"%@", tableView.cacheHeightDictionary);
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    
    cell.bottomOffset = 10;
    if (indexPath.row == 0) {
        cell.showDebug = YES;
        [cell setTitle:@"关联是指把两个对象相互关联起来，使得其中的一个对象作为另外一个对象的一部分。关联是指把两个对象相互"];
        
    } else {
        [cell setTitle:@"aaa"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TableViewCell autoHeightAtIndexPath:indexPath tableView:tableView];
    //return 44;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", tableView.cacheHeightDictionary);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
