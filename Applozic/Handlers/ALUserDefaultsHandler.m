//
//  ALUserDefaultsHandler.m
//  ChatApp
//
//  Created by shaik riyaz on 12/08/15.
//  Copyright (c) 2015 AppLogic. All rights reserved.
//

#import "ALUserDefaultsHandler.h"
#define NOTIFICATION_TITLE @"NOTIFICATION_TITLE"

@implementation ALUserDefaultsHandler

+(void) setConversationContactImageVisibility:(BOOL)visibility
{
    
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:visibility forKey:CONVERSATION_CONTACT_IMAGE_VISIBILITY];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL) isConversationContactImageVisible
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:CONVERSATION_CONTACT_IMAGE_VISIBILITY];
}

+(void) setBottomTabBarHidden:(BOOL)visibleStatus
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:visibleStatus forKey:BOTTOM_TAB_BAR_VISIBLITY];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL) isBottomTabBarHidden
{
    BOOL flag = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:BOTTOM_TAB_BAR_VISIBLITY];
    if(flag)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(void) setNavigationRightButtonHidden:(BOOL)flagValue
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flagValue forKey:LOGOUT_BUTTON_VISIBLITY];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL) isNavigationRightButtonHidden
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:LOGOUT_BUTTON_VISIBLITY];
}

+(void) setBackButtonHidden:(BOOL)flagValue
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flagValue forKey:BACK_BTN_VISIBILITY_ON_CON_LIST];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL) isBackButtonHidden
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:BACK_BTN_VISIBILITY_ON_CON_LIST];
}

+(void) setApplicationKey:(NSString *)applicationKey
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:applicationKey forKey:APPLICATION_KEY];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *) getApplicationKey
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:APPLICATION_KEY];
}

+(BOOL) isLoggedIn
{
    return [ALUserDefaultsHandler getDeviceKeyString] != nil;
}

+(void) clearAll
{
    ALSLog(ALLoggerSeverityInfo, @"CLEARING_USER_DEFAULTS");
    NSDictionary * dictionary = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] dictionaryRepresentation];
    NSArray * keyArray = [dictionary allKeys];
    for(NSString * defaultKeyString in keyArray)
    {
        if([defaultKeyString hasPrefix:KEY_PREFIX] && ![defaultKeyString isEqualToString:APN_DEVICE_TOKEN])
        {
            [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] removeObjectForKey:defaultKeyString];
            [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
        }
    }
}

+(void) setApnDeviceToken:(NSString *)apnDeviceToken
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:apnDeviceToken forKey:APN_DEVICE_TOKEN];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString*) getApnDeviceToken
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:APN_DEVICE_TOKEN];
}

+(void) setEmailVerified:(BOOL)value
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:value forKey:EMAIL_VERIFIED];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(void) getEmailVerified
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey: EMAIL_VERIFIED];
}

// isConversationDbSynced

+(void)setBoolForKey_isConversationDbSynced:(BOOL)value
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:value forKey:CONVERSATION_DB_SYNCED];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)getBoolForKey_isConversationDbSynced
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:CONVERSATION_DB_SYNCED];
}

+(void)setEmailId:(NSString *)emailId
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:emailId forKey:EMAIL_ID];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getEmailId
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:EMAIL_ID];
}
    

+(void)setDisplayName:(NSString *)displayName
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:displayName forKey:DISPLAY_NAME];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getDisplayName
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:DISPLAY_NAME];
}

//deviceKey String
+(void)setDeviceKeyString:(NSString *)deviceKeyString
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:deviceKeyString forKey:DEVICE_KEY_STRING];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getDeviceKeyString{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:DEVICE_KEY_STRING];
}

+(void)setUserKeyString:(NSString *)suUserKeyString
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:suUserKeyString forKey:USER_KEY_STRING];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getUserKeyString
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:USER_KEY_STRING];
}

//LOGIN USER ID
+(void)setUserId:(NSString *)userId
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:userId forKey:USER_ID];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getUserId
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:USER_ID];
}

//LOGIN USER PASSWORD
+(void)setPassword:(NSString *)password
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:password forKey:USER_PASSWORD];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getPassword
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:USER_PASSWORD];
}

