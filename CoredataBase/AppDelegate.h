//
//  AppDelegate.h
//  CoredataBase
//
//  Created by Megha on 03/10/15.
//  Copyright (c) 2015 com.parmar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "InputVC.h"
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property(nonatomic,strong) AppDelegate *appDelegates1;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
+(AppDelegate *)instance;


@end

