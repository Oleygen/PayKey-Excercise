//
//  ListViewDataService.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import <Foundation/Foundation.h>
#import "MovieViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ListViewDataServiceProtocol <NSObject>

- (void) didFetchMovies: (NSArray<MovieViewModel*>*)movies;

@end

@interface ListViewDataService : NSObject

@property (nonatomic, weak) id<ListViewDataServiceProtocol> delegate;
- (void) fetchInitialMovies;
- (void) fetchMoviesWithPageNumber: (NSUInteger) pageNumber;
- (void) searchMoviesWithQuery: (NSString *) query pageNumber: (NSUInteger) pageNumber;
@end

NS_ASSUME_NONNULL_END
