//
//  ViewController.m
//  Objective-C_example
//
//  Created by 이찬호 on 2021/12/28.
//

#import "ViewController.h"
#import "WebServices.h"


@interface ViewController ()

@end

@implementation ViewController

NSString * mainstr;

NSMutableArray * address;
NSMutableArray * location;
NSMutableArray * imagearr;

NSDictionary * allResponse;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
}

- (IBAction)buttonEvent:(UIButton *)sender {
    [self requestdata];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSString *cellText = [NSString stringWithFormat:@"Row Number: %ld", (long)indexPath.row];
    
    [[cell textLabel] setText:cellText];
    
    return cell;
}


- (void)requestdata {
    mainstr = [NSString stringWithFormat:@"https://api.itbook.store/1.0/search/Swift/1"];
    
    [WebServices executequery:mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);
            
            address = [[NSMutableArray alloc]init];
            location = [[NSMutableArray alloc]init];
            imagearr = [[NSMutableArray alloc]init];
            
            allResponse = [maindic objectForKey:@"result"];
            
            for(NSDictionary * containDic in allResponse){
                NSString * loc = [containDic objectForKey:@"home_owner_location"];
                [location addObject:loc];
                //NSLog(@"loc: %@", loc);
                NSString * addr = [containDic objectForKey:@"home_owner_address"];
                [address addObject:addr];
               // NSLog(@"addr: %@", addr);
                
                NSString * img = [containDic objectForKey:@"home_owner_parking_image"];
                [imagearr addObject:img];
                NSLog(@"image: %@", img);
                
                
            }
            [self.tableview reloadData];
            
        }
    }];
}




@end
