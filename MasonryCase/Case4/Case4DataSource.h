//
//  Case4DataSource.h
//  MasonryCase
//
//  Created by bytedance on 2020/12/23.
//

#import <Foundation/Foundation.h>
#import "Case4DataEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Case4DataSource : NSObject

- (NSInteger)numberOfDataEntity;

- (Case4DataEntity *)dataEntityAt:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
