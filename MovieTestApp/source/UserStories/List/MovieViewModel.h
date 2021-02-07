//
//  MovieViewModel.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieViewModel : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSNumber* popularity;
@property (nonatomic, strong) NSString* posterPath;
@property (nonatomic) NSUInteger movieId;

@end

NS_ASSUME_NONNULL_END
