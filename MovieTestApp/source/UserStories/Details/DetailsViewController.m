//
//  DetailsViewController.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import "DetailsViewController.h"
#import "DetailsViewDataService.h"
#import "ImageCell.h"
#import "UIImageView+ImageCaching.h"
#import "URLBuilder.h"


@interface DetailsViewController () <UITableViewDelegate, UITableViewDataSource, DetailsViewDataServiceProtocol>

@property (nonatomic, strong) DetailsViewDataService *dataService;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) DetailsMovieViewModel* viewModel;
@end

@implementation DetailsViewController

enum {
    CellTypeImage = 0,
    CellTypeData = 1,
    CellTypeCount = 2
};
typedef NSUInteger DetailsCellType;

NSString *const kImageCellIdentifier = @"ImageCellIdentifier";
NSString *const kDataCellIdentifier = @"DataCellIdentifier";
#pragma mark - lazy vars

- (DetailsViewDataService *) dataService {
    if (!_dataService) {
        _dataService = [[DetailsViewDataService alloc] initWithMovieId: self.movieId];
        _dataService.delegate = self;
    }
    return _dataService;
}

#pragma mark - UIViewController lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.dataService fetchDetails];
}

#pragma mark - DetailsViewDataServiceProtocol implementation

- (void) didFetchDetails: (nonnull DetailsMovieViewModel *) viewModel {
    self.viewModel = viewModel;
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate & datasource



- (nonnull UITableViewCell *) tableView: (nonnull UITableView *) tableView cellForRowAtIndexPath: (nonnull NSIndexPath *) indexPath {
    
    switch (indexPath.section) {
        case CellTypeImage: {
            ImageCell* cell = [tableView dequeueReusableCellWithIdentifier:kImageCellIdentifier];;
            if (!cell) {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed: @"ImageCell" owner: self options: nil];
                cell = (ImageCell *)[nib objectAtIndex:0];
            }
            
            if (self.viewModel.posterPath) {
                [cell.posterImageView loadImageFromURL: [URLBuilder imageURLWithPosterString: self.viewModel.posterPath] placeholderImage: [UIImage imageNamed: @"placeholder"]];
            }
            return cell;
            
            break;
        }
        case CellTypeData: {
            UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: kDataCellIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: kDataCellIdentifier];
            }
            
            NSString* key = self.viewModel.parameters.allKeys[indexPath.row];
            cell.textLabel.text = key;
            cell.detailTextLabel.text = [self.viewModel.parameters[key] description];
            return cell;
            break;
        }
        default:
            break;
    }
    // never happen
    return [[UITableViewCell alloc] init];
}

- (NSInteger) tableView: (nonnull UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    
    switch (section) {
        case CellTypeImage:
            return 1;
            break;
        case CellTypeData:
            return self.viewModel.parameters.allKeys.count;
        default:
            break;
    }
    
    
    // never happen
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return CellTypeCount;
}



@end
