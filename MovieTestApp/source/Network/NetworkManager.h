//
//  NetworkManager.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import <Foundation/Foundation.h>
#import "MovieNetworkModel.h"

typedef void (^MoviesRequestResult)(NSArray<MovieNetworkModel*>* _Nullable movies, NSError* _Nullable error);
typedef void (^DetailsRequestResult)(MovieNetworkModel * _Nullable model, NSError* _Nullable error);
NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (instancetype) shared;

- (void) moviesForPage: (NSUInteger) page completionHandler: (MoviesRequestResult) handler;
- (void) searchMoviesForQuery: (NSString *) query withPage: (NSUInteger) page completionHandler: (MoviesRequestResult) handler;
- (void) detailsWithMovieId: (NSUInteger) movieId completionHandler: (DetailsRequestResult) handler;
@end

NS_ASSUME_NONNULL_END