//last sync time
+(void)setLastSyncTime :( NSNumber *) lstSyncTime
{
    lstSyncTime = @([lstSyncTime doubleValue] + 1);
    ALSLog(ALLoggerSeverityInfo, @"saving last Sync time in the preference ...%@" ,lstSyncTime);
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setDouble:[lstSyncTime doubleValue] forKey:LAST_SYNC_TIME];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSNumber *)getLastSyncTime
{
   // NSNumber *timeStampObj = [NSNumber numberWithDouble: timeStamp];
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:LAST_SYNC_TIME];
}


+(void)setServerCallDoneForMSGList:(BOOL) value forContactId:(NSString*)contactId
{
    if(!contactId)
    {
        return;
    }
    
    NSString * key = [MSG_LIST_CALL_SUFIX stringByAppendingString: contactId];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:true forKey:key];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)isServerCallDoneForMSGList:(NSString *)contactId
{
    if(!contactId)
    {
        return true;
    }
    NSString * key = [MSG_LIST_CALL_SUFIX stringByAppendingString: contactId];
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:key];
}

+(void) setProcessedNotificationIds:(NSMutableArray*)arrayWithIds
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setObject:arrayWithIds forKey:PROCESSED_NOTIFICATION_IDS];
}

+(NSMutableArray*) getProcessedNotificationIds
{
    return [[[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] objectForKey:PROCESSED_NOTIFICATION_IDS] mutableCopy];
}

+(BOOL)isNotificationProcessd:(NSString*)withNotificationId
{
    NSMutableArray * mutableArray = [self getProcessedNotificationIds];
    
    if(mutableArray == nil)
    {
        mutableArray = [[NSMutableArray alloc]init];
    }
    
    BOOL isTheObjectThere = [mutableArray containsObject:withNotificationId];
    
    if (isTheObjectThere){
       // [mutableArray removeObject:withNotificationId];
    }else {
        [mutableArray addObject:withNotificationId];
    }
    //WE will just store 20 notificationIds for processing...
    if(mutableArray.count > 20)
    {
        [mutableArray removeObjectAtIndex:0];
    }
    [self setProcessedNotificationIds:mutableArray];
    return isTheObjectThere;
    
}

+(void) setLastSeenSyncTime :(NSNumber*) lastSeenTime
{
    ALSLog(ALLoggerSeverityInfo, @"saving last seen time in the preference ...%@" ,lastSeenTime);
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setDouble:[lastSeenTime doubleValue] forKey:LAST_SEEN_SYNC_TIME];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSNumber *) getLastSeenSyncTime
{
    NSNumber * timeStamp = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] objectForKey:LAST_SEEN_SYNC_TIME];
    return timeStamp ? timeStamp : [NSNumber numberWithInt:0];
}

+(void)setShowLoadEarlierOption:(BOOL) value forContactId:(NSString*)contactId
{
    if(!contactId)
    {
        return;
    }
    NSString *key = [SHOW_LOAD_ERLIER_MESSAGE stringByAppendingString:contactId];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:value forKey:key];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)isShowLoadEarlierOption:(NSString *)contactId
{
    if(!contactId)
    {
        return NO;
    }
    NSString *key = [SHOW_LOAD_ERLIER_MESSAGE stringByAppendingString:contactId];
    if ([[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:key])
    {
        return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:key];
    }
    else
    {
        return YES;
    }
    
}
//Notification settings...

+(void)setNotificationTitle:(NSString *)notificationTitle
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:notificationTitle forKey:NOTIFICATION_TITLE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getNotificationTitle
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:NOTIFICATION_TITLE];
}

+(void)setLastSyncChannelTime:(NSNumber *)lastSyncChannelTime
{
    lastSyncChannelTime = @([lastSyncChannelTime doubleValue] + 1);
    
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setDouble:[lastSyncChannelTime doubleValue] forKey:LAST_SYNC_CHANNEL_TIME];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSNumber *)getLastSyncChannelTime
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:LAST_SYNC_CHANNEL_TIME];
}

+(void)setUserBlockLastTimeStamp:(NSNumber *)lastTimeStamp
{
    lastTimeStamp = @([lastTimeStamp doubleValue] + 1);
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setDouble:[lastTimeStamp doubleValue] forKey:USER_BLOCK_LAST_TIMESTAMP];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSNumber *)getUserBlockLastTimeStamp
{
    NSNumber * lastSyncTimeStamp = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:USER_BLOCK_LAST_TIMESTAMP];
    if(!lastSyncTimeStamp)                      //FOR FIRST TIME USER
    {
        lastSyncTimeStamp = [NSNumber numberWithInt:1000];
    }
    
    return lastSyncTimeStamp;
}

