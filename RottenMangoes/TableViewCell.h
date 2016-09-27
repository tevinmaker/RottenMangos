//
//  TableViewCell.h
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbNailImageView;
@property (nonatomic) NSURLSessionDownloadTask * task;
@property (nonatomic) UIImage * movieImage;
@property (nonatomic) Movie *movie;


@end
