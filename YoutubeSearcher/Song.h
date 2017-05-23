//
//  Song.h
//  YoutubeSearcher
//
//  Created by Admin on 21.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UiKit.h"

@interface Song : NSObject

@property(strong,nonatomic)NSString *artist;
@property(strong,nonatomic)NSString *album;
@property(strong,nonatomic)NSString *name;
@property(strong,nonatomic)NSString *price;
@property(strong,nonatomic)UIImage *image;
@property(strong,nonatomic)NSString *url;

+ (Song * )songFromResults: (NSDictionary*) dict;

@end
