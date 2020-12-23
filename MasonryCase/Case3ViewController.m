//
//  Case3ViewController.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/22.
//

#import "Case3ViewController.h"
#import "Masonry.h"

@interface Case3ViewController ()

@property (nonatomic, strong) UIView *superView;
@property (nonatomic, strong) MASConstraint *superViewWidthConstraint;
@property (nonatomic, strong) UIView *childView;
@property (nonatomic, assign) CGFloat maxWidth;

@end

@implementation Case3ViewController

#pragma mark - Actions

- (IBAction)modifyContainerViewWidth:(UISlider *)sender {
    if (sender.value) {
        CGFloat newWidth = _maxWidth * sender.value;
        
        // References
        _superViewWidthConstraint.equalTo(@(newWidth));
        
        // mas_updateConstraints
        [_superView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(newWidth));
        }];
    }
}

#pragma mark - Private Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _maxWidth = self.view.frame.size.width - 32;

    [self initViews];
}

- (void)initViews {
    _superView = [UIView new];
    _superView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:_superView];
    
    _childView = [UIView new];
    _childView.backgroundColor = [UIColor redColor];
    
    [_superView addSubview:_childView];
    
    [_superView mas_makeConstraints:^(MASConstraintMaker *make) {
        _superViewWidthConstraint =  make.width.equalTo(@(_maxWidth));
        
        make.height.equalTo(@(50));
        make.top.equalTo(self.view.mas_top).with.offset(200);
        make.left.equalTo(self.view.mas_left).with.offset(16);
    }];
    
    [_childView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(_childView.superview.mas_height);
        make.left.equalTo(_childView.superview.mas_left);
        make.centerY.equalTo(_childView.superview.mas_centerY);
        
        make.width.equalTo(_childView.superview.mas_width).multipliedBy(0.5);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
