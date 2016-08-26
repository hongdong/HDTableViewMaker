//
//  UITableView+HDCover.m
//  HDTableViewMakerDemo
//
//  Created by 洪东 on 8/26/16.
//  Copyright © 2016 Abner. All rights reserved.
//

#import "UITableView+HDCover.h"
#import "NSObject+HDAssociated.h"
#import "NSBundle+HDTableViewMaker.h"
#import "Masonry.h"

#pragma mark - HDCoverSetView

@interface HDCoverSetEmptyView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, copy) HDTMVoidBlock reloadClickBlock;
@end

@implementation HDCoverSetEmptyView

- (instancetype) init{
    self = [super init];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.button];
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    
   [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.size.mas_equalTo(CGSizeMake(50, 50));
       make.centerX.mas_equalTo(self);
       make.centerY.mas_equalTo(self).with.offset(-30);
   }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_imageView);
        make.top.mas_equalTo(_imageView.mas_bottom).with.offset(8);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_titleLabel);
        make.top.mas_equalTo(_titleLabel.mas_bottom).with.offset(20);
    }];
    
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.accessibilityIdentifier = @"empty set background image";
        _imageView.image = [NSBundle hd_emptyImage];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        _titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        _titleLabel.accessibilityIdentifier = @"empty set title";
        
        _titleLabel.text = @"暂无数据";
    }
    return _titleLabel;
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor clearColor];
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _button.accessibilityIdentifier = @"empty set button";
        [_button setTitle:@"重新请求" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor colorWithRed:253/255.0f green:120/255.0f blue:76/255.0f alpha:1] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        [_button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)didTapButton:(UIButton *)sender{
    if (self.reloadClickBlock) {
        self.reloadClickBlock();
    }
}

@end

@interface HDCoverSetErrorView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, copy) HDTMVoidBlock reloadClickBlock;
@end

@implementation HDCoverSetErrorView
- (instancetype) init{
    self = [super init];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.button];
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self).with.offset(-30);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_imageView);
        make.top.mas_equalTo(_imageView.mas_bottom).with.offset(8);
    }];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_titleLabel);
        make.top.mas_equalTo(_titleLabel.mas_bottom).with.offset(20);
    }];
    
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.accessibilityIdentifier = @"empty set background image";
        _imageView.image = [NSBundle hd_errorImage];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        _titleLabel.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        _titleLabel.accessibilityIdentifier = @"empty set title";
        
        _titleLabel.text = @"发生了点小差错";
    }
    return _titleLabel;
}

- (UIButton *)button
{
    if (!_button)
    {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor clearColor];
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _button.accessibilityIdentifier = @"empty set button";
        [_button setTitle:@"重新请求" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor colorWithRed:253/255.0f green:120/255.0f blue:76/255.0f alpha:1] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        [_button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)didTapButton:(UIButton *)sender{
    if (self.reloadClickBlock) {
        self.reloadClickBlock();
    }
}
@end

@interface HDCoverSetLodingView : UIView
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@end

@implementation HDCoverSetLodingView

- (instancetype)init
{
    self =  [super init];
    if (self) {
        [self addSubview:self.activityView];
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{

    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];

}

- (UIActivityIndicatorView *)activityView
{
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityView startAnimating];
    }
    return _activityView;
}

@end


@interface HDCoverSetView : UIView

@property (nonatomic, copy) HDTMVoidBlock hd_emptyBtnClickBlock;

@property (nonatomic, copy) HDTMVoidBlock hd_errorBtnClickBlock;

@property (nonatomic, assign) HDTableViewCoverType hd_tableViewCoverType;

@property (nonatomic, strong) HDCoverSetEmptyView *coverEmptyView;

@property (nonatomic, strong) HDCoverSetErrorView *coverErrorView;

@property (nonatomic, strong) HDCoverSetLodingView *coverLoadingView;

@property (nonatomic, weak) __kindof UIView *curCoverView;

@property (nonatomic, assign) CGFloat verticalOffset;
@property (nonatomic, assign) CGFloat verticalSpace;

- (void)configCoverType:(HDTableViewCoverType)coverType;

@end

@implementation HDCoverSetView

#pragma mark - Initialization Methods

- (instancetype)init
{
    self =  [super init];
    if (self) {

    }
    return self;
}

