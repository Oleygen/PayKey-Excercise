//
//  MovieMapper.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import "MovieMapper.h"

@implementation MovieMapper

NSString const* kResultKey = @"results";
NSString const* kIdKey = @"id";
NSString const* kTitleKey = @"original_title";
NSString const* kLanguageKey = @"original_language";
NSString const* kOverviewKey = @"overview";
NSString const* kPopularityKey = @"popularity";
NSString const* kPosterKey = @"poster_path";
NSString const* kReleaseDateKey = @"release_date";
NSString const* kVoteKey = @"vote_average";

+ (NSArray<MovieNetworkModel *> *) moviesFromJson: (NSDictionary *) json {
    NSArray* jsonResults = json[kResultKey];
    
    
    NSMutableArray* result = [NSMutableArray array];
    for (NSDictionary* movieDictionary in jsonResults) {
        
        MovieNetworkModel *model = [self movieFromJson: movieDictionary];
        
        [result addObject: model];
    }
    return [result copy];
}

+ (MovieNetworkModel *) movieFromJson: (NSDictionary *) json {
    
    MovieNetworkModel *model = [[MovieNetworkModel alloc] init];
    
    model.movieId = [json[kIdKey] integerValue];
    model.originalLanguage = json[kLanguageKey];
    model.overview = json[kOverviewKey];
    model.popularity = json[kPopularityKey];
    model.posterPath = json[kPosterKey];
    model.releaseDate = json[kReleaseDateKey];
    model.title = json[kTitleKey];
    model.voteAverage = json[kVoteKey];
    
    model.parameters = json;
    
    return model;
}

@end
