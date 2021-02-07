//
//  DetailsViewDataService.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import "DetailsViewDataService.h"
#import "NetworkManager.h"
#import "MovieNetworkModel.h"
#import "MovieNetworkModel+Convert.h"

@interface DetailsViewDataService()

@property (nonatomic) NSUInteger movieId;
@end

@implementation DetailsViewDataService

- (instancetype) initWithMovieId: (NSUInteger) movieId {
    if ( self = [super init] ) {
        _movieId = movieId;
      }
      return self;
}

- (void) fetchDetails {
    [[NetworkManager shared] detailsWithMovieId: self.movieId completionHandler: ^(MovieNetworkModel * _Nullable model, NSError * _Nullable error) {
        if(error) {
            #warning handle error
        } else {
            DetailsMovieViewModel* viewModel = [model toDetailsViewModel];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didFetchDetails: viewModel];
            });
        }
    }];
}

@end
