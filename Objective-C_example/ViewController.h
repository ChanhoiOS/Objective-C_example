//
//  ViewController.h
//  Objective-C_example
//
//  Created by 이찬호 on 2021/12/28.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;


@end

