//
//  Reviews.h
//  RottenMangoes
//
//  Created by Tevin Maker on 2016-09-26.
//  Copyright © 2016 Tevin Maker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reviews : NSObject

@property (nonatomic) NSString * critic;
@property (nonatomic) NSString * publication;
@property (nonatomic) NSString * quote;

-(instancetype)initWithCritic:(NSString *) critic quote:(NSString *) quote andPublication:(NSString *)publication;

@end
