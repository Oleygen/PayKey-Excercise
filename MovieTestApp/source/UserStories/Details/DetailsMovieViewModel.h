//
//  DetailsMovieViewModel.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsMovieViewModel : NSObject

@property (nonatomic, strong) NSString* posterPath;
@property (nonatomic, strong) NSDictionary* parameters;

@end

NS_ASSUME_NONNULL_END
