//
//  SearchReesultModel.h
//  YoutubeSearcher
//
//  Created by Admin on 21.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResultModel : NSObject

@property (copy,nonatomic) NSArray *songs;

- (void)getSongs:(NSString *)request withCompletionHandler: (void (^)(void))completionHandler;

@end
