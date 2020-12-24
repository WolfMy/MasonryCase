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

@property (nonatomic, weak) IBOutlet UITableView *autoHeightTableView;
@property (nonatomic, strong) Case4DataSource *datasource;

@end

@implementation Case4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _datasource = [[Case4DataSource alloc] init];
    
    // 注册Cell
    [_autoHeightTableView registerClass:[Case4Cell class] forCellReuseIdentifier:NSStringFromClass([Case4Cell class])];
    // 让Cell里的内容决定每个Cell的高度
    _autoHeightTableView.rowHeight = UITableViewAutomaticDimension;
    _autoHeightTableView.estimatedRowHeight = 50;
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
