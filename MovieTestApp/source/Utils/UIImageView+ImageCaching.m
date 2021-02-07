//
//  UIImageView+ImageCaching.m
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import "UIImageView+ImageCaching.h"
#import <objc/runtime.h>
#import "ImageCache.h"
static char URL_KEY;

@interface UIImageView(ImageCaching)

@property(nonatomic, strong) NSURL* imageURL;

@end

@implementation UIImageView(ImageCaching)

@dynamic imageURL;

- (void) loadImageFromURL: (NSURL *)url placeholderImage: (UIImage *) placeholder {
    
    self.imageURL = url;
    self.image = placeholder;
    
    NSData *cachedData = [[ImageCache shared] objectForKey: url.absoluteString];
    if (cachedData) {
        self.imageURL = nil;
        self.image = [UIImage imageWithData: cachedData];
        return;
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL: url];
        
        UIImage *imageFromData = [UIImage imageWithData: data];
        
        if (!imageFromData) {
            return;
        }
        
        [[ImageCache shared] setObject: UIImagePNGRepresentation(imageFromData) forKey: url.absoluteString];
        UIImage *imageToSet = imageFromData;
        if (imageToSet) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = imageFromData;
            });
        }
        self.imageURL = nil;
    });
}

- (void) setImageURL: (NSURL *) newImageURL {
    objc_setAssociatedObject(self, &URL_KEY, newImageURL, OBJC_ASSOCIATION_COPY);
}

- (NSURL *) imageURL {
    return objc_getAssociatedObject(self, &URL_KEY);
}

@end