//App Module Name
+(void )setAppModuleName:(NSString *)appModuleName
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:appModuleName forKey:APP_MODULE_NAME_ID];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getAppModuleName
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:APP_MODULE_NAME_ID];
}

+(void) setContactViewLoadStatus:(BOOL)status
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:status forKey:CONTACT_VIEW_LOADED];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL) getContactViewLoaded
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:CONTACT_VIEW_LOADED];
}

+(void)setServerCallDoneForUserInfo:(BOOL)value ForContact:(NSString *)contactId
{
    if(!contactId)
    {
        return;
    }
    
    NSString * key = [USER_INFO_API_CALLED_SUFFIX stringByAppendingString:contactId];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:value forKey:key];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)isServerCallDoneForUserInfoForContact:(NSString *)contactId
{
    if(!contactId)
    {
        return true;
    }
    
    NSString * key = [USER_INFO_API_CALLED_SUFFIX stringByAppendingString:contactId];
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:key];
}


+(void)setBASEURL:(NSString *)baseURL
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:baseURL forKey:APPLOZIC_BASE_URL];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getBASEURL
{
    NSString * kBaseUrl = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:APPLOZIC_BASE_URL];
    return (kBaseUrl && ![kBaseUrl isEqualToString:@""]) ? kBaseUrl : @"https://apps.applozic.com";
}

+(void)setMQTTURL:(NSString *)mqttURL
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:mqttURL forKey:APPLOZIC_MQTT_URL];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getMQTTURL
{
    NSString * kMqttUrl = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:APPLOZIC_MQTT_URL];
    return (kMqttUrl && ![kMqttUrl isEqualToString:@""]) ? kMqttUrl : @"apps.applozic.com";
}

+(void)setFILEURL:(NSString *)fileURL
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:fileURL forKey:APPLOZIC_FILE_URL];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getFILEURL
{
    if([ALApplozicSettings isS3StorageServiceEnabled]){
        return [self getBASEURL];
    }
    
    NSString * kFileUrl = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:APPLOZIC_FILE_URL];
    return (kFileUrl && ![kFileUrl isEqualToString:@""]) ? kFileUrl : @"https://applozic.appspot.com";
}

+(void)setMQTTPort:(NSString *)portNumber
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:portNumber forKey:APPLOZIC_MQTT_PORT];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getMQTTPort
{
    NSString * kPortNumber = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:APPLOZIC_MQTT_PORT];
    return (kPortNumber && ![kPortNumber isEqualToString:@""]) ? kPortNumber : @"1883";
}

+(void)setUserTypeId:(short)type
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:type forKey:USER_TYPE_ID];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(short)getUserTypeId{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:USER_TYPE_ID];
}

+(void)setLastMessageListTime:(NSNumber *)lastTime
{
    lastTime = @([lastTime doubleValue] + 1);
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setDouble:[lastTime doubleValue] forKey:MESSSAGE_LIST_LAST_TIME];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSNumber *)getLastMessageListTime
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:MESSSAGE_LIST_LAST_TIME];
}

+(void)setFlagForAllConversationFetched:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:ALL_CONVERSATION_FETCHED];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)getFlagForAllConversationFetched
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:ALL_CONVERSATION_FETCHED];
}

+(void)setFetchConversationPageSize:(NSInteger)limit
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:limit forKey:CONVERSATION_FETCH_PAGE_SIZE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSInteger)getFetchConversationPageSize
{
    NSInteger maxLimit = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:CONVERSATION_FETCH_PAGE_SIZE];
    return maxLimit ? maxLimit : 60;
}

+(void)setNotificationMode:(short)mode
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:mode forKey:NOTIFICATION_MODE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(short)getNotificationMode
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:NOTIFICATION_MODE];
}

+(void)setUserAuthenticationTypeId:(short)type
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:type forKey:USER_AUTHENTICATION_TYPE_ID];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(short)getUserAuthenticationTypeId
{
    short type = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:USER_AUTHENTICATION_TYPE_ID];
    return type ? type : 0;
}

+(void)setUnreadCountType:(short)mode
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:mode forKey:UNREAD_COUNT_TYPE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(short)getUnreadCountType
{
    short type = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:UNREAD_COUNT_TYPE];
    return type ? type : 0;
}

+(void)setMsgSyncRequired:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:MSG_SYN_CALL];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)isMsgSyncRequired
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:MSG_SYN_CALL];
}

