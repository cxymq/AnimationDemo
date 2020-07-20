//
//  ViewController.m
//  AnimationTest
//
//  Created by nazimai on 2020/7/20.
//  Copyright © 2020 nazimai. All rights reserved.
//

#import "ViewController.h"
#import "ShapeViewController.h"
#import "TextViewController.h"
#import "TransformViewController.h"
#import "GradientViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView];

    _datas = @[[ShapeViewController new],
               [TextViewController new],
               [TransformViewController new],
               [GradientViewController new]
    ];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UIViewController *vc = _datas[indexPath.row];
    cell.textLabel.text = NSStringFromClass(vc.class);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:_datas[indexPath.row] animated:YES];
}

@end
