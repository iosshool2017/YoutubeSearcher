//
//  Song.m
//  YoutubeSearcher
//
//  Created by Admin on 21.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "Song.h"

@implementation Song

+ (Song *)songFromResults: (NSDictionary*) dict{
    Song *song=[Song new];
    song.artist=dict[@"artistName"];
    song.name=dict[@"trackName"];
    song.album=dict[@"collectionName"];
    song.price=[NSString stringWithFormat:@"%@", dict[@"trackPrice"]];
    song.url=dict[@"artworkUrl60"];
    return song;
}

@end
