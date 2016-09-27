//
//  DetailViewController.m
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import "DetailViewController.h"
#import "ReviewCell.h"


@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSMutableArray * reviewsArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setMovie:(Movie *)movie {
    _movieDetail = movie;
    [self getReviews];
    [self configureView];
}

-(void)configureView{
    self.titleLabel.text = self.movieDetail.title;
    self.detailTextView.text = self.movieDetail.synopsis;
    NSData *imageData = [NSData dataWithContentsOfURL:self.movieDetail.localImageURL];
    self.imageView.image = [UIImage imageWithData:imageData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReviewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewCell" forIndexPath:indexPath];
    
    Reviews *review = self.reviewsArray[indexPath.row];
    cell.review = review;

    return cell;
    
}

-(void)getReviews{
    
    NSString *urlString = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/movies/%@/reviews.json?apikey=h8ym7ry7kkur36j7ku482y9z", self.movieDetail.movieID];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:urlString]  completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        NSError *jsonError = nil;
        
        NSDictionary *reviews = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        NSLog(@"%@",reviews);
        NSArray *tempArray = reviews[@"reviews"];
        
        NSMutableArray * reviewsArray = [[NSMutableArray alloc]init];
        
        for (NSDictionary *eachReview in tempArray) {
            NSString * critic = eachReview[@"critic"];
            NSString * quote = eachReview[@"quote"];
            NSString * publication = eachReview[@"publication"];
            
            Reviews *review = [[Reviews alloc]initWithCritic:critic quote:quote andPublication:publication];
            
            [reviewsArray addObject:review];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.reviewsArray = reviewsArray;
            [self.tableView reloadData];
        });
        
        
    }];
    [task resume];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
