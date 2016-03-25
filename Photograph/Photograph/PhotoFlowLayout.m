//
//  PhotoFlowLayout.m
//  Photograph
//
//  Created by 侯玉昆 on 16/3/25.
//  Copyright © 2016年 suger. All rights reserved.
//

#import "PhotoFlowLayout.h"

@implementation PhotoFlowLayout

- (void)prepareLayout{
    
    [super prepareLayout];
    
    self.itemSize = CGSizeMake(self.collectionView.frame.size.height *.6, self.collectionView.frame.size.height *.8);
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat margin = (self.collectionView.frame.size.width - self.itemSize.width) *.5;
    
    self.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
    
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat screenCenterX = self.collectionView.frame.size.width/2 + self.collectionView.contentOffset.x;
  
    for (UICollectionViewLayoutAttributes *att in attributes) {
        
        CGFloat deltaMargin = ABS(screenCenterX - att.center.x);
        
        CGFloat scalRatio =  1.2 - (deltaMargin / (self.collectionView.frame.size.width/2 + att.size.width));
        
        att.transform = CGAffineTransformMakeScale(scalRatio, scalRatio);
        
    }
    return attributes;
}
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset{
    
    CGFloat screenCenterX = self.collectionView.frame.size.width/2 + proposedContentOffset.x;
 
    CGRect visibleRect = CGRectZero;
    
    visibleRect.size = self.collectionView.frame.size;
    
    visibleRect.origin = proposedContentOffset;

    NSArray *attributes = [super layoutAttributesForElementsInRect:visibleRect];
    
    CGFloat minMargin = MAXFLOAT;
    
    for (UICollectionViewLayoutAttributes *att in attributes) {
 
        CGFloat deltaMargin = att.center.x - screenCenterX ;
        
        if (ABS(minMargin) > ABS(deltaMargin)) {
            
            minMargin = deltaMargin;
        }
    }
    
    return CGPointMake(proposedContentOffset.x + minMargin, proposedContentOffset.y);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{ return YES;}//当布局改变时刷新UI

@end
