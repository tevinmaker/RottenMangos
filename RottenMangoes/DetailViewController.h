//
//  DetailViewController.h
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "Reviews.h"

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UITextView *detailTextView;
@property (nonatomic) Movie *movieDetail;

-(void)getReviews;

@end
