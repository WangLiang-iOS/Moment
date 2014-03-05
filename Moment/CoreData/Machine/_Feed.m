// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Feed.m instead.

#import "_Feed.h"

const struct FeedAttributes FeedAttributes = {
	.context = @"context",
	.feedDate = @"feedDate",
	.feedId = @"feedId",
	.photoUrl = @"photoUrl",
	.shareType = @"shareType",
};

const struct FeedRelationships FeedRelationships = {
};

const struct FeedFetchedProperties FeedFetchedProperties = {
};

@implementation FeedID
@end

@implementation _Feed

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Feed" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Feed";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Feed" inManagedObjectContext:moc_];
}

- (FeedID*)objectID {
	return (FeedID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"feedIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"feedId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic context;






@dynamic feedDate;






@dynamic feedId;



- (int32_t)feedIdValue {
	NSNumber *result = [self feedId];
	return [result intValue];
}

- (void)setFeedIdValue:(int32_t)value_ {
	[self setFeedId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveFeedIdValue {
	NSNumber *result = [self primitiveFeedId];
	return [result intValue];
}

- (void)setPrimitiveFeedIdValue:(int32_t)value_ {
	[self setPrimitiveFeedId:[NSNumber numberWithInt:value_]];
}





@dynamic photoUrl;






@dynamic shareType;











@end
