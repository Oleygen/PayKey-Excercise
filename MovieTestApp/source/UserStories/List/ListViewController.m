//
//  ListViewController.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 05.02.2021.
//

#import "ListViewController.h"
#import "ListViewDataService.h"
#import "UIImageView+ImageCaching.h"
#import "URLBuilder.h"
#import "DetailsViewController.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource, ListViewDataServiceProtocol, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) ListViewDataService *dataService;

@property (nonatomic, strong) NSMutableArray<MovieViewModel*> *movies;

@property (nonatomic) NSUInteger pageNumber;

@property (nonatomic, strong) NSString* prevSearch;
@end

@implementation ListViewController
NSString *const kSegueIdentifier = @"listToDetails";
NSString *const kCellIdentifier = @"MovieCell";
NSInteger const kMaxPageNumber = 5;

#pragma mark - lazy vars

- (ListViewDataService *) dataService {
    if (!_dataService) {
        _dataService = [[ListViewDataService alloc] init];
        _dataService.delegate = self;
    }
    return _dataService;
}

- (NSMutableArray<MovieViewModel*> *) movies {
    if (!_movies) {
        _movies = [[NSMutableArray alloc] init];
    }
    return _movies;
}


#pragma mark - UIViewController lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageNumber = 1;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.searchBar.delegate = self;
    [self.dataService fetchInitialMovies];
}


#pragma mark - Navigation

- (void)prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender {
    if([segue.identifier isEqualToString: kSegueIdentifier]) {
        DetailsViewController* target = segue.destinationViewController;
        MovieViewModel* movie = sender;
        target.movieId = movie.movieId;
    }
}

#pragma mark - UISearchBarDelegate implementation

- (void) searchBar: (UISearchBar *) searchBar textDidChange: (NSString *) searchText {
        SEL selector = @selector(performSearch:);
        [NSObject cancelPreviousPerformRequestsWithTarget: self selector: selector object: self.prevSearch];
    self.prevSearch = searchText;
    
    NSTimeInterval delay = 0.2; // the time user need to make next input

    [self performSelector: selector withObject: searchText afterDelay: delay];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.view endEditing: true];
}

- (void) performSearch: (NSString *) query {
    self.pageNumber = 1;
    [self.movies removeAllObjects];
    [self.tableView reloadData];
    
    if ([query isEqualToString: @""]) {
        [self.dataService fetchMoviesWithPageNumber: self.pageNumber];
    } else {
        [self.dataService searchMoviesWithQuery: query pageNumber: self.pageNumber];
    }
}

#pragma mark - ListViewDataServiceProtocol implementation

- (void) didFetchMovies: (nonnull NSArray<MovieViewModel *> *) movies {
    [self.movies addObjectsFromArray: movies];
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate & datasource

- (nonnull UITableViewCell *) tableView: (nonnull UITableView *) tableView cellForRowAtIndexPath: (nonnull NSIndexPath *) indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: kCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: kCellIdentifier];
    }
    MovieViewModel* movieVM = self.movies[indexPath.row];
    cell.textLabel.text = movieVM.title;
    cell.detailTextLabel.text = [movieVM.popularity stringValue];
    [cell.imageView loadImageFromURL: [URLBuilder imageURLWithPosterString: movieVM.posterPath] placeholderImage: [UIImage imageNamed: @"placeholder"]];
    
    return cell;
}

- (NSInteger) tableView: (nonnull UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return self.movies.count;
}

- (void)tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    MovieViewModel* movie = self.movies[indexPath.row];
    [self performSegueWithIdentifier: kSegueIdentifier sender: movie];
}

- (void)tableView: (UITableView *) tableView willDisplayCell: (UITableViewCell *) cell forRowAtIndexPath: (NSIndexPath *) indexPath {
    
    NSUInteger cellOffsetToStartPagination = 5;
    
    if (self.pageNumber < kMaxPageNumber && indexPath.row == self.movies.count - cellOffsetToStartPagination) {
        
        if ([self.searchBar.text isEqualToString: @""]) {
            self.pageNumber++;
            [self.dataService fetchMoviesWithPageNumber: self.pageNumber];
        } else {
            self.pageNumber++;
            [self.dataService searchMoviesWithQuery: self.searchBar.text pageNumber: self.pageNumber];
        }
    }
}

@end
