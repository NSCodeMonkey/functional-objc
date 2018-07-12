// NSIndexSet+FBLFunctional.m

#import "NSIndexSet+FBLFunctional.h"

static NSArray *FBLIndexSetMap(NSIndexSet *indexSet, FBLFunctionalIndexSetMapperBlock mapper) {
  NSMutableArray *result = [[NSMutableArray alloc] init];
  [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *_Nonnull stop) {
    id mapped = mapper(idx);
    [result addObject:mapped ?: [NSNull null]];
  }];
  return result;
}

static NSArray *FBLIndexSetFlatMap(NSIndexSet *indexSet, FBLFunctionalIndexSetMapperBlock mapper) {
  NSMutableArray *result = [[NSMutableArray alloc] init];
  [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *_Nonnull stop) {
    id mapped = mapper(idx);
    if ([mapped isKindOfClass:[NSArray class]]) {
      [result addObjectsFromArray:mapped];
    } else if (mapped) {
      [result addObject:mapped];
    }
  }];
  return result;
}

static void FBLIndexSetForEach(NSIndexSet *indexSet, FBLFunctionalIndexSetEnumeratorBlock block) {
  [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *_Nonnull stop) {
    block(idx);
  }];
}

@implementation NSIndexSet (FBLFunctionalAdditions)

- (NSArray *)fbl_map:(NS_NOESCAPE FBLFunctionalIndexSetMapperBlock)mapper {
  NSParameterAssert(mapper);

  return FBLIndexSetMap(self, mapper);
}

- (NSArray *)fbl_flatMap:(NS_NOESCAPE FBLFunctionalIndexSetMapperBlock)mapper {
  NSParameterAssert(mapper);

  return FBLIndexSetFlatMap(self, mapper);
}

- (void)fbl_forEach:(NS_NOESCAPE FBLFunctionalIndexSetEnumeratorBlock)block {
  NSParameterAssert(block);

  FBLIndexSetForEach(self, block);
}

@end
