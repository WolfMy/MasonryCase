//
//  Case3ViewController.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/22.
//

#import "Case3ViewController.h"
#import "Masonry.h"

@interface Case3ViewController ()

@property (nonatomic, weak) IBOutlet UIView *superView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *superViewWidthConstraint;
@property (nonatomic, strong) UIView *childView;
@property (nonatomic, assign) CGFloat maxWidth;

@end

@implementation Case3ViewController

#pragma mark - Actions

- (IBAction)modifyContainerViewWidth:(UISlider *)sender {
    if (sender.value) {
        _superViewWidthConstraint.constant = sender.value * _maxWidth;
    }
}

#pragma mark - Private Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initViews];
    
    _maxWidth = _superViewWidthConstraint.constant;
}

- (void)initViews {
    _childView = [UIView new];
    _childView.backgroundColor = [UIColor redColor];
    
    [_superView addSubview:_childView];
    
    
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
