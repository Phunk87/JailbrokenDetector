//
//  JailbrokenDetector.m
//  JailbrokenDetector
//
//  Created by 0dayZh on 15/3/11.
//  Copyright (c) 2015 0dayZh. All rights reserved.
//

#import "JailbrokenDetector.h"

@implementation JailbrokenDetector

+ (BOOL)isDeviceJailbroken {
    
#if !(TARGET_IPHONE_SIMULATOR)
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"]) {
        return YES;
    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
        return YES;
    } else if( [[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"]) {
        return YES;
    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"]) {
        return YES;
    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"]) {
        return YES;
    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"]) {
        return YES;
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]) {
        return YES;
    }
    
    FILE *f = fopen("/bin/bash", "r");
    if (f != NULL) {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/Applications/Cydia.app", "r");
    if (f != NULL) {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r");
    if (f != NULL) {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/usr/sbin/sshd", "r");
    if (f != NULL) {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/etc/apt", "r");
    if (f != NULL) {
        fclose(f);
        return YES;
    }
    fclose(f);
    
    NSError *error = nil;
    NSString *stringToBeWritten = @"This is a test.";
    [stringToBeWritten writeToFile:@"/private/jailbreak.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];
    
    if (!error) {
        return YES;
    }
    
#endif
    
    //All checks have failed. Most probably, the device is not jailbroken
    return NO;
}

@end
