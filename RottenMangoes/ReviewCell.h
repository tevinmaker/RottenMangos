//
//  ReviewCell.h
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reviews.h"

@interface ReviewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *criticLabel;
@property (strong, nonatomic) IBOutlet UILabel *publicationLabel;
@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;

@property (nonatomic) Reviews * review;


@end
