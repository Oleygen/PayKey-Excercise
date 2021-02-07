//
//  MovieNetworkModel+Convert.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import "MovieNetworkModel+Convert.h"

@implementation MovieNetworkModel (Convert)


- (MovieViewModel *) toMovieViewModel {
    MovieViewModel* model = [[MovieViewModel alloc] init];
    model.movieId = self.movieId;
    model.popularity = self.popularity;
    model.posterPath = self.posterPath;
    model.title = self.title;
    return model;
}

- (DetailsMovieViewModel *) toDetailsViewModel {
    DetailsMovieViewModel* model = [[DetailsMovieViewModel alloc] init];
    
    model.posterPath = self.posterPath;
    model.parameters = self.parameters;
    return model;
}

@end
