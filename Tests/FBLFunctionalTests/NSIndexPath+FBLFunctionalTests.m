// NSIndexPath+FBLFunctionalTests.m

#import "NSIndexPath+FBLFunctional.h"

#import <XCTest/XCTest.h>

@interface NSIndexPathFBLFunctionalTests : XCTestCase
@end

@implementation NSIndexPathFBLFunctionalTests

- (void)testFlatMapIndexPath {
  // Arrange.
  NSUInteger indexes[6] = {3, 0, 1, 0, 5, 7};
  NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:indexes length:6];
  NSArray<NSNumber *> *expectedArray = @[ @3, @1, @5, @7 ];

  // Act.
  NSArray<NSNumber *> *resultingArray = [indexPath fbl_flatMap:^id(NSUInteger value) {
    return value > 0 ? @(value) : nil;
  }];

  // Assert.
  XCTAssertEqualObjects(resultingArray, expectedArray);
}

- (void)testForEachIndexPath {
  // Arrange.
  NSUInteger indexes[6] = {3, 0, 1, 0, 5, 7};
  NSIndexPath *originalIndexPath = [NSIndexPath indexPathWithIndexes:indexes length:6];
  __block NSIndexPath *expectedIndexPath = [[NSIndexPath alloc] init];

  // Act.
  [originalIndexPath fbl_forEach:^(NSUInteger value) {
    expectedIndexPath = [expectedIndexPath indexPathByAddingIndex:value];
  }];

  // Assert.
  XCTAssertEqualObjects(originalIndexPath, expectedIndexPath);
}

- (void)testMapIndexPath {
  // Arrange.
  NSUInteger indexes[6] = {3, 0, 1, 0, 5, 7};
  NSIndexPath *indexPath = [NSIndexPath indexPathWithIndexes:indexes length:6];
  NSArray<NSNumber *> *expectedArray = @[ @3, @0, @1, @0, @5, @7 ];

  // Act.
  NSArray<NSNumber *> *resultingArray = [indexPath fbl_map:^id(NSUInteger value) {
    return @(value);
  }];

  // Assert.
  XCTAssertEqualObjects(resultingArray, expectedArray);
}

@end
