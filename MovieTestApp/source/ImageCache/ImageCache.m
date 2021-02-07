//
//  ImageCache.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import "ImageCache.h"

@implementation ImageCache

+ (instancetype) shared {
    static ImageCache *sharedInstance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            sharedInstance = [[ImageCache alloc] init];
        });
        return sharedInstance;
}

@end
