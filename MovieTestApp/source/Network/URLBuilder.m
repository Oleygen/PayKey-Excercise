//
//  URLBuilder.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import "URLBuilder.h"
#import "AppConstants.h"

@implementation URLBuilder

NSString *const baseUrl = @"https://api.themoviedb.org/3/";



+ (NSURL *) popularMovieForPage: (NSUInteger) page {
    NSString *urlString = [NSString stringWithFormat: @"%@movie/popular?api_key=%@&language=en-US&page=%lu", baseUrl, API_KEY, (unsigned long)page];
    return [NSURL URLWithString: urlString];
}
+ (NSURL *) detailsForMovieId: (NSUInteger) movieId {
    NSString *urlString = [NSString stringWithFormat: @"%@movie/%lu?api_key=%@&language=en-US", baseUrl, (unsigned long)movieId, API_KEY];
    return [NSURL URLWithString: urlString];
}
+ (NSURL *) searchMovieWithQuery: (NSString *) query page: (NSUInteger) page {
    NSString *urlString = [NSString stringWithFormat: @"%@search/movie?api_key=%@&language=en-US&query=%@&page=%lu&include_adult=false", baseUrl, API_KEY, query, page];

    return [NSURL URLWithString: urlString];
}

+ (NSURL *) imageURLWithPosterString: (NSString *) poster {
    
    NSString* urlString = [NSString stringWithFormat: @"https://image.tmdb.org/t/p/w500/%@", poster];
    return [NSURL URLWithString: urlString];
}

@end
