//
//  PhotoCell.m
//  Photograph
//
//  Created by 侯玉昆 on 16/3/25.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "PhotoCell.h"
@interface PhotoCell ()

@property (nonatomic, weak) UIImageView *imageView;


@end
@implementation PhotoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        
        _imageView = imageView;
        
        [self.contentView addSubview:imageView];
    }
    return self;
}


- (void)setImage:(UIImage *)image{
    
    _image = image;
    
    _imageView.image = image;
}

@end
