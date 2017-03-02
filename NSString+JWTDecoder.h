//
//  NSString+JWTDecoder.h
//
//  Created by Tyler Kuster on 3/2/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JWTDecoder)

+ (NSDictionary*)decodeJWTToken:(NSString*)jwtToken;
+ (NSString*)expirationEpochFromJWTToken:(NSString*)jwtToken;

@end
