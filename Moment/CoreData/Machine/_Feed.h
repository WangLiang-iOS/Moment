// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Feed.h instead.

#import <CoreData/CoreData.h>


extern const struct FeedAttributes {
	__unsafe_unretained NSString *context;
	__unsafe_unretained NSString *feedDate;
	__unsafe_unretained NSString *feedId;
	__unsafe_unretained NSString *photoUrl;
	__unsafe_unretained NSString *shareType;
} FeedAttributes;

extern const struct FeedRelationships {
} FeedRelationships;

extern const struct FeedFetchedProperties {
} FeedFetchedProperties;






@class NSObject;

@interface FeedID : NSManagedObjectID {}
@end

@interface _Feed : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (FeedID*)objectID;





@property (nonatomic, strong) NSString* context;



//- (BOOL)validateContext:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* feedDate;



//- (BOOL)validateFeedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* feedId;



@property int32_t feedIdValue;
- (int32_t)feedIdValue;
- (void)setFeedIdValue:(int32_t)value_;

//- (BOOL)validateFeedId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* photoUrl;



//- (BOOL)validatePhotoUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) id shareType;



//- (BOOL)validateShareType:(id*)value_ error:(NSError**)error_;






@end

@interface _Feed (CoreDataGeneratedAccessors)

@end

@interface _Feed (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContext;
- (void)setPrimitiveContext:(NSString*)value;




- (NSDate*)primitiveFeedDate;
- (void)setPrimitiveFeedDate:(NSDate*)value;




- (NSNumber*)primitiveFeedId;
- (void)setPrimitiveFeedId:(NSNumber*)value;

- (int32_t)primitiveFeedIdValue;
- (void)setPrimitiveFeedIdValue:(int32_t)value_;




- (NSString*)primitivePhotoUrl;
- (void)setPrimitivePhotoUrl:(NSString*)value;




- (id)primitiveShareType;
- (void)setPrimitiveShareType:(id)value;




@end
