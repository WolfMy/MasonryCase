//
//  Case4Cell.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/23.
//

#import "Case4Cell.h"
#import "Masonry.h"

static const CGFloat IMAGE_SIZE = 64;

@interface Case4Cell ()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation Case4Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self initCellViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//// dequeueReusableCellWithIdentifier:
//// If you registered a class for the specified identifier and a new cell must be created, this method initializes the cell by calling its initWithStyle:reuseIdentifier: method.
//// 调用UITableView的dequeueReusableCellWithIdentifier方法时会通过这个方法初始化Cell
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self initCellViews];
//    }
//    return self;
//}

- (void)initCellViews {
//    NSLog(@"initCellViews");
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.greaterThanOrEqualTo(@(IMAGE_SIZE));
    }];
    
    // 头像
    _avatarImageView = [UIImageView new];
    [self.contentView addSubview:_avatarImageView];
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(5);
        make.bottom.lessThanOrEqualTo(self.contentView).with.offset(-5);
        make.left.equalTo(self.contentView).with.offset(5);
        
        make.width.equalTo(@(IMAGE_SIZE));
        make.height.equalTo(@(IMAGE_SIZE));
    }];
    
    // 标题 - 单行
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(5);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(5);
        make.right.equalTo(self.contentView).with.offset(-5);
        
        make.height.equalTo(@(22));
    }];
    
    // 内容 - 多行
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;

    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - IMAGE_SIZE - 5 * 3; // 5 * 3 为 padding
    _contentLabel.preferredMaxLayoutWidth = preferredMaxWidth;

    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(5);
        make.bottom.equalTo(self.contentView).with.offset(-5);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(5);
        make.right.equalTo(self.contentView).with.offset(-5);
    }];
}

- (void)setDataEntity:(Case4DataEntity *)dataEntity {
    _dataEntity = dataEntity;
    
    _avatarImageView.image = dataEntity.image;
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

@end
