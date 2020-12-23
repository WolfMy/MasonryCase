//
//  Case4DataSource.m
//  MasonryCase
//
//  Created by bytedance on 2020/12/23.
//

#import "Case4DataSource.h"
#import "UIKit/UIKit.h"
#import "NSString+Repeat.h"

@interface Case4DataSource ()

@property (nonatomic, copy) NSArray *dataEntities;

@end

@implementation Case4DataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataEntities = [Case4DataSource generateEntitiesData];
    }
    return self;
}

+ (NSArray *)generateEntitiesData {
    NSMutableArray *datas =[NSMutableArray new];
    for (int i = 0; i < 16; i++) {
        Case4DataEntity *dataEntity = [Case4DataEntity new];
        dataEntity.image = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [NSString getString:@"content-" withRepeat:(2 * i) + 1];
        [datas addObject:dataEntity];
    }
    return datas;
}

- (NSInteger)numberOfDataEntity {
    return _dataEntities.count;
}

- (Case4DataEntity *)dataEntityAt:(NSIndexPath *)indexPath {
    return [_dataEntities objectAtIndex:indexPath.row];
}

@end
