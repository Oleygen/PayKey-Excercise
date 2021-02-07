//
//  URLBuilder.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface URLBuilder : NSObject

+ (NSURL *) popularMovieForPage: (NSUInteger) page;
+ (NSURL *) detailsForMovieId: (NSUInteger) movieId;
+ (NSURL *) searchMovieWithQuery: (NSString *) query page: (NSUInteger) page;
+ (NSURL *) imageURLWithPosterString: (NSString *) poster;
@end

NS_ASSUME_NONNULL_END
