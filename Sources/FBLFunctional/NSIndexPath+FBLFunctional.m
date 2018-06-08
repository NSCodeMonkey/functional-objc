// NSIndexPath+FLBFunctional.m

#import "NSIndexPath+FBLFunctional.h"

static NSArray *FBLIndexPathMap(NSIndexPath *indexPath, FBLFunctionalIndexPathMapperBlock mapper) {
  NSMutableArray *result = [[NSMutableArray alloc] init];
  NSUInteger length = indexPath.length;
  for (NSUInteger i = 0; i < length; i++) {
    id mapped = mapper([indexPath indexAtPosition:i]);
    [result addObject:mapped];
  }
  return result;
}

static NSArray *FBLIndexPathFlatMap(NSIndexPath *indexPath,
                                    FBLFunctionalIndexPathMapperBlock mapper) {
  NSMutableArray *result = [[NSMutableArray alloc] init];
  NSUInteger length = indexPath.length;
  for (NSUInteger i = 0; i < length; i++) {
    id mapped = mapper([indexPath indexAtPosition:i]);
    if ([mapped isKindOfClass:[NSArray class]]) {
      [result addObjectsFromArray:mapped];
    } else if (mapped) {
      [result addObject:mapped];
    }
  }
  return result;
}

static void FBLIndexPathForEach(NSIndexPath *indexPath,
                                FBLFunctionalIndexPathEnumeratorBlock block) {
  NSUInteger length = indexPath.length;
  for (NSUInteger i = 0; i < length; i++) {
    block([indexPath indexAtPosition:i]);
  }
}

@implementation NSIndexPath (FBLFunctionalAdditions)

- (NSArray *)fbl_flatMap:(NS_NOESCAPE FBLFunctionalIndexPathMapperBlock)mapper {
  NSParameterAssert(mapper);

  return FBLIndexPathFlatMap(self, mapper);
}

- (void)fbl_forEach:(NS_NOESCAPE FBLFunctionalIndexPathEnumeratorBlock)block {
  NSParameterAssert(block);

  FBLIndexPathForEach(self, block);
}

- (NSArray *)fbl_map:(NS_NOESCAPE FBLFunctionalIndexPathMapperBlock)mapper {
  NSParameterAssert(mapper);

  return FBLIndexPathMap(self, mapper);
}

@end
