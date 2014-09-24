//
//  DeviceHardwareInfo.m
//
//  Common method to retrieve the device model version.
 
 
#import "DeviceHardwareInfo.h"
#include <sys/types.h>
#include <sys/sysctl.h>

//you can find new model name in
//http://www.everymac.com/ultimate-mac-lookup

 
@implementation DeviceHardwareInfo
 
+ (NSString *) deviceModel
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machineName = malloc(size);
    sysctlbyname("hw.machine", machineName, &size, NULL, 0);
    NSString *deviceModelName = [NSString stringWithUTF8String:machineName];
    free(machineName);
    return deviceModelName;
}
 
+ (NSString *) deviceModelString
{
    return [DeviceHardwareInfo commonNameDictionary][[DeviceHardwareInfo deviceModel]];
}
 
+ (NSDictionary *)commonNameDictionary
{
    return @{
             @"i386":     @"Simulator",
             @"x86_64":   @"Simulator",
             
             @"iPhone1,1":  @"iPhone",
             @"iPhone1,2":  @"iPhone 3G",
             @"iPhone2,1":  @"iPhone 3GS",
             @"iPhone3,1":  @"iPhone 4",
             @"iPhone3,3":  @"iPhone 4(CDMA)",
             @"iPhone4,1":  @"iPhone 4S",
             @"iPhone5,1":  @"iPhone 5(GSM)",
             @"iPhone5,2":  @"iPhone 5(GSM+CDMA)",
             @"iPhone5,3":  @"iPhone 5c(GSM)",
             @"iPhone5,4":  @"iPhone 5c(GSM+CDMA)",
             @"iPhone6,1":  @"iPhone 5s(GSM)",
             @"iPhone6,2":  @"iPhone 5s(GSM+CDMA)",
             @"iPhone7,1":  @"iPhone 6 Plus",
             @"iPhone7,2":  @"iPhone 6",

             @"iPad1,1":    @"iPad",
             @"iPad2,1":    @"iPad 2(WiFi)",
             @"iPad2,2":    @"iPad 2(GSM)",
             @"iPad2,3":    @"iPad 2(CDMA)",
             @"iPad2,4":    @"iPad 2(WiFi Rev A)",
             @"iPad2,5":    @"iPad Mini(WiFi)",
             @"iPad2,6":    @"iPad Mini(GSM)",
             @"iPad2,7":    @"iPad Mini(GSM+CDMA)",
             @"iPad3,1":    @"iPad 3(WiFi)",
             @"iPad3,2":    @"iPad 3(GSM+CDMA)",
             @"iPad3,3":    @"iPad 3(GSM)",
             @"iPad3,4":    @"iPad 4(WiFi)",
             @"iPad3,5":    @"iPad 4(GSM)",
             @"iPad3,6":    @"iPad 4(GSM+CDMA)",
             @"iPad4,1":    @"iPad Air(Wi-Fi)",
             @"iPad4,2":    @"iPad Air(Wi-Fi + Cellular)",
             @"iPad4,3":    @"iPad Air(Wi-Fi + Cellular CN)",
             @"iPad4,4":    @"iPad Mini Retina(Wi-Fi)",
             @"iPad4,5":    @"iPad Mini Retina(Wi-Fi + Cellular)",
             @"iPad4,6":    @"iPad Mini Retina(Wi-Fi + Cellular CN)",
             
             @"iPod1,1":    @"iPod 1st Gen",
             @"iPod2,1":    @"iPod 2nd Gen",
             @"iPod3,1":    @"iPod 3rd Gen",
             @"iPod4,1":    @"iPod 4th Gen",
             @"iPod5,1":    @"iPod 5th Gen",
             
             @"AppleTV1,1": @"Apple TV",
             @"AppleTV2,1": @"AppleTV(2nd Gen)",
             @"AppleTV3,1": @"AppleTV(3rd Gen Early 2012)",
             @"AppleTV3,2": @"AppleTV(3rd Gen Early 2013)",
             
             };
}
 
@end
