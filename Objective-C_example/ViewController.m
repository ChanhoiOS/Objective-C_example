//
//  ViewController.m
//  Objective-C_example
//
//  Created by 이찬호 on 2021/12/28.
//

#import "ViewController.h"
#import "WebServices.h"
#import "bookTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

NSString * mainstr;

NSMutableArray * address;
NSMutableArray * location;
NSMutableArray * imagearr;

NSDictionary * allResponse;
NSDictionary * books;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    [_tableview registerNib:[UINib nibWithNibName:@"bookTableViewCell" bundle:nil]
     forCellReuseIdentifier:@"bookCell"];
    
    [self.tableview reloadData];
}

- (IBAction)buttonEvent:(UIButton *)sender {
    [self requestData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (unsigned long)allResponse.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"bookCell";
    bookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    NSString *title = [[[allResponse valueForKey:@"title"] objectAtIndex:indexPath.row]mutableCopy];
    
    cell.titleLabel.text = title;
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
    
    

    
//    NSMutableDictionary *response = [[[allResponse valueForKey:@"title"] objectAtIndex:indexPath.row]mutableCopy];
//    NSLog(@"table: %@",response);
    
//    NSString *cellText = [NSString stringWithFormat:@"title: %@", response];
//    
//    [[cell textLabel] setText:cellText];
    
    return cell;
}


- (void)requestData {
    mainstr = [NSString stringWithFormat:@"https://api.itbook.store/1.0/search/notebook/1"];
    
    [WebServices executequery:mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
        if (dbdata != nil) {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingMutableContainers error:nil];
            
            //address = [[NSMutableArray alloc]init];
           
            allResponse = [maindic objectForKey:@"books"];
            NSLog(@"books: %@", allResponse);
            
         
//             NSString *nameStr = [response valueForKey:@"name"];
//             NSString *emailIdStr = [response valueForKey:@"email"];
            
//            for(NSDictionary * book in allResponse) {
//                NSString * loc = [book objectForKey:@"home_owner_location"];
//                [location addObject:loc];
//                //NSLog(@"loc: %@", loc);
//                NSString * addr = [book objectForKey:@"home_owner_address"];
//                [address addObject:addr];
//               // NSLog(@"addr: %@", addr);
//
//                NSString * img = [book objectForKey:@"home_owner_parking_image"];
//                [imagearr addObject:img];
//                NSLog(@"image: %@", img);
//
//
//            }
            [self.tableview reloadData];
            
        }
    }];
}




@end
