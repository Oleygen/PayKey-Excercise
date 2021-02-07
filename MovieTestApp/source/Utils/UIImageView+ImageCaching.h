//
//  UIImageView+ImageCaching.h
//  MovieTestApp
//
//  Created by Gennady  Oleynik  on 06.02.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ImageCaching)

- (void) loadImageFromURL:(NSURL*)url placeholderImage:(UIImage*)placeholder;

@end

NS_ASSUME_NONNULL_END
