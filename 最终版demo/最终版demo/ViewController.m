//
//  ViewController.m
//  最终版demo
//
//  Created by GZCP1897 on 16/6/3.
//  Copyright © 2016年 GZCP1897. All rights reserved.
//

#import "ViewController.h"
#import "HYMenu.h"
#import "HYCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, weak)HYMenu *menu;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    HYMenu *menu = [HYMenu sharePopMenu];
    self.menu = menu;
    menu.triangleColor = [UIColor redColor];
    menu.triangleOrigin = CGPointMake(100, 100);
    menu.tabDatasource = self;
    menu.tabDelegate = self;
    [menu.tab registerClass:[HYCell class] forCellReuseIdentifier:@"lhy"];
    
    menu.tabVBackgroundColor = [UIColor redColor];
    [menu show];
}


#pragma mark - djkslajfkldsjalfkd
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"fdsafdsafds";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.menu dimiss];
}


@end
