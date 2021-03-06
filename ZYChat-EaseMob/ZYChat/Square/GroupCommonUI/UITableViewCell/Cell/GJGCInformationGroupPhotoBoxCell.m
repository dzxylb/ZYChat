//
//  GJGCInformationGroupPhotoBoxCell.m
//  ZYChat
//
//  Created by ZYVincent QQ:1003081775 on 14-11-6.
//  Copyright (c) 2014年 ZYV. All rights reserved.
//

#import "GJGCInformationGroupPhotoBoxCell.h"

@interface GJGCInformationGroupPhotoBoxCell ()<GJGCInformationPhotoBoxDelegate>

@end

@implementation GJGCInformationGroupPhotoBoxCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentBordMargin = 5.f;
        
        self.photoBox = [[GJGCInformationPhotoBox alloc]init];
        self.photoBox.gjcf_left = 8;
        self.photoBox.gjcf_top = 8;
        self.photoBox.gjcf_width = GJCFSystemScreenWidth - 2*8;
        self.photoBox.gjcf_height = 73*2+4;
        self.photoBox.delegate = self;
        self.photoBox.backgroundColor = [UIColor clearColor];
        [self.baseContentView addSubview:self.photoBox];
        
        self.nameLabel = [[GJCFCoreTextContentView alloc]init];
        self.nameLabel.gjcf_left = 13.f;
        self.nameLabel.gjcf_top = self.photoBox.gjcf_bottom + 10;
        self.nameLabel.gjcf_width = GJCFSystemScreenWidth - 80 - 2*13;
        self.nameLabel.gjcf_height = 20;
        self.nameLabel.contentBaseWidth = self.nameLabel.gjcf_width;
        self.nameLabel.contentBaseHeight = self.nameLabel.gjcf_height;
        [self.baseContentView addSubview:self.nameLabel];
        
        self.distanceLabel = [[GJCFCoreTextContentView alloc]init];
        self.distanceLabel.gjcf_right = self.accessoryIndicatorView.gjcf_left + 13;
        self.distanceLabel.gjcf_top = self.nameLabel.gjcf_top;
        self.distanceLabel.gjcf_width = 80;
        self.distanceLabel.gjcf_height = 20;
        self.distanceLabel.contentBaseHeight = self.distanceLabel.gjcf_height;
        self.distanceLabel.contentBaseWidth = self.distanceLabel.gjcf_width;
        [self.baseContentView addSubview:self.distanceLabel];
        
        
    }
    return self;
}

- (void)setContentInformationModel:(GJGCInformationBaseModel *)contentModel
{
    if (!contentModel) {
        return;
    }
    [super setContentInformationModel:contentModel];
    
    GJGCInformationCellContentModel *informationModel = (GJGCInformationCellContentModel *)contentModel;
    [self.photoBox setContentPhotoBoxUrls:informationModel.photoBoxArray];
    self.accessoryIndicatorView.hidden = YES;
    
    self.nameLabel.gjcf_top = self.photoBox.gjcf_bottom + 13;
    self.nameLabel.gjcf_left = self.photoBox.gjcf_left;
    self.nameLabel.contentAttributedString = informationModel.name;
    self.nameLabel.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:informationModel.name forBaseContentSize:self.nameLabel.contentBaseSize];
    
    self.distanceLabel.contentAttributedString = informationModel.distance;
    self.distanceLabel.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:informationModel.distance forBaseContentSize:self.distanceLabel.contentBaseSize];
    self.distanceLabel.gjcf_centerY = self.nameLabel.gjcf_centerY;
    self.distanceLabel.gjcf_right = self.photoBox.gjcf_right;
    
    self.baseContentView.gjcf_height = self.nameLabel.gjcf_bottom + 13;
    
    self.topSeprateLine.gjcf_top = informationModel.topLineMargin;
    self.baseContentView.gjcf_top = self.topSeprateLine.gjcf_bottom-0.5;
    self.baseSeprateLine.gjcf_bottom = self.baseContentView.gjcf_bottom;
}

#pragma mark - PhotoBox Delegate
- (void)photoBoxDidTapAtIndex:(NSInteger)index
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(informationGroupPhotoBoxCell:didTapOnPhotoIndex:)]) {
        [self.delegate informationGroupPhotoBoxCell:self didTapOnPhotoIndex:index];
    }
}

@end
