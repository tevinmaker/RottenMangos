//
//  ReviewCell.m
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import "ReviewCell.h"

@implementation ReviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setReview:(Reviews *)review{
    self.criticLabel.text = review.critic;
    self.publicationLabel.text = review.publication;
    self.quoteLabel.text = review.quote;
    
    _review = review;
    
}


@end
