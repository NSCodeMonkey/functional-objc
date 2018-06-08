// NSIndexPath+FLBFunctional.h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSIndexPath (FBLFunctionalAdditions)

typedef void (^FBLFunctionalIndexPathEnumeratorBlock)(NSUInteger value);
typedef id __nullable (^FBLFunctionalIndexPathMapperBlock)(NSUInteger value);

- (NSArray *)fbl_flatMap:(NS_NOESCAPE FBLFunctionalIndexPathMapperBlock)mapper
    NS_SWIFT_UNAVAILABLE("");

- (void)fbl_forEach:(NS_NOESCAPE FBLFunctionalIndexPathEnumeratorBlock)block
    NS_SWIFT_UNAVAILABLE("");

- (NSArray *)fbl_map:(NS_NOESCAPE FBLFunctionalIndexPathMapperBlock)mapper NS_SWIFT_UNAVAILABLE("");

@end

NS_ASSUME_NONNULL_END
