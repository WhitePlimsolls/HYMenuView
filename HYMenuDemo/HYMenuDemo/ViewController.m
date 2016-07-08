//
//  ViewController.m
//  HYMenuDemo
//
//  Created by GZCP1897 on 16/7/8.
//  Copyright © 2016年 GZCP1897. All rights reserved.
//

#import "ViewController.h"
#import "HYMenu.h"


static NSString * const ID = @"cellID";
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, weak)HYMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HYMenu *menu = [HYMenu sharePopMenu];
    
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:touch.view];
    
    self.menu = menu;
    self.menu.triangleOrigin = point;
    self.menu.triangleHeight = 50;
    self.menu.triangleColor = [UIColor redColor];
    self.menu.tabEdgeLeft = 100;
    menu.tabWidth = 200;
    menu.tabHeight = 400;
    
    //设置tab代理和数据源
    menu.tab.delegate = self;
    menu.tab.dataSource = self;

    //可以自定义cell
    [menu.tab registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    [menu show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
    [self.menu dimiss];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
