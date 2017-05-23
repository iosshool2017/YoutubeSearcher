
//
//  SearchReesultModel.m
//  YoutubeSearcher
//
//  Created by Admin on 21.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "SearchResultModel.h"
#import "Song.h"

@implementation SearchResultModel

-(instancetype) init{
    self=[super init];
    return self;
}

-(void) getSongs:(NSString*) searchStr withCompletionHandler: (void (^)(void))completionHandler {
    
    NSString *searchStrWithoutSpace=[searchStr stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *searchStrUrl = [searchStrWithoutSpace stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@",searchStrUrl]];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask * task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self.songs=[self parseData:data];
        completionHandler();
        if(error){
            NSLog(@"Error download data %@",error.userInfo);
        }
    }];
    [task resume];
}

- (NSArray *)parseData:(NSData *)data {
    if (!data)
    {
        return nil;
    }
    NSError *error=nil;
    NSDictionary* json=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if(error){
        NSLog(@"Error parse%@",error.userInfo);
    }
    NSMutableArray *songs =[NSMutableArray new];
    for (NSDictionary * results in json[@"results"]) {
            [songs addObject:[Song songFromResults:results]];
    }
        return [songs copy];
}


@end