+(void)setDebugLogsRequire:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:DEBUG_LOG_FLAG];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)isDebugLogsRequire
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:DEBUG_LOG_FLAG];
}

+(void)setLoginUserConatactVisibility:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:LOGIN_USER_CONTACT];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)getLoginUserConatactVisibility
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:LOGIN_USER_CONTACT];
}

+(void)setProfileImageLink:(NSString *)imageLink
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:imageLink forKey:LOGIN_USER_PROFILE_IMAGE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getProfileImageLink
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:LOGIN_USER_PROFILE_IMAGE];
}

+(void)setProfileImageLinkFromServer:(NSString *)imageLink
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:imageLink forKey:LOGIN_USER_PROFILE_IMAGE_SERVER];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getProfileImageLinkFromServer
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:LOGIN_USER_PROFILE_IMAGE_SERVER];
}

+(void)setLoggedInUserStatus:(NSString *)status
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:status forKey:LOGGEDIN_USER_STATUS];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getLoggedInUserStatus
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:LOGGEDIN_USER_STATUS];
}

+(BOOL)isUserLoggedInUserSubscribedMQTT
{
     return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:LOGIN_USER_SUBSCRIBED_MQTT];
}

+(void)setLoggedInUserSubscribedMQTT:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:LOGIN_USER_SUBSCRIBED_MQTT];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString *)getEncryptionKey
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:USER_ENCRYPTION_KEY];
}

+(void)setEncryptionKey:(NSString *)encrptionKey
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:encrptionKey forKey:USER_ENCRYPTION_KEY];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(void)setUserPricingPackage:(short)pricingPackage
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:pricingPackage forKey:USER_PRICING_PACKAGE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(short)getUserPricingPackage
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:USER_PRICING_PACKAGE];
}

+(void)setEnableEncryption:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:DEVICE_ENCRYPTION_ENABLE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)getEnableEncryption
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:DEVICE_ENCRYPTION_ENABLE];
}

+(void)setGoogleMapAPIKey:(NSString *)googleMapAPIKey
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:googleMapAPIKey forKey:GOOGLE_MAP_API_KEY];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString*)getGoogleMapAPIKey
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:GOOGLE_MAP_API_KEY];
}

+(NSString*)getNotificationSoundFileName
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:NOTIFICATION_SOUND_FILE_NAME];
}


+(void)setNotificationSoundFileName:(NSString *)notificationSoundFileName
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:notificationSoundFileName forKey:NOTIFICATION_SOUND_FILE_NAME];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(void)setContactServerCallIsDone:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:AL_CONTACT_SERVER_CALL_IS_DONE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)isContactServerCallIsDone
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:AL_CONTACT_SERVER_CALL_IS_DONE];
}

+(void)setContactScrollingIsInProgress:(BOOL)flag
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setBool:flag forKey:AL_CONTACT_SCROLLING_DONE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(BOOL)isContactScrollingIsInProgress
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] boolForKey:AL_CONTACT_SCROLLING_DONE];
}

+(void) setLastGroupFilterSyncTime: (NSNumber *) lastSyncTime
{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setDouble:[lastSyncTime doubleValue] forKey:GROUP_FILTER_LAST_SYNC_TIME];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}
+(NSNumber *)getLastGroupFilterSyncTIme
{
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:GROUP_FILTER_LAST_SYNC_TIME];

}

+(void)setUserRoleType:(short)type{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:type forKey:AL_USER_ROLE_TYPE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(short)getUserRoleType{
    
    short roleType = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:AL_USER_ROLE_TYPE];
    return roleType ? roleType : 3;
    
}

+(void)setPushNotificationFormat:(short)format{
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setInteger:format forKey:AL_USER_PUSH_NOTIFICATION_FORMATE];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(short)getPushNotificationFormat{
    short pushNotificationFormat = [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] integerForKey:AL_USER_PUSH_NOTIFICATION_FORMATE];
    return pushNotificationFormat ? pushNotificationFormat : 0;
}

+(void)setUserEncryption:(NSString*)encryptionKey{
    
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] setValue:encryptionKey forKey:USER_MQTT_ENCRYPTION_KEY];
    [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] synchronize];
}

+(NSString*)getUserEncryptionKey{
    
    return [[[NSUserDefaults alloc] initWithSuiteName:GROUP_APP_ID] valueForKey:USER_MQTT_ENCRYPTION_KEY];
}


@end
