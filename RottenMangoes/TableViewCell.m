//
//  TableViewCell.m
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.imageView.image = nil;
    [self.task suspend];
    
}

//-(void)configureCell{
//    
//    
//    
//}

-(void)setMovie:(Movie *)movie{
    
    self.titleLabel.text = movie.title;
    
    NSURL *imageURL = [[NSURL alloc]initWithString:movie.imageURL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    self.task = [session downloadTaskWithURL:imageURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
        
        NSData *imageData = [NSData dataWithContentsOfURL:location];
        UIImage *movieImage = [UIImage imageWithData:imageData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.thumbNailImageView.image = movieImage;
        });
        
        
        movie.localImageURL = location;
        
    }];
    
    _movie = movie;
    [self.task resume];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
