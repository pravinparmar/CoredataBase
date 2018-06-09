//
//  ViewController.h
//  CoredataBase
//
//  Created by Megha on 03/10/15.
//  Copyright (c) 2015 com.parmar. All rights reserved.
//




#import <UIKit/UIKit.h>
#import "ViewController.h"
@protocol numberDelegate <NSObject>
@required
-(void)NumberCall;
@optional
-(void)NameCall;

@end
//@protocol numberDelegate;

#import "InputVC.h"

@interface ViewController : UIViewController{
   // id<numberDelegate> delegate;
}
- (IBAction)Add_Click:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UITableView *TableMain;
@property (strong,nonatomic) NSMutableArray *arrNo;
@property (strong,nonatomic) NSMutableArray *arrName;
@property (strong,nonatomic)NSMutableArray  *arrFetch;
@property (strong,nonatomic)IBOutlet UILabel *lbltitle;
@property (strong,nonatomic)id<numberDelegate>delegate;
@end


