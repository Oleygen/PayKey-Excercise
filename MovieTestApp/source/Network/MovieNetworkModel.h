//
//  MovieNetworkModel.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieNetworkModel : NSObject

@property (nonatomic) NSUInteger movieId;
@property (nonatomic, strong) NSString* posterPath;
@property (nonatomic, strong) NSNumber* popularity;
@property (nonatomic, strong) NSString* originalLanguage;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* tagline;
@property (nonatomic, strong) NSString* overview;
@property (nonatomic, strong) NSString* releaseDate;
@property (nonatomic, strong) NSString* voteAverage;
@property (nonatomic) NSUInteger budget;
@property (nonatomic) NSUInteger revenue;
@property (nonatomic) NSUInteger runtime;

@property (nonatomic, strong) NSDictionary* parameters;
@end

NS_ASSUME_NONNULL_END
