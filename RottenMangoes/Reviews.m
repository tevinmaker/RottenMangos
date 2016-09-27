//
//  Reviews.m
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import "Reviews.h"

@implementation Reviews

-(instancetype)initWithCritic:(NSString *) critic quote:(NSString *) quote andPublication:(NSString *)publication{
    self = [super init];
    if (self) {
        _critic = critic;
        _quote = quote;
        _publication = publication;
    }
    
    return self;
}

@end