- (void)configCoverType:(HDTableViewCoverType)coverType{
    if (_hd_tableViewCoverType!=coverType) {
        [self.curCoverView removeFromSuperview];
        _hd_tableViewCoverType = coverType;
        [self addSubview:self.curCoverView];
        [self.curCoverView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
}

- (void)didMoveToSuperview
{
    self.frame = self.superview.bounds;
    
    void(^fadeInBlock)(void) = ^{self.curCoverView.alpha = 1.0;};
    
    [UIView animateWithDuration:0.25
                     animations:fadeInBlock
                     completion:NULL];

}


#pragma mark - Getters

- (UIView *)curCoverView
{
    switch (self.hd_tableViewCoverType) {
        case HDTableViewCoverTypeNull:
        {
            
        }
            break;
        case HDTableViewCoverTypeEmpty:
        {
            _curCoverView = self.coverEmptyView;
        }
            break;
        case HDTableViewCoverTypeError:
        {
            _curCoverView = self.coverErrorView;
        }
            break;
        case HDTableViewCoverTypeLoading:
        {
            _curCoverView = self.coverLoadingView;
        }
            break;
        default:
            break;
    }
//    NSAssert(_curCoverView, @"========curCoverView是空的========");
    return _curCoverView;;
}

- (HDCoverSetLodingView *)coverLoadingView
{
    if (!_coverLoadingView) {
        _coverLoadingView = [HDCoverSetLodingView new];
//        _coverLoadingView.backgroundColor = [UIColor clearColor];
        _coverLoadingView.userInteractionEnabled = YES;
        _coverLoadingView.alpha = 0;
    }
    return _coverLoadingView;
}

- (HDCoverSetEmptyView *)coverEmptyView
{
    if (!_coverEmptyView) {
        _coverEmptyView = [HDCoverSetEmptyView new];
//        _coverEmptyView.backgroundColor = [UIColor whiteColor];
        _coverEmptyView.userInteractionEnabled = YES;
        _coverEmptyView.alpha = 0;
        HDWeakSelf;
        [_coverEmptyView setReloadClickBlock:^(){
            if (__weakSelf.hd_emptyBtnClickBlock) {
                __weakSelf.hd_emptyBtnClickBlock();
            }
        }];
    }
    return _coverEmptyView;
}

- (HDCoverSetErrorView *)coverErrorView
{
    if (!_coverErrorView) {
        _coverErrorView = [HDCoverSetErrorView new];
//        _coverErrorView.backgroundColor = [UIColor clearColor];
        _coverErrorView.userInteractionEnabled = YES;
        _coverErrorView.alpha = 0;
        HDWeakSelf;
        [_coverErrorView setReloadClickBlock:^(){
            if (__weakSelf.hd_errorBtnClickBlock) {
                __weakSelf.hd_errorBtnClickBlock();
            }
        }];
    }
    return _coverErrorView;
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    
    // Return any UIControl instance such as buttons, segmented controls, switches, etc.
    if ([hitView isKindOfClass:[UIControl class]]) {
        return hitView;
    }
    
    // Return either the contentView or customView
    if ([hitView isEqual:_curCoverView]) {
        return hitView;
    }
    
    return nil;
}

@end

#pragma mark - UITableView + HDCover

@interface UITableView ()
@property (nonatomic, strong) HDCoverSetView *coverSetView;
@end


@implementation UITableView (HDCover)
/**
 *  GET&SET
 */
- (HDCoverSetView *)coverSetView
{
    HDCoverSetView *view = [self hd_getAssociatedObjectWithKey:_cmd];
    if (!view)
    {
        view = [HDCoverSetView new];
        view.backgroundColor = [UIColor whiteColor];
        view.hidden = YES;
        [self setCoverSetView:view];
    }
    return view;
}

-(void)setCoverSetView:(HDCoverSetView *)coverSetView{
    [self hd_setAssociatedRetainObject:coverSetView key:@selector(coverSetView)];
}

- (void)hd_coverType:(HDTableViewCoverType)coverType{
    if (coverType==HDTableViewCoverTypeNull) {
        [self.coverSetView removeFromSuperview];
        [self setCoverSetView:nil];
        self.scrollEnabled = YES;
    }else{
        [self.coverSetView configCoverType:coverType];
        if (!self.coverSetView.superview) {
//            [self insertSubview:self.coverSetView atIndex:0];
            [self addSubview:self.coverSetView];

        }
        self.coverSetView.hidden = NO;
        self.coverSetView.clipsToBounds = YES;
        [self.coverSetView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self);
            make.edges.equalTo(self);
        }];
        HDWeakSelf;
        [UIView performWithoutAnimation:^{
            HDStrongSelf;
            [self.coverSetView layoutIfNeeded];
        }];
        self.scrollEnabled = NO;
    }
}

- (void) hd_coverLoading{
    self.hd_tableViewCoverType = HDTableViewCoverTypeLoading;
}

- (void) hd_coverEmpty{
    self.hd_tableViewCoverType = HDTableViewCoverTypeEmpty;
}

- (void) hd_coverError{
    self.hd_tableViewCoverType = HDTableViewCoverTypeError;
}

- (void) hd_coverDismiss{
    self.hd_tableViewCoverType = HDTableViewCoverTypeNull;
}
- (void)hd_coverEmpty:(HDTMVoidBlock)emptyBtnClickBlock{
    self.coverSetView.hd_emptyBtnClickBlock = emptyBtnClickBlock;
    [self hd_coverEmpty];
}

- (void)hd_coverError:(HDTMVoidBlock)errorBtnClickBlock{
    self.coverSetView.hd_errorBtnClickBlock = errorBtnClickBlock;
    [self hd_coverError];
}
/**
 *  GET
 */

-(void)setHd_tableViewCoverType:(HDTableViewCoverType)hd_tableViewCoverType{
    if (self.hd_tableViewCoverType == hd_tableViewCoverType) {
        return;
    }
    [self hd_setAssociatedAssignObject:@(hd_tableViewCoverType) key:@selector(hd_tableViewCoverType)];
    [self hd_coverType:hd_tableViewCoverType];
}

-(HDTableViewCoverType)hd_tableViewCoverType
{
    // 注意，取出的是一个对象，不能直接返回
    id tmp = [self hd_getAssociatedObjectWithKey:_cmd];
    NSNumber *number = tmp;
    return number.unsignedIntegerValue;
}

@end
