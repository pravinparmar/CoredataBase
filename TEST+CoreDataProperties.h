//
//  TEST+CoreDataProperties.h
//  CoredataBase
//
//  Created by Megha on 04/11/17.
//  Copyright © 2017 com.parmar. All rights reserved.
//

#import "TEST+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TEST (CoreDataProperties)

+ (NSFetchRequest<TEST *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *no;
@property (nullable, nonatomic, copy) NSString *address;

@end

NS_ASSUME_NONNULL_END
