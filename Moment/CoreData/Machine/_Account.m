// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.m instead.

#import "_Account.h"

const struct AccountAttributes AccountAttributes = {
	.headData = @"headData",
	.token = @"token",
	.userId = @"userId",
	.userName = @"userName",
};

const struct AccountRelationships AccountRelationships = {
};

const struct AccountFetchedProperties AccountFetchedProperties = {
};

@implementation AccountID
@end

@implementation _Account

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Account";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Account" inManagedObjectContext:moc_];
}

- (AccountID*)objectID {
	return (AccountID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic headData;






@dynamic token;






@dynamic userId;






@dynamic userName;











@end
