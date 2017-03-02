# JWTDecoder
A simple class to decode a JWT token into a dictionary and/or extract the expiration date epoch.

## Decode JWT token payload and return JSON dictionary

```
NSString* token = @"...";

NSDictionary* decodedDictionary = [JWTDecoder decodePayloadFromJWTToken:token]; 

```

## Decode JWT token payload and return the token expiration date epoch

```
NSString* token = @"...";

NSString* expirationEpoch = [JWTDecoder expirationEpochFromJWTToken:token]; 

```
