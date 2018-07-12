// NSIndexSet+FBLFunctionalTests.m

#import "NSIndexSet+FBLFunctional.h"

#import <XCTest/XCTest.h>

@interface NSIndexSetFBLFunctionalTests : XCTestCase
@end

@implementation NSIndexSetFBLFunctionalTests

- (void)testFlatMapIndexSet {
  // Arrange.
  NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 6)];
  NSArray<NSNumber *> *expectedArray = @[ @1, @3, @5 ];

  // Act.
  NSArray<NSNumber *> *resultingArray = [indexSet fbl_flatMap:^id _Nullable(NSUInteger value) {
    return value % 2 != 0 ? @(value) : nil;
  }];

  // Assert.
  XCTAssertEqualObjects(resultingArray, expectedArray);
}

- (void)testForEachIndexPath {
  // Arrange.
  NSIndexSet *originalIndexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 6)];
  NSMutableIndexSet *expectedIndexSet = [NSMutableIndexSet indexSet];

  // Act.
  [originalIndexSet fbl_forEach:^(NSUInteger value) {
    [expectedIndexSet addIndex:value];
  }];

  // Assert.
  XCTAssertEqualObjects(originalIndexSet, expectedIndexSet);
}

- (void)testMapIndexPath {
  // Arrange.
  NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 6)];
  NSArray<NSNumber *> *expectedArray = @[ @0, @1, @2, @3, @4, @5 ];

  // Act.
  NSArray<NSNumber *> *resultingArray = [indexSet fbl_map:^id _Nullable(NSUInteger value) {
    return @(value);
  }];

  // Assert.
  XCTAssertEqualObjects(resultingArray, expectedArray);
}

@end
