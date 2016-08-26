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
    NSString * strDeviceModel = [[self class] deviceModel];

    NSString * strDeviceModelName = [[self class] commonNameDictionary][strDeviceModel];

    if (nil == strDeviceModelName)
    {
        strDeviceModelName = strDeviceModel;
    }

    return strDeviceModelName;
}
 
+ (NSDictionary *)commonNameDictionary
{
    return @{
             @"i386" : @"Simulator",
             @"x86_64" : @"Simulator",
             
             @"iPhone1,1" : @"iPhone",
             @"iPhone1,2" : @"iPhone_3G",
             @"iPhone2,1" : @"iPhone_3GS",
             @"iPhone3,1" : @"iPhone_4",
             @"iPhone3,3" : @"iPhone_4(CDMA)",
             @"iPhone4,1" : @"iPhone_4S",
             @"iPhone5,1" : @"iPhone_5(GSM)",
             @"iPhone5,2" : @"iPhone_5(GSM+CDMA)",
             @"iPhone5,3" : @"iPhone_5c(GSM)",
             @"iPhone5,4" : @"iPhone_5c(GSM+CDMA)",
             @"iPhone6,1" : @"iPhone_5s(GSM)",
             @"iPhone6,2" : @"iPhone_5s(GSM+CDMA)",
             @"iPhone7,1" : @"iPhone_6_Plus",
             @"iPhone7,2" : @"iPhone_6",
             @"iPhone8,1" : @"iPhone_6s",
             @"iPhone8,2" : @"iPhone_6s_Plus",
             
             @"iPad1,1" : @"iPad",
             @"iPad2,1" : @"iPad_2(WiFi)",
             @"iPad2,2" : @"iPad_2(GSM)",
             @"iPad2,3" : @"iPad_2(CDMA)",
             @"iPad2,4" : @"iPad_2(WiFi Rev A)",
             @"iPad2,5" : @"iPad_Mini(WiFi)",
             @"iPad2,6" : @"iPad_Mini(GSM)",
             @"iPad2,7" : @"iPad_Mini(GSM+CDMA)",
             @"iPad3,1" : @"iPad_3(WiFi)",
             @"iPad3,2" : @"iPad_3(GSM+CDMA)",
             @"iPad3,3" : @"iPad_3(GSM)",
             @"iPad3,4" : @"iPad_4(WiFi)",
             @"iPad3,5" : @"iPad_4(GSM)",
             @"iPad3,6" : @"iPad_4(GSM+CDMA)",
             @"iPad4,1" : @"iPad_Air(Wi-Fi)",
             @"iPad4,2" : @"iPad_Air(Wi-Fi+Cellular)",
             @"iPad4,3" : @"iPad_Air(Wi-Fi+Cellular_CN)",
             @"iPad4,4" : @"iPad_Mini_Retina(Wi-Fi)",
             @"iPad4,5" : @"iPad_Mini_Retina(Wi-Fi+Cellular)",
             @"iPad4,6" : @"iPad_Mini_Retina(Wi-Fi+Cellular_CN)",
             @"iPad4,7" : @"iPad_mini_3_(Wi-Fi_Only)",
             @"iPad4,8" : @"iPad_mini_3_(Wi-Fi/Cellular)",
             @"iPad4,9" : @"iPad_mini_3_(Wi-Fi/Cellular)",
             @"iPad5,1" : @"iPad_mini_4_(Wi-Fi)",
             @"iPad5,2" : @"iPad_mini_4_(Wi-Fi+Cellular)",
             @"iPad5,3" : @"iPad_Air_2_(Wi-Fi_Only)",
             @"iPad5,4" : @"iPad_Air_2_(Wi-Fi/Cellular)",
             
             @"iPod1,1" : @"iPod_1st_Gen",
             @"iPod2,1" : @"iPod_2nd_Gen",
             @"iPod3,1" : @"iPod_3rd_Gen",
             @"iPod4,1" : @"iPod_4th_Gen",
             @"iPod5,1" : @"iPod_5th_Gen",
             
             @"AppleTV1,1" : @"Apple_TV",
             @"AppleTV2,1" : @"AppleTV(2nd_Gen)",
             @"AppleTV3,1" : @"AppleTV(3rd_Gen_Early_2012)",
             @"AppleTV3,2" : @"AppleTV(3rd_Gen_Early_2013)",
             };
}
 
@end
