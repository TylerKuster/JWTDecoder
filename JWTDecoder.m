//
//  JWTDecoder.m
//  Helios
//
//  Created by Tyler Kuster on 3/2/17.
//  Copyright © 2017 Tyler Kuster. All rights reserved.
//

#import "JWTDecoder.h"

@implementation JWTDecoder

+ (NSDictionary*)decodeJWTToken:(NSString*)jwtToken
{
    NSArray* segments = [jwtToken componentsSeparatedByString:@"."];
    NSString* base64String = [segments objectAtIndex:1]; // (Header, Payload, Signature)
    
    int requiredLength = (int)(4 * ceil((float)[base64String length] / 4.0));
    NSUInteger nbrPaddings = requiredLength - [base64String length];
    
    if (nbrPaddings > 0)
    {
        NSString *padding = [[NSString string] stringByPaddingToLength:nbrPaddings
                                                            withString:@"="
                                                       startingAtIndex:0];
        
        base64String = [base64String stringByAppendingString:padding];
    }
    
    base64String = [base64String stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    base64String = [base64String stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    
    NSData* decodedData = [[NSData alloc] initWithBase64EncodedString:base64String
                                                              options:0];
    
    NSString* decodedString = [[NSString alloc] initWithData:decodedData
                                                    encoding:NSUTF8StringEncoding];
    
    NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:[decodedString dataUsingEncoding:NSUTF8StringEncoding]
                                                                   options:0
                                                                     error:nil];
    
    return jsonDictionary;
}

+ (NSString*)expirationEpochFromJWTToken:(NSString*)jwtToken
{
    NSDictionary* decodedJWT = [JWTDecoder decodeJWTToken:jwtToken];
    
    return [NSString stringWithFormat:@"%@", [decodedJWT objectForKey:@"exp"]];
}

@end
