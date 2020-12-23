//
//  Case4ViewController.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/23.
//

#import "Case4ViewController.h"
#import "Case4Cell.h"
#import "Case4DataSource.h"

@interface Case4ViewController ()

@property (nonatomic, strong) Case4DataSource *datasource;

@end

@implementation Case4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _datasource = [[Case4DataSource alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"%ld", (long)[_datasource numberOfDataEntity]);
    return [_datasource numberOfDataEntity];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Case4Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case4Cell class]) forIndexPath:indexPath];
    cell.dataEntity = [_datasource dataEntityAt:indexPath];
//    NSLog(@"%@", cell.dataEntity);
    return cell;
}

@end
