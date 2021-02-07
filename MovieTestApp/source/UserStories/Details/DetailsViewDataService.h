//
//  DetailsViewDataService.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import <Foundation/Foundation.h>
#import "DetailsMovieViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol DetailsViewDataServiceProtocol <NSObject>

- (void) didFetchDetails: (DetailsMovieViewModel *) viewModel;

@end

@interface DetailsViewDataService : NSObject

@property (nonatomic, weak) id<DetailsViewDataServiceProtocol> delegate;

- (instancetype) initWithMovieId: (NSUInteger) movieId;
- (void) fetchDetails;

@end

NS_ASSUME_NONNULL_END
