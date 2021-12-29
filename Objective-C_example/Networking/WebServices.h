//
//  WebServices.h
//  Objective-C_example
//
//  Created by 이찬호 on 2021/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebServices : NSObject

+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void(^)(NSData *, NSError*))block;

@end

NS_ASSUME_NONNULL_END
