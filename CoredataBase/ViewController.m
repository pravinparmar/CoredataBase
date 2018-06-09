//
//  ViewController.m
//  CoredataBase
//
//  Created by Megha on 03/10/15.
//  Copyright (c) 2015 com.parmar. All rights reserved.
//

#import "ViewController.h"
#import "CustomeCell.h"





@interface ViewController ()

@end

@implementation ViewController
@synthesize delegate;

#pragma mark-UIView Method
- (void)viewDidLoad {
    [super viewDidLoad];
    
   //self.delegate=[de]
//    self.Delegate2=[[inputDelegate alloc]init ];
//    self.Delegate2.inputdelegate1=self;
//    [self.Delegate2  respondsToSelector:@selector(compliteDone)];
    
    
     self.arrFetch=[[NSMutableArray alloc]init ];
     self.arrNo=[[NSMutableArray alloc]init ];
     self.arrName=[[NSMutableArray alloc]init];
     self.lbltitle.text=@"10";
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidDisappear:(BOOL)animated{
    //self.lbltitle.text=@"20";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)NumberCall{
    self.lbltitle.text=@"500";
}
-(void)NameCall{
    self.lbltitle.text=@"ABC";
}
//-(void)viewWillAppear:(BOOL)animated{
//    self.lbltitle.text=@"10";
//}
-(void)viewWillAppear:(BOOL)animated{
    
     //self.lbltitle.text=@"10";
    [self fetchData_inCoreDataBase];
    
   
    
  
}
-(void)fetchData_inCoreDataBase{
    
    [self.arrName removeAllObjects];
     [self.arrNo removeAllObjects];
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [[AppDelegate instance] managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"TEST"];
    //self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSError *error;
    NSArray  *arrfecth= [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    // NSArray  arr*AA
    // NSLog(@"Data %@",self.devices);
    self.arrFetch=[NSMutableArray arrayWithArray:arrfecth];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        NSLog(@"array Record %@", self.arrFetch);
        
        for (NSDictionary *dict in self.arrFetch) {
             [self.arrName addObject:[dict valueForKey:@"name"]];
             [self.arrNo addObject:[dict valueForKey:@"no"]];
     //       NSLog(@"\n Name:- %@  NO :-%@",name,No);
            
        }
    }
    [self.TableMain reloadData];
}
#pragma mark-UITableDelegates
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.arrFetch  count];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellID=@"CustomeCell";
    
    CustomeCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    cell.lblName.text=[self.arrName objectAtIndex:indexPath.row];
    cell.lblNo.text=[self.arrNo objectAtIndex:indexPath.row];
    cell.backgroundColor=[UIColor  grayColor];
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    //CustomeCell
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *strno=[NSString  stringWithFormat:@"%ld",indexPath.row];
    
    
    InputVC *VC=[self.storyboard instantiateViewControllerWithIdentifier:@"InputVC"];
    VC.strNo=[self.arrNo objectAtIndex:indexPath.row];
    VC.strName=[self.arrName objectAtIndex:indexPath.row];
     VC.strIndexNo=strno;
    
    
    
    [self.navigationController pushViewController:VC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
    
}


- (IBAction)Add_Click:(id)sender {
    InputVC *VC=[self.storyboard instantiateViewControllerWithIdentifier:@"InputVC"];
    [self.navigationController pushViewController:VC animated:YES];
    
}
-(void)compliteDone{
    
    self.lbltitle.text=@"20";
}
@end
