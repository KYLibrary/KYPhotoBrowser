//
//  UIImage+MWPhotoBrowser.m
//  Pods
//
//  Created by Michael Waterfall on 05/07/2015.
//
//

#import "UIImage+MWPhotoBrowser.h"

@implementation UIImage (MWPhotoBrowser)

+ (UIImage *)imageForResourcePath:(NSString *)path ofType:(NSString *)type inBundle:(NSBundle *)bundle {
    NSString *newPath = [NSString stringWithFormat:@"%@@%.0fx", path, [UIScreen mainScreen].scale];
    NSString *filePath = [bundle pathForResource:newPath ofType:type];
    int i = 3;
    while (!filePath && i) {
        if (i == 1) {
            filePath = [bundle pathForResource:path ofType:type];
        } else {
            newPath = [NSString stringWithFormat:@"%@@%dx", path, i];
            filePath = [bundle pathForResource:newPath ofType:type];
        }
        i--;
    }
    return [UIImage imageWithContentsOfFile:filePath];
}

+ (UIImage *)clearImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    UIImage *blank = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return blank;
}

@end
