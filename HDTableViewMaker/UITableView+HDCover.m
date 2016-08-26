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

#pragma mark - UIView+HDConstraintBasedLayoutExtensions


@interface UIView (HDConstraintBasedLayoutExtensions)

- (NSLayoutConstraint *)equallyRelatedConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute;

@end


@implementation UIView (HDConstraintBasedLayoutExtensions)

- (NSLayoutConstraint *)equallyRelatedConstraintWithView:(UIView *)view attribute:(NSLayoutAttribute)attribute
{
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:0.0];
}

@end

#pragma mark - HDCoverSetView

@interface HDCoverSetEmptyView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;
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
    
        CGFloat width = CGRectGetWidth(self.frame) ? : CGRectGetWidth([UIScreen mainScreen].bounds);
        CGFloat padding = roundf(width/16.0);
        CGFloat verticalSpace = 11.0; // Default is 11 pts
        
        NSMutableArray *subviewStrings = [NSMutableArray array];
        NSMutableDictionary *views = [NSMutableDictionary dictionary];
        NSDictionary *metrics = @{@"padding": @(padding)};
        
        // Assign the image view's horizontal constraints
        if (_imageView.superview) {
            
            [subviewStrings addObject:@"imageView"];
            views[[subviewStrings lastObject]] = _imageView;
            
            [self addConstraint:[self equallyRelatedConstraintWithView:_imageView attribute:NSLayoutAttributeCenterX]];
        }
        
        // Assign the title label's horizontal constraints
    
            [subviewStrings addObject:@"titleLabel"];
            views[[subviewStrings lastObject]] = _titleLabel;
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[titleLabel(>=0)]-(padding@750)-|"
                                                                                     options:0 metrics:metrics views:views]];
    
        
        // Assign the button's horizontal constraints
    
            [subviewStrings addObject:@"button"];
            views[[subviewStrings lastObject]] = _button;
            
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(padding@750)-[button(>=0)]-(padding@750)-|"
                                                                                     options:0 metrics:metrics views:views]];
        
        
        NSMutableString *verticalFormat = [NSMutableString new];
        
        // Build a dynamic string format for the vertical constraints, adding a margin between each element. Default is 11 pts.
        for (int i = 0; i < subviewStrings.count; i++) {
            
            NSString *string = subviewStrings[i];
            [verticalFormat appendFormat:@"[%@]", string];
            
            if (i < subviewStrings.count-1) {
                [verticalFormat appendFormat:@"-(%.f@750)-", verticalSpace];
            }
        }
        
        // Assign the vertical constraints to the content view
        if (verticalFormat.length > 0) {
            [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"V:|%@|", verticalFormat]
                                                                                     options:0 metrics:metrics views:views]];
        }
    
}

- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [UIImageView new];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.userInteractionEnabled = NO;
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
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        _titleLabel.font = [UIFont systemFontOfSize:27.0];
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
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        _button.backgroundColor = [UIColor clearColor];
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _button.accessibilityIdentifier = @"empty set button";
        [_button setTitle:@"重新请求" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end

@interface HDCoverSetErrorView : HDCoverSetEmptyView

@end

@implementation HDCoverSetErrorView

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
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[activityView]|" options:0 metrics:nil views:@{@"activityView":self.activityView}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[activityView]|" options:0 metrics:nil views:@{@"activityView":self.activityView}]];

}

- (UIActivityIndicatorView *)activityView
{
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.translatesAutoresizingMaskIntoConstraints = NO;
        [_activityView startAnimating];
    }
    return _activityView;
}

@end


@interface HDCoverSetView : UIView

@property (nonatomic, assign) HDTableViewCoverType hd_tableViewCoverType;

@property (nonatomic, strong) HDCoverSetEmptyView *coverEmptyView;

@property (nonatomic, strong) HDCoverSetErrorView *coverErrorView;

@property (nonatomic, strong) HDCoverSetLodingView *coverLoadingView;

@property (nonatomic, weak) __kindof UIView *curCoverView;

@property (nonatomic, assign) CGFloat verticalOffset;
@property (nonatomic, assign) CGFloat verticalSpace;

