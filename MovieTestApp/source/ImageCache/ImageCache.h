//
//  ImageCache.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageCache : NSCache

+ (instancetype) shared;


@end

NS_ASSUME_NONNULL_END
