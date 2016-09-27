//
//  Movie.h
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic) NSString * title;
@property (nonatomic) NSString * synopsis;
@property (nonatomic) NSString * imageURL;
@property (strong, nonatomic) NSURL * localImageURL;
@property (nonatomic) NSString * movieID;


-(instancetype) initWithTitle:(NSString *) title;

@end
