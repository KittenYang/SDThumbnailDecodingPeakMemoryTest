# SDThumbnailDecodingPeakMemoryTest
A demo to compare SD 5.x Thumbnail Decoding and SD 4.x Downsizing peak memory 

# How to test?
I start a discussion here: https://github.com/SDWebImage/SDWebImage/discussions/3192#discussioncomment-511410

You need to comment SD 4.x or SD 5.x in Podflie, and dont forget to uncomment the codes in ViewController. 

Please use *Instruments - Allocations* to monitor memory.

And here is the result:

The remote image url is https://apps.kittenyang.com/large_pic.jpg. The original image size is (13407, 6879).

* SD 4.x

The final image size is  {5536, 2840} because the default memory limit is 60MB, 5536x2840x4/1024/1024 ≈ 60MB. It's accurate!

![](https://github.com/KittenYang/SDThumbnailDecodingPeakMemoryTest/blob/main/SD4.0%20Instruments%20memory.png?raw=true)

* SD 5.x

The final image size is  {3966, 2035}, but 3966x2035x4/1024/1024 = 30.787696838MB. It's smaller than 60MB.

Because SD 5.x use below codes to measure dimension. It's assume the image is a square. It's not accurate!

```objc
CGFloat thumbnailPixels = SDImageCoderHelper.defaultScaleDownLimitBytes / 4;
CGFloat dimension = ceil(sqrt(thumbnailPixels));
thumbnailSizeValue = @(CGSizeMake(dimension, dimension));
```

![](https://github.com/KittenYang/SDThumbnailDecodingPeakMemoryTest/blob/main/SD5.0%20Instruments%20memory.png?raw=true)


**IMPORTANT!** Look at the peak memory, the SD 5.x workaround's peak meory is more higher than SD 4.x.

If you have some idea, please participate in this discussion here: https://github.com/SDWebImage/SDWebImage/discussions/3192#discussioncomment-511410

