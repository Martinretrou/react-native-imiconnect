
//
//  NSData+Encryption.m
//
//  Copyright © 2015 IMImobile. All rights reserved.
//

#import "NSData+Encryption.h"
#import <CommonCrypto/CommonCrypto.h>
#import <UIKit/UIKit.h>

static NSString *const EncryptionDomain = @"EncryptionDomain";

@implementation NSData (Encryption)

/**
 * Encrypts data with a password
 * @return the encrypted data
 */
- (NSData *)encryptDataWithPassword:(NSString *)password error:(NSError **)error
{
    NSData *key = [self keyForPassword:password salt:[self vendorIdentifier]];
    size_t outLength;
    NSMutableData *encryptedData = [NSMutableData dataWithLength:self.length + kCCBlockSizeAES128];
    CCCryptorStatus result = [self performCryptoOperation:kCCEncrypt
                                                  outData:encryptedData
                                                outLength:&outLength
                                                      key:key];
    if (result == kCCSuccess)
    {
        return encryptedData;
    }
    else
    {
        if(error)
        {
            *error = [NSError errorWithDomain:EncryptionDomain
                                         code:result
                                     userInfo:@{NSLocalizedDescriptionKey: @"Unable to perform encryption"}];
        }
        return nil;
    }
}

/**
 * Decrypts data with a password
 * @return the decrypted data
 */
- (NSData *)decryptDataWithPassword:(NSString *)password error:(NSError **)error {
    NSData *key = [self keyForPassword:password salt:[self vendorIdentifier]];
    size_t outLength;
    NSMutableData *decryptedData = [NSMutableData dataWithLength:self.length];
    CCCryptorStatus result = [self performCryptoOperation:kCCDecrypt
                                                  outData:decryptedData
                                                outLength:&outLength
                                                      key:key];
    if (result == kCCSuccess)
    {
        return decryptedData;
    }
    else
    {
        if(error)
        {
            *error = [NSError errorWithDomain:EncryptionDomain
                                         code:result
                                     userInfo:@{NSLocalizedDescriptionKey: @"Unable to perform decryption"}];
        }

        return nil;
    }
}

- (NSString *)vendorIdentifier
{
    // TO CHECK
#if !(TARGET_IPHONE_SIMULATOR)
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
#endif
    return @"vendorIdentifier";
}

/**
 * Retrieves a key which combines a password and a salt
 * @return the cryptographic key
 */
- (NSData *)keyForPassword:(NSString *)password
                      salt:(NSString *)salt
{
    NSMutableData *key = [NSMutableData dataWithLength:kCCKeySizeAES256];
    NSData *saltData = [salt dataUsingEncoding:NSUTF8StringEncoding];
    __unused int result = CCKeyDerivationPBKDF(kCCPBKDF2,
                                               password.UTF8String,
                                               password.length,
                                               saltData.bytes,
                                               saltData.length,
                                               kCCPRFHmacAlgSHA1,
                                               10000,
                                               key.mutableBytes,
                                               key.length);

    NSAssert(result == kCCSuccess, @"Unable to create  key; reason:", result);
    return key;
}

/**
 * Performs a cryptography operation
 * @return the cryptography status
 */
- (CCCryptorStatus)performCryptoOperation:(CCOperation)operation
                                  outData:(NSMutableData *)outData
                                outLength:(size_t *)outLength
                                      key:(NSData *)key
{
    CCCryptorStatus result = CCCrypt(operation,
                                     kCCAlgorithmAES128,
                                     kCCOptionPKCS7Padding,
                                     key.bytes,
                                     key.length,
                                     NULL,
                                     self.bytes,
                                     self.length,
                                     outData.mutableBytes,
                                     outData.length,
                                     outLength);

    outData.length = *outLength;
    return result;
}

@end
