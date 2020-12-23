//
//  ViewControllerCase1.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/22.
//

#import "Case1ViewController.h"
#import "Masonry.h"

@interface Case1ViewController ()

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, weak) IBOutlet UIView *contentView;

@end

@implementation Case1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}

# pragma mark - Actions

- (IBAction)addLabelContent:(UIStepper *)sender {
    
    switch (sender.tag) {
        case 0:
            _label1.text = [self getLabelContentWithCount:sender.value];
            break;
            
        case 1:
            _label2.text = [self getLabelContentWithCount:sender.value];
            break;
            
        default:
            break;
    }
}

# pragma mark - Private methods

- (void)initViews {
    _label1 = [[UILabel alloc] init];
    _label1.backgroundColor = [UIColor yellowColor];
    _label1.text = @"label,";

    _label2 = [[UILabel alloc] init];
    _label2.backgroundColor = [UIColor greenColor];
    _label2.text = @"label,";

    [_contentView addSubview:_label1];
    [_contentView addSubview:_label2];

    __weak typeof(self) weakSelf = self;
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        make.left.equalTo(strongSelf.contentView.mas_left).with.offset(2);
        make.top.equalTo(strongSelf.contentView.mas_top).with.offset(5);

        make.height.equalTo(@40);
    }];

    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        make.left.equalTo(strongSelf.label1.mas_right).with.offset(2);
        make.top.equalTo(strongSelf.contentView.mas_top).with.offset(5);

        make.height.equalTo(@40);

        // label2的右边界X坐标 <= contentView的右边界X坐标
        make.right.lessThanOrEqualTo(_contentView.mas_right).with.offset(-2);
    }];

    // 设置label1的content hugging为1000
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    // 设置label1的content compression为1000
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];

    // 设置label2的content hugging为1000
    [_label2 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    // 设置label2的content compression为250
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                             forAxis:UILayoutConstraintAxisHorizontal];
}

- (NSString *)getLabelContentWithCount:(NSUInteger)count {
    NSMutableString *ret = [NSMutableString new];
    
    for (NSUInteger i = 0; i <= count; i++) {
        [ret appendString:@"label,"];
    }
    
    return ret.copy;
}

@end
