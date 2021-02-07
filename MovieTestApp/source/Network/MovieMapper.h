//
//  MovieMapper.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import <Foundation/Foundation.h>
#import "MovieNetworkModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MovieMapper : NSObject

+ (NSArray<MovieNetworkModel *> *) moviesFromJson: (NSDictionary *) json;
+ (MovieNetworkModel *) movieFromJson: (NSDictionary *) json;

@end

NS_ASSUME_NONNULL_END
