//
//  bookTableViewCell.h
//  Objective-C_example
//
//  Created by 이찬호 on 2021/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface bookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UILabel *registerNumber;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


@end

NS_ASSUME_NONNULL_END
