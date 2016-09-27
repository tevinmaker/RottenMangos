//
//  Movie.m
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import "Movie.h"

@implementation Movie

-(instancetype) initWithTitle:(NSString *) title{
    self = [super init];
    if (self) {
        _title = title;
    }
    return  self;
}


@end
