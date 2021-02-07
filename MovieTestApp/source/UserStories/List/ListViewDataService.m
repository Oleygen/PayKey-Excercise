//
//  ListViewDataService.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import "ListViewDataService.h"
#import "NetworkManager.h"
#import "MovieNetworkModel+Convert.h"

@interface ListViewDataService()

@end

@implementation ListViewDataService

- (void) fetchInitialMovies {
    
    [self fetchMoviesWithPageNumber: 1];
}

- (void) fetchMoviesWithPageNumber: (NSUInteger) pageNumber {
    [[NetworkManager shared] moviesForPage: pageNumber completionHandler: ^(NSArray * _Nullable movies, NSError * _Nullable error) {
        
        if (error) {
            #warning handle error
        } else {
            NSMutableArray* moviesVM = [NSMutableArray array];
            [movies enumerateObjectsUsingBlock: ^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MovieNetworkModel* model = obj;
                [moviesVM addObject: [model toMovieViewModel]];
            }];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didFetchMovies: [moviesVM copy]];
            });
    
        }
    }];
}

- (void) searchMoviesWithQuery: (NSString *) query pageNumber: (NSUInteger) pageNumber {
    [[NetworkManager shared] searchMoviesForQuery: query withPage: pageNumber completionHandler: ^(NSArray<MovieNetworkModel *> * _Nullable movies, NSError * _Nullable error) {
        if (error) {
            #warning handle error
        } else {
            NSMutableArray* moviesVM = [NSMutableArray array];
            [movies enumerateObjectsUsingBlock: ^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MovieNetworkModel* model = obj;
                [moviesVM addObject: [model toMovieViewModel]];
            }];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didFetchMovies: [moviesVM copy]];
            });
    
        }
    }];
}


@end



