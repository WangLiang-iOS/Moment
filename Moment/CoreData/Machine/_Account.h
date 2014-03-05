// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.h instead.

#import <CoreData/CoreData.h>


extern const struct AccountAttributes {
	__unsafe_unretained NSString *headData;
	__unsafe_unretained NSString *token;
	__unsafe_unretained NSString *userId;
	__unsafe_unretained NSString *userName;
} AccountAttributes;

extern const struct AccountRelationships {
} AccountRelationships;

extern const struct AccountFetchedProperties {
} AccountFetchedProperties;







@interface AccountID : NSManagedObjectID {}
@end

@interface _Account : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AccountID*)objectID;





@property (nonatomic, strong) NSData* headData;



//- (BOOL)validateHeadData:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* token;



//- (BOOL)validateToken:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userId;



//- (BOOL)validateUserId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* userName;



//- (BOOL)validateUserName:(id*)value_ error:(NSError**)error_;






@end

@interface _Account (CoreDataGeneratedAccessors)

@end

@interface _Account (CoreDataGeneratedPrimitiveAccessors)


- (NSData*)primitiveHeadData;
- (void)setPrimitiveHeadData:(NSData*)value;




- (NSString*)primitiveToken;
- (void)setPrimitiveToken:(NSString*)value;




- (NSString*)primitiveUserId;
- (void)setPrimitiveUserId:(NSString*)value;




- (NSString*)primitiveUserName;
- (void)setPrimitiveUserName:(NSString*)value;




@end
