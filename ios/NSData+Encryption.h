
//
//  NSData+Encryption.h
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)

/**
 * Encrypts data with a password
 * @return the encrypted data
 */
- (NSData *)encryptDataWithPassword:(NSString *)password
                              error:(NSError **)error;

/**
 * Decrypts data with a password
 * @return the decrypted data
 */
- (NSData *)decryptDataWithPassword:(NSString *)password
                              error:(NSError **)error;


@end
