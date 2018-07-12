// NSIndexSet+FBLFunctional.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSIndexSet (FBLFunctionalAdditions)

typedef void (^FBLFunctionalIndexSetEnumeratorBlock)(NSUInteger value);
typedef id __nullable (^FBLFunctionalIndexSetMapperBlock)(NSUInteger value);

- (NSArray *)fbl_map:(NS_NOESCAPE FBLFunctionalIndexSetMapperBlock)mapper NS_SWIFT_UNAVAILABLE("");

- (NSArray *)fbl_flatMap:(NS_NOESCAPE FBLFunctionalIndexSetMapperBlock)mapper
    NS_SWIFT_UNAVAILABLE("");

- (void)fbl_forEach:(NS_NOESCAPE FBLFunctionalIndexSetEnumeratorBlock)block
    NS_SWIFT_UNAVAILABLE("");

@end

NS_ASSUME_NONNULL_END
