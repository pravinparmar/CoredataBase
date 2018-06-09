//
//  InputVC.m
//  CoredataBase
//
//  Created by Megha on 04/10/15.
//  Copyright (c) 2015 com.parmar. All rights reserved.
//

#import "InputVC.h"

@interface InputVC ()

@end

@implementation InputVC
@synthesize strIndexNo,strName,strNo;


- (void)viewDidLoad {
   //
    if (self.delegate1 && [self.delegate1 respondsToSelector:@selector(NumberCall) ]) {
        [self.delegate1 NumberCall];
    }
    //[self.delegate1 ]
    
//    self.delegate3=[[inputDelegate alloc]init ];
//    self.delegate3.inputdelegate1=self;
//     [self.delegate3  respondsToSelector:@selector(compliteDone)];
  
    //[self NumberCall];
    [super viewDidLoad];
    self.txtname.text=strName;
    self.txtNo.text=strNo;
    NSLog(@"Index Number %@",strIndexNo);
   // [sliderDelegate respondsToSelector:@selector(MTSliderDidChange:withValue:)
//    if (self.device) {
//        [self.txtname setText:[self.device valueForKey:@"name"]];
//        [self.txtNo setText:[self.device valueForKey:@"no"]];
//    }
    // Do any additional setup after loading the view.
}
-(void)NumberCall{
    NSLog(@"number call111 inputVC ");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Submit_click:(id)sender {
    
    NSManagedObjectContext *context = [[AppDelegate  instance] managedObjectContext ];
    if (self.device) {
        // Update existing device
        [self.device setValue:self.txtname.text forKey:@"name"];
        [self.device setValue:self.txtNo.text forKey:@"no"];
       
        
    } else {
        // Create a new device
        
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"TEST" inManagedObjectContext:context];
        [newDevice setValue:self.txtname.text forKey:@"name"];
        [newDevice setValue:self.txtNo.text forKey:@"no"];
        [newDevice  setValue:@"jam" forKey:@"address"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    else{
        NSLog(@" Insert record success fully");
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

//Delete Record
- (IBAction)Delete_Click:(id)sender {
    
    NSManagedObjectContext *managedObjectContext = [[AppDelegate instance] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"TEST"];
    //self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSError *error;
    
    NSArray  *arrfecth= [managedObjectContext executeFetchRequest:fetchRequest error:&error];

    NSManagedObject *deleteValue = (NSManagedObject *)[arrfecth objectAtIndex:[self.strIndexNo integerValue]];
    
    [managedObjectContext deleteObject:deleteValue];
    
    NSError *deleteError = nil;
    if (![deleteValue.managedObjectContext save:&deleteError]) {
        
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", deleteError, deleteError.localizedDescription);
    }
    else{
        NSLog(@" Delete record  %@",self.strNo);
        
    }
    [self .navigationController popToRootViewControllerAnimated:YES];
    
    
}
//Update Record
- (IBAction)upDate_Click:(id)sender {
    NSManagedObjectContext *managedObjectContext = [[AppDelegate instance] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"TEST"];
    //self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSError *error;
    
    NSArray  *arrfecth= [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    NSManagedObject *updateValue = (NSManagedObject *)[arrfecth objectAtIndex:[self.strIndexNo integerValue]];
    //NSManagedObject *person = (NSManagedObject *)[result objectAtIndex:0];

    NSError *updateError = nil;
    if (![updateValue.managedObjectContext save:&updateError]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", updateError,updateError.localizedDescription);
    }
    else{
        [updateValue setValue:self.txtNo.text forKey:@"no"];
        [updateValue setValue:self.txtname.text forKey:@"name"];
        NSLog(@"Update Record Success fully %@",strIndexNo);
    }
   // [managedObjectContext deleteObject:deleteValue];
//    
//    NSError *deleteError = nil;
//    if (![deleteValue.managedObjectContext save:&deleteError]) {
//        
//        NSLog(@"Unable to save managed object context.");
//        NSLog(@"%@, %@", deleteError, deleteError.localizedDescription);
//    }
//    else{
//        NSLog(@" Delete record  %@",self.strNo);
//        
//    }
    [self .navigationController popToRootViewControllerAnimated:YES];

}

@end
