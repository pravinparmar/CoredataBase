//
//  InputVC.h
//  CoredataBase
//
//  Created by Megha on 04/10/15.
//  Copyright (c) 2015 com.parmar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include "ViewController.h"
#import "InputVC.h"
#import "inputDelegate.h"






@interface InputVC : UIViewController<numberDelegate>{
    

//  __weak  id<inputProtocolDelegate>Inputdelegate;
}
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;

//@property (nonatomic,weak) id<inputProtocolDelegate>Inputdelegate;
//@property(nonatomic,strong) inputDelegate *delegate3;
//@property(nonatomic,strong) numb
@property (nonatomic,strong) id<numberDelegate>delegate1;

- (IBAction)Delete_Click:(id)sender;
- (IBAction)upDate_Click:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnUpdate;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (strong) NSManagedObject *device;
- (IBAction)Submit_click:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtNo;
@property (weak, nonatomic) IBOutlet UITextField *txtname;
@property (strong,nonatomic) NSString *strIndexNo,*strNo,*strName;
@property (assign,nonatomic)int number;





@end
