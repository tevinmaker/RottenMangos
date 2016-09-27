//
//  ViewController.m
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "TableViewCell.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSMutableArray * objects;
@property (nonatomic) NSMutableArray * imageURLArray;
@property (nonatomic) UIImage * movieImage;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSString *urlString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=h8ym7ry7kkur36j7ku482y9z";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:urlString]  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
    
        if (!error) {
            NSError *jsonError = nil;
            
            NSDictionary *movies = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            NSArray *tempArray = movies[@"movies"];
            
            
            NSMutableArray *moviesArray = [[NSMutableArray alloc]init];
            
            for (NSDictionary *eachMovie in tempArray) {
                NSString * title = eachMovie[@"title"];
                NSString * synopsis = eachMovie[@"synopsis"];
                NSDictionary * posters = eachMovie[@"posters"];
                NSString * movieID = eachMovie[@"id"];
                NSString * imageURL = posters[@"profile"];
                
                Movie *movie = [[Movie alloc]initWithTitle:title];
                movie.synopsis = synopsis;
                movie.imageURL = imageURL;
                movie.movieID = movieID;
                [moviesArray addObject:movie];
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.objects = moviesArray;
                [self.tableView reloadData];
                
            });
        }
        
    }];
 
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.objects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Movie *movie = self.objects[indexPath.row];
    cell.movie = movie;
    
    return cell;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Show Detail"]) {
        
        TableViewCell * cell = sender;
        [[segue destinationViewController] setMovie: cell.movie];
    
    }
    
}

    
    
@end
