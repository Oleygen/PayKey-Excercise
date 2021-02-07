//
//  NetworkManager.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import "NetworkManager.h"
#import "URLBuilder.h"
#import "MovieMapper.h"

@implementation NetworkManager

+ (instancetype) shared {
    static NetworkManager *sharedInstance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [[NetworkManager alloc] init];
        });
        return sharedInstance;
}

- (NSURLSession *) sharedSession {
    return [NSURLSession sessionWithConfiguration: [NSURLSessionConfiguration defaultSessionConfiguration]];
}


- (void) moviesForPage: (NSUInteger) page completionHandler: (MoviesRequestResult) handler {

    NSURL *url = [URLBuilder popularMovieForPage: page];

    [[[self sharedSession] dataTaskWithURL: url completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            handler(nil, error);
            return;
        }
        
        NSError* serializationError;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &serializationError];
        
        if (serializationError) {
            handler(nil, error);
            return;
        }
        
        NSArray<MovieNetworkModel* >* movies = [MovieMapper moviesFromJson: json];
        
        handler(movies, nil);
        
        }] resume] ;
}

- (void) searchMoviesForQuery: (NSString *) query withPage: (NSUInteger) page completionHandler: (MoviesRequestResult) handler {
    NSURL *url  = [URLBuilder searchMovieWithQuery: query page: page];
    
    [[[self sharedSession] dataTaskWithURL: url completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            handler(nil, error);
            return;
        }
        
        NSError* serializationError;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &serializationError];
        
        if (serializationError) {
            handler(nil, error);
            return;
        }
        
        NSArray<MovieNetworkModel* >* movies = [MovieMapper moviesFromJson: json];
        
        handler(movies, nil);
        
        }] resume] ;
}


- (void) detailsWithMovieId: (NSUInteger) movieId completionHandler: (DetailsRequestResult) handler {
    NSURL *url = [URLBuilder detailsForMovieId: movieId];
    
    [[[self sharedSession] dataTaskWithURL: url completionHandler: ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            handler(nil, error);
            return;
        }
        
        NSError* serializationError;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error: &serializationError];
        
        if (serializationError) {
            handler(nil, error);
            return;
        }
        
        MovieNetworkModel* movie = [MovieMapper movieFromJson: json];
        
        handler(movie, nil);
        
    }] resume];
}

@end
