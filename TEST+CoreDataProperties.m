//
//  TEST+CoreDataProperties.m
//  CoredataBase
//
//  Created by Megha on 04/11/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

#import "TEST+CoreDataProperties.h"

@implementation TEST (CoreDataProperties)

+ (NSFetchRequest<TEST *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TEST"];
}

@dynamic name;
@dynamic no;
@dynamic address;

@end
