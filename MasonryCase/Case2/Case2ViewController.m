//
//  Case2ViewController.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/22.
//

#import "Case2ViewController.h"
#import "Masonry.h"

static const CGFloat IMAGE_SIZE = 64;

@interface Case2ViewController ()

@property (nonatomic, strong) UIView *containerView;            // 放置imageView的容器
@property (nonatomic, strong) NSArray *imageNames;              // image名字的数组
@property (nonatomic, strong) NSMutableArray *imageViews;       // 存储imageView的数组
@property (nonatomic, strong) NSMutableArray *widthConstraints; // 存储宽度约束对象的数组

@end

@implementation Case2ViewController

#pragma mark - Actions
- (IBAction)showOrHide:(UISwitch *)sender {
    NSUInteger index = (NSUInteger) sender.tag;
    MASConstraint *width = _widthConstraints[index];
    
    if (sender.on) {
        width.equalTo(@(IMAGE_SIZE));
    } else {
        width.equalTo(@(0));
    }
}


#pragma mark - Private Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageNames = @[@"bluefaces_1", @"bluefaces_2", @"bluefaces_3", @"bluefaces_4"];
    _widthConstraints = [NSMutableArray new];
    _imageViews = [NSMutableArray new];
    
    [self initContainerView];
    [self initViews];
}

- (void)initContainerView {
    _containerView = [UIView new];
    [self.view addSubview:_containerView];
    
    _containerView.backgroundColor = [UIColor grayColor];
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(IMAGE_SIZE));
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(200);
    }];
}

- (void)initViews {
    // 循环创建、添加imageView
    for (NSUInteger i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageNames[i]]];
        [_imageViews addObject:imageView];
        [_containerView addSubview:imageView];
    }
    
    CGSize imageViewSize = CGSizeMake(IMAGE_SIZE, IMAGE_SIZE);
    
    // 用于表示是否存在lastView的标志
    __block UIView *lastView = nil;
    // 宽度约束对象
    __block MASConstraint *widthConstraint = nil;
    NSUInteger arrayCount = _imageViews.count;
    // imageViews数组枚举元素，设置约束
    [_imageViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            widthConstraint = make.width.equalTo(@(imageViewSize.width));
            make.height.equalTo(@(imageViewSize.height));
            // 左边约束
            make.left.equalTo(lastView ? lastView.mas_right : view.superview.mas_left);
            
            make.centerY.equalTo(view.superview.mas_centerY);
            // 设置最右边的imageView的右边与父view的右边对齐
            if (idx == arrayCount - 1) {
                make.right.equalTo(view.superview.mas_right);
            }
            
            [_widthConstraints addObject:widthConstraint];
            lastView = view;
        }];
    }];
}

@end