- (void)setupConstraints;

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
        _coverLoadingView.translatesAutoresizingMaskIntoConstraints = NO;
        _coverLoadingView.backgroundColor = [UIColor clearColor];
        _coverLoadingView.userInteractionEnabled = YES;
        _coverLoadingView.alpha = 0;
    }
    return _coverLoadingView;
}

- (HDCoverSetEmptyView *)coverEmptyView
{
    if (!_coverEmptyView) {
        _coverEmptyView = [HDCoverSetEmptyView new];
        _coverEmptyView.translatesAutoresizingMaskIntoConstraints = NO;
        _coverEmptyView.backgroundColor = [UIColor whiteColor];
        _coverEmptyView.userInteractionEnabled = YES;
        _coverEmptyView.alpha = 0;
    }
    return _coverEmptyView;
}

- (HDCoverSetErrorView *)coverErrorView
{
    if (!_coverErrorView) {
        _coverErrorView = [HDCoverSetErrorView new];
        _coverErrorView.translatesAutoresizingMaskIntoConstraints = NO;
        _coverErrorView.backgroundColor = [UIColor clearColor];
        _coverErrorView.userInteractionEnabled = YES;
        _coverErrorView.alpha = 0;
    }
    return _coverErrorView;
}


#pragma mark - Setters



#pragma mark - Action Methods

- (void)didTapButton:(id)sender
{
    SEL selector = NSSelectorFromString(@"dzn_didTapDataButton:");
    
    if ([self.superview respondsToSelector:selector]) {
        [self.superview performSelector:selector withObject:sender afterDelay:0.0f];
    }
}

- (void)removeAllConstraints
{
    [self removeConstraints:self.constraints];
}


#pragma mark - Auto-Layout Configuration

- (void)setupConstraints
{
    // First, configure the content view constaints
    // The content view must alway be centered to its superview
    NSLayoutConstraint *centerXConstraint = [self equallyRelatedConstraintWithView:self.curCoverView attribute:NSLayoutAttributeCenterX];
    NSLayoutConstraint *centerYConstraint = [self equallyRelatedConstraintWithView:self.curCoverView attribute:NSLayoutAttributeCenterY];
    
    [self addConstraint:centerXConstraint];
    [self addConstraint:centerYConstraint];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[curCoverView]|" options:0 metrics:nil views:@{@"curCoverView": self.curCoverView}]];
    
    // When a custom offset is available, we adjust the vertical constraints' constants
    if (self.verticalOffset != 0 && self.constraints.count > 0) {
        centerYConstraint.constant = self.verticalOffset;
    }

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
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        view.hidden = YES;
        [self setCoverSetView:view];
    }
    return view;
}

-(void)setCoverSetView:(HDCoverSetView *)coverSetView{
    [self hd_setAssociatedRetainObject:coverSetView key:@selector(coverSetView)];
}

- (void) hd_coverType:(HDTableViewCoverType)coverType{
    if (self.hd_tableViewCoverType==coverType) {
        return;
    }
    
    if (coverType==HDTableViewCoverTypeNull) {
        [self.coverSetView removeFromSuperview];
        [self setCoverSetView:nil];
        self.scrollEnabled = YES;
    }else{
        [self.coverSetView configCoverType:coverType];
        if (!self.coverSetView.superview) {
            // Send the view all the way to the back, in case a header and/or footer is present, as well as for sectionHeaders or any other content
//            [self insertSubview:self.coverSetView atIndex:0];
            [self addSubview:self.coverSetView];

        }
        self.coverSetView.hidden = NO;
        self.coverSetView.clipsToBounds = YES;
        [self.coverSetView setupConstraints];
        HDWeakSelf;
        [UIView performWithoutAnimation:^{
            HDStrongSelf;
            [_self.coverSetView layoutIfNeeded];
        }];
        self.scrollEnabled = NO;

    }
}

- (void) hd_coverLoading{
    [self hd_coverType:HDTableViewCoverTypeLoading];
}

- (void) hd_coverEmpty{
    [self hd_coverType:HDTableViewCoverTypeEmpty];
}

- (void) hd_coverError{
    [self hd_coverType:HDTableViewCoverTypeError];
}

- (void) hd_coverDismiss{
    [self hd_coverType:HDTableViewCoverTypeNull];
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
