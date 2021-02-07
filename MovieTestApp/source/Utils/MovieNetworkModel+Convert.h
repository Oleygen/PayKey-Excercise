//
//  MovieNetworkModel+Convert.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import "MovieNetworkModel.h"
#import "MovieViewModel.h"
#import "DetailsMovieViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MovieNetworkModel (Convert)

- (MovieViewModel *) toMovieViewModel;
- (DetailsMovieViewModel *) toDetailsViewModel;
@end

NS_ASSUME_NONNULL_END
