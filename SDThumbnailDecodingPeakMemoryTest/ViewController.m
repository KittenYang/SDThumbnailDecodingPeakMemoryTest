//
//  ViewController.m
//  SDThumbnailDecodingPeakMemoryTest
//
//  Created by KittenYang on 2021/3/22.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *largeImageView;

@end

NSString* const testLargePicURLString = @"https://apps.kittenyang.com/large_pic.jpg";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self run1];
}

- (void)run1 {
    
    // MARK: - SD 4.x
    [self.largeImageView sd_setImageWithURL:[NSURL URLWithString:testLargePicURLString]
                           placeholderImage:nil
                                    options:SDWebImageScaleDownLargeImages | SDWebImageCacheMemoryOnly
                                  completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"SD 4.x - ImageSize: %@", NSStringFromCGSize(CGSizeMake(CGImageGetWidth(image.CGImage), CGImageGetHeight(image.CGImage))));
    }];
    
    
    // MARK: - SD 5.x
//    [self.largeImageView sd_setImageWithURL:[NSURL URLWithString:testLargePicURLString] placeholderImage:nil options:SDWebImageScaleDownLargeImages context:@{SDWebImageContextStoreCacheType: @(SDImageCacheTypeNone)} progress:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        NSLog(@"SD 5.x - ImageSize: %@", NSStringFromCGSize(CGSizeMake(CGImageGetWidth(image.CGImage), CGImageGetHeight(image.CGImage))));
//    }];
}

@end
