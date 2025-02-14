//
//  OIMCallbacker.m
//  OpenIMSDK
//
//  Created by x on 2021/2/11.
//

#import "OIMCallbacker.h"
#import "OIMGCDMulticastDelegate.h"

@interface OIMCallbacker ()
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMSDKListener> *sdkListeners;
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMFriendshipListener> *friendshipListeners;
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMGroupListener> *groupListeners;
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMConversationListener> *conversationListeners;
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMAdvancedMsgListener> *advancedMsgListeners;
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMSignalingListener> *signalingListeners;
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMOrganizationListener> *organizationListeners;
@property (nonatomic, strong) OIMGCDMulticastDelegate <OIMWorkMomentsListener> *workMomentsListeners;

@end

@implementation OIMCallbacker

+ (instancetype)callbacker {
    return [OIMCallbacker new];
}

- (void)setListener {
    Open_im_sdkSetUserListener(self);
    Open_im_sdkSetFriendListener(self);
    Open_im_sdkSetGroupListener(self);
    Open_im_sdkSetConversationListener(self);
    Open_im_sdkSetAdvancedMsgListener(self);
    Open_im_sdkSetSignalingListener(self);
    Open_im_sdkSetOrganizationListener(self);
    Open_im_sdkSetWorkMomentsListener(self);
}

- (void)dispatchMainThread:(void (NS_NOESCAPE ^)(void))todo {
    if ([NSThread isMainThread]) {
        todo();
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            todo();
        });
    }
}

#pragma mark -
#pragma mark - Listeners getter

- (OIMGCDMulticastDelegate<OIMSDKListener> *)sdkListeners {
    if (_sdkListeners == nil) {
        _sdkListeners = (OIMGCDMulticastDelegate <OIMSDKListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    return _sdkListeners;
}

- (OIMGCDMulticastDelegate<OIMFriendshipListener> *)friendshipListeners {
    if (_friendshipListeners == nil) {
        _friendshipListeners = (OIMGCDMulticastDelegate <OIMFriendshipListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    return _friendshipListeners;
}

- (OIMGCDMulticastDelegate<OIMGroupListener> *)groupListeners {
    if (_groupListeners == nil) {
        _groupListeners = (OIMGCDMulticastDelegate <OIMGroupListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    return _groupListeners;
}

- (OIMGCDMulticastDelegate<OIMConversationListener> *)conversationListeners {
    if (_conversationListeners == nil) {
        _conversationListeners = (OIMGCDMulticastDelegate <OIMConversationListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    return _conversationListeners;
}

- (OIMGCDMulticastDelegate<OIMAdvancedMsgListener> *)advancedMsgListeners {
    if (_advancedMsgListeners == nil) {
        _advancedMsgListeners = (OIMGCDMulticastDelegate <OIMAdvancedMsgListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    return _advancedMsgListeners;
}

- (OIMGCDMulticastDelegate<OIMSignalingListener> *)signalingListeners {
    if (_signalingListeners == nil) {
        _signalingListeners = (OIMGCDMulticastDelegate <OIMSignalingListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    
    return _signalingListeners;
}

- (OIMGCDMulticastDelegate<OIMOrganizationListener> *)organizationListeners {
    if (_organizationListeners == nil) {
        _organizationListeners = (OIMGCDMulticastDelegate <OIMOrganizationListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    
    return _organizationListeners;
}

- (OIMGCDMulticastDelegate<OIMWorkMomentsListener> *)workMomentsListeners {
    if (_workMomentsListeners == nil) {
        _workMomentsListeners = (OIMGCDMulticastDelegate <OIMWorkMomentsListener> *)[[OIMGCDMulticastDelegate alloc] init];
    }
    
    return _workMomentsListeners;
}

#pragma mark -
#pragma mark - Add/Remove listener

- (void)addIMSDKListener:(id<OIMSDKListener>)listener {
    [self.sdkListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeIMSDKListener:(id<OIMSDKListener>)listener {
    [self.sdkListeners removeDelegate:listener];
}

- (void)addFriendListener:(id<OIMFriendshipListener>)listener {
    [self.friendshipListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeFriendListener:(id<OIMFriendshipListener>)listener {
    [self.friendshipListeners removeDelegate:listener];
}

- (void)addGroupListener:(id<OIMGroupListener>)listener {
    [self.groupListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeGroupListener:(id<OIMGroupListener>)listener {
    [self.groupListeners removeDelegate:listener];
}

- (void)addConversationListener:(id<OIMConversationListener>)listener {
    [self.conversationListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeConversationListener:(id<OIMConversationListener>)listener {
    [self.conversationListeners removeDelegate:listener];
}

- (void)addAdvancedMsgListener:(id<OIMAdvancedMsgListener>)listener {
    [self.advancedMsgListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeAdvancedMsgListener:(id<OIMAdvancedMsgListener>)listener {
    [self.advancedMsgListeners removeDelegate:listener];
}

- (void)addSignalingListener:(id<OIMSignalingListener>)listener {
    [self.signalingListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeSignalingListener:(id<OIMSignalingListener>)listener {
    [self.signalingListeners removeDelegate:listener];
}

- (void)addOrganizationListener:(id<OIMOrganizationListener>)listener{
    [self.organizationListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeOrganizationListener:(id<OIMOrganizationListener>)listener {
    [self.organizationListeners removeDelegate:listener];
}

- (void)addWorkMomentsListener:(id<OIMWorkMomentsListener>)listener {
    [self.workMomentsListeners addDelegate:listener delegateQueue:dispatch_get_main_queue()];
}

- (void)removeWorkMomentsListener:(id<OIMWorkMomentsListener>)listener {
    [self.workMomentsListeners removeDelegate:listener];
}

#pragma mark -
#pragma mark - Connection

- (void)onConnectFailed:(int32_t)errCode errMsg:(NSString * _Nullable)errMsg {
    
    [self dispatchMainThread:^{
        if (self.connectFailure) {
            self.connectFailure(errCode, errMsg);
        }
        
        [self.sdkListeners onConnectFailed:errCode err:errMsg];
    }];
}

- (void)onConnectSuccess {
    [self dispatchMainThread:^{
        if (self.connectSuccess) {
            self.connectSuccess();
        }
        
        [self.sdkListeners onConnectSuccess];
    }];
}

- (void)onConnecting {
    [self dispatchMainThread:^{
        if (self.connecting) {
            self.connecting();
        }

        [self.sdkListeners onConnecting];
    }];
}

- (void)onKickedOffline {
    [self dispatchMainThread:^{
        if (self.kickedOffline) {
            self.kickedOffline();
        }
        
        [self.sdkListeners onKickedOffline];
    }];
}

- (void)onUserTokenExpired {
    [self dispatchMainThread:^{
        if (self.userTokenExpired) {
            self.userTokenExpired();
        }

        [self.sdkListeners onUserTokenExpired];
    }];
}

#pragma mark -
#pragma mark - User

- (void)onSelfInfoUpdated:(NSString * _Nullable)userInfo {
    
    [self dispatchMainThread:^{
        if (self.onSelfInfoUpdated) {
            self.onSelfInfoUpdated([OIMUserInfo mj_objectWithKeyValues:userInfo]);
        }
    }];
}

#pragma mark -
#pragma mark - Friend

- (void)onFriendApplicationAdded:(NSString * _Nullable)friendApplication {
    OIMFriendApplication *info = [OIMFriendApplication mj_objectWithKeyValues:friendApplication];
    
    [self dispatchMainThread:^{
        if (self.onFriendApplicationAdded) {
            self.onFriendApplicationAdded(info);
        }
        [self.friendshipListeners onFriendApplicationAdded:info];
    }];
}

- (void)onFriendApplicationRejected:(NSString * _Nullable)friendApplication {
    OIMFriendApplication *info = [OIMFriendApplication mj_objectWithKeyValues:friendApplication];
    
    [self dispatchMainThread:^{
        if (self.onFriendApplicationRejected) {
            self.onFriendApplicationRejected(info);
        }
        [self.friendshipListeners onFriendApplicationRejected:info];
    }];
}

- (void)onFriendApplicationAccepted:(NSString * _Nullable)friendApplication {
    OIMFriendApplication *info = [OIMFriendApplication mj_objectWithKeyValues:friendApplication];
    
    [self dispatchMainThread:^{
        if (self.onFriendApplicationDeleted) {
            self.onFriendApplicationDeleted(info);
        }
        [self.friendshipListeners onFriendApplicationAccepted:info];
    }];
}

- (void)onFriendApplicationDeleted:(NSString * _Nullable)friendApplication {
    OIMFriendApplication *info = [OIMFriendApplication mj_objectWithKeyValues:friendApplication];

    [self dispatchMainThread:^{
        if (self.onFriendApplicationDeleted) {
            self.onFriendApplicationDeleted(info);
        }
        [self.friendshipListeners onFriendApplicationDeleted:info];
    }];
}

- (void)onFriendAdded:(NSString * _Nullable)friendInfo {
    OIMFriendInfo *info = [OIMFriendInfo mj_objectWithKeyValues:friendInfo];
    
    [self dispatchMainThread:^{
        if (self.onFriendAdded) {
            self.onFriendAdded(info);
        }
        [self.friendshipListeners onFriendAdded:info];
    }];
}

- (void)onFriendDeleted:(NSString * _Nullable)friendInfo {
    OIMFriendInfo *info = [OIMFriendInfo mj_objectWithKeyValues:friendInfo];
    
    [self dispatchMainThread:^{
        if (self.onFriendAdded) {
            self.onFriendAdded(info);
        }
        [self.friendshipListeners onFriendDeleted:info];
    }];
}

- (void)onFriendInfoChanged:(NSString * _Nullable)friendInfo {
    OIMFriendInfo *info = [OIMFriendInfo mj_objectWithKeyValues:friendInfo];
    
    [self dispatchMainThread:^{
        if (self.onFriendAdded) {
            self.onFriendAdded(info);
        }
        [self.friendshipListeners onFriendInfoChanged:info];
    }];
}

- (void)onBlackAdded:(NSString* _Nullable)blackInfo {
    OIMBlackInfo *info = [OIMBlackInfo mj_objectWithKeyValues:blackInfo];
    
    [self dispatchMainThread:^{
        if (self.onBlackAdded) {
            self.onBlackAdded(info);
        }
        [self.friendshipListeners onBlackAdded:info];
    }];
}

- (void)onBlackDeleted:(NSString * _Nullable)blackInfo {
    OIMBlackInfo *info = [OIMBlackInfo mj_objectWithKeyValues:blackInfo];
    
    [self dispatchMainThread:^{
        if (self.onBlackAdded) {
            self.onBlackAdded(info);
        }
        [self.friendshipListeners onBlackDeleted:info];
    }];
}

#pragma mark -
#pragma mark - Group

- (void)onGroupMemberAdded:(NSString * _Nullable)groupMemberInfo {
    OIMGroupMemberInfo *info = [OIMGroupMemberInfo mj_objectWithKeyValues:groupMemberInfo];
    
    [self dispatchMainThread:^{
        if (self.onGroupMemberAdded) {
            self.onGroupMemberAdded(info);
        }
        [self.groupListeners onGroupMemberAdded:info];
    }];
}

- (void)onGroupMemberDeleted:(NSString * _Nullable)groupMemberInfo {
    OIMGroupMemberInfo *info = [OIMGroupMemberInfo mj_objectWithKeyValues:groupMemberInfo];
    
    [self dispatchMainThread:^{
        if (self.onGroupMemberDeleted) {
            self.onGroupMemberDeleted(info);
        }
        
        [self.groupListeners onGroupMemberDeleted:info];
    }];
}

- (void)onGroupMemberInfoChanged:(NSString * _Nullable)groupMemberInfo {
    OIMGroupMemberInfo *info = [OIMGroupMemberInfo mj_objectWithKeyValues:groupMemberInfo];
    
    [self dispatchMainThread:^{
        if (self.onGroupMemberInfoChanged) {
            self.onGroupMemberInfoChanged(info);
        }
        
        [self.groupListeners onGroupMemberInfoChanged:info];
    }];
}

- (void)onGroupInfoChanged:(NSString * _Nullable)groupInfo {
    OIMGroupInfo *info = [OIMGroupInfo mj_objectWithKeyValues:groupInfo];

    [self dispatchMainThread:^{
        if (self.onGroupInfoChanged) {
            self.onGroupInfoChanged(info);
        }

        [self.groupListeners onGroupInfoChanged:info];
    }];
}

- (void)onJoinedGroupAdded:(NSString * _Nullable)groupInfo {
    OIMGroupInfo *info = [OIMGroupInfo mj_objectWithKeyValues:groupInfo];
    
    [self dispatchMainThread:^{
        if (self.onJoinedGroupAdded) {
            self.onJoinedGroupAdded(info);
        }
        
        [self.groupListeners onJoinedGroupAdded:info];
    }];
}

- (void)onJoinedGroupDeleted:(NSString * _Nullable)groupInfo {
    OIMGroupInfo *info = [OIMGroupInfo mj_objectWithKeyValues:groupInfo];
    
    [self dispatchMainThread:^{
        if (self.onJoinedGroupDeleted) {
            self.onJoinedGroupDeleted(info);
        }

        [self.groupListeners onJoinedGroupDeleted:info];
    }];
}

- (void)onGroupApplicationAccepted:(NSString * _Nullable)groupApplication {
    OIMGroupApplicationInfo *info = [OIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationAccepted) {
            self.onGroupApplicationAccepted(info);
        }
        
        [self.groupListeners onGroupApplicationAccepted:info];
    }];
}

- (void)onGroupApplicationAdded:(NSString * _Nullable)groupApplication {
    OIMGroupApplicationInfo *info = [OIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationAdded) {
            self.onGroupApplicationAdded(info);
        }

        [self.groupListeners onGroupApplicationAdded:info];
    }];
}

- (void)onGroupApplicationDeleted:(NSString * _Nullable)groupApplication {
    OIMGroupApplicationInfo *info = [OIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationDeleted) {
            self.onGroupApplicationDeleted(info);
        }

        [self.groupListeners onGroupApplicationDeleted:info];
    }];
}

- (void)onGroupApplicationRejected:(NSString * _Nullable)groupApplication {
    OIMGroupApplicationInfo *info = [OIMGroupApplicationInfo mj_objectWithKeyValues:groupApplication];
    
    [self dispatchMainThread:^{
        if (self.onGroupApplicationRejected) {
            self.onGroupApplicationRejected(info);
        }
        
        [self.groupListeners onGroupApplicationRejected:info];
    }];
}

#pragma mark -
#pragma mark - Message

- (void)onRecvC2CReadReceipt:(NSString * _Nullable)msgReceiptList {
    NSArray *receipts = [OIMReceiptInfo mj_objectArrayWithKeyValuesArray:msgReceiptList];
    
    [self dispatchMainThread:^{
        if (self.onRecvC2CReadReceipt) {
            self.onRecvC2CReadReceipt(receipts);
        }

        [self.advancedMsgListeners onRecvC2CReadReceipt:receipts];
    }];
}

- (void)onRecvGroupReadReceipt:(NSString* _Nullable)groupMsgReceiptList {
    NSArray *receipts = [OIMReceiptInfo mj_objectArrayWithKeyValuesArray:groupMsgReceiptList];
    
    [self dispatchMainThread:^{
        if (self.onRecvGroupReadReceipt) {
            self.onRecvGroupReadReceipt(receipts);
        }
        
        [self.advancedMsgListeners onRecvGroupReadReceipt:receipts];
    }];
}

- (void)onRecvMessageRevoked:(NSString * _Nullable)msgId {
    
    [self dispatchMainThread:^{
        if (self.onRecvMessageRevoked) {
            self.onRecvMessageRevoked(msgId);
        }
        
        [self.advancedMsgListeners onRecvMessageRevoked:msgId];
    }];
}

- (void)onNewRecvMessageRevoked:(NSString *)messageRevoked {
    
    OIMMessageRevoked *revoked = [OIMMessageRevoked mj_objectWithKeyValues:messageRevoked];
    
    [self dispatchMainThread:^{
        if (self.onNewRecvMessageRevoked) {
            self.onNewRecvMessageRevoked(revoked);
        }
        
        [self.advancedMsgListeners onNewRecvMessageRevoked:revoked];
    }];
}

- (void)onRecvNewMessage:(NSString * _Nullable)message {
    OIMMessageInfo *msg = [OIMMessageInfo mj_objectWithKeyValues:message];
    
    [self dispatchMainThread:^{
        if (self.onRecvNewMessage) {
            self.onRecvNewMessage(msg);
        }
        
        [self.advancedMsgListeners onRecvNewMessage:msg];
    }];
}

- (void)onRecvMessageExtensionsAdded:(NSString* _Nullable)msgID reactionExtensionList:(NSString* _Nullable)reactionExtensionList {
    NSArray *msg = [OIMKeyValue mj_objectArrayWithKeyValuesArray:reactionExtensionList];
    
    [self dispatchMainThread:^{
        if (self.onRecvMessageExtensionsAdded) {
            self.onRecvMessageExtensionsAdded(msgID, msg);
        }
        
        [self.advancedMsgListeners onRecvMessageExtensionsAdded:msgID reactionExtensionList:msg];
    }];
}

- (void)onRecvMessageExtensionsChanged:(NSString* _Nullable)msgID reactionExtensionList:(NSString* _Nullable)reactionExtensionList {
    NSArray *msg = [OIMKeyValue mj_objectArrayWithKeyValuesArray:reactionExtensionList];
    
    [self dispatchMainThread:^{
        if (self.onRecvMessageExtensionsChanged) {
            self.onRecvMessageExtensionsChanged(msgID, msg);
        }
        
        [self.advancedMsgListeners onRecvMessageExtensionsChanged:msgID reactionExtensionKeyList:msg];
    }];
}

- (void)onRecvMessageExtensionsDeleted:(NSString* _Nullable)msgID reactionExtensionKeyList:(NSString* _Nullable)reactionExtensionKeyList {
    
    [self dispatchMainThread:^{
        if (self.onRecvMessageExtensionsDeleted) {
            self.onRecvMessageExtensionsDeleted(msgID, reactionExtensionKeyList.mj_JSONObject);
        }
        
        [self.advancedMsgListeners onRecvMessageExtensionsDeleted:msgID reactionExtensionList:reactionExtensionKeyList.mj_JSONObject];
    }];
}

#pragma mark -
#pragma mark - Conversation

- (void)onConversationChanged:(NSString * _Nullable)conversationList {
    
    NSArray *tConversations = [OIMConversationInfo mj_objectArrayWithKeyValuesArray:conversationList];
    
    [self dispatchMainThread:^{
        if (self.onConversationChanged) {
            self.onConversationChanged(tConversations);
        }

        [self.conversationListeners onConversationChanged:tConversations];
    }];
}

- (void)onNewConversation:(NSString * _Nullable)conversationList {
    
    NSArray *tConversations = [OIMConversationInfo mj_objectArrayWithKeyValuesArray:conversationList];
    
    [self dispatchMainThread:^{
        if (self.onNewConversation) {
            self.onNewConversation(tConversations);
        }
        
        [self.conversationListeners onNewConversation:tConversations];
    }];
}

- (void)onSyncServerFailed {
    [self dispatchMainThread:^{
        if (self.syncServerFailed) {
            self.syncServerFailed();
        }
        
        [self.conversationListeners onSyncServerFailed];
    }];
}

- (void)onSyncServerFinish {
    [self dispatchMainThread:^{
        if (self.syncServerFinish) {
            self.syncServerFinish();
        }

        [self.conversationListeners onSyncServerFinish];
    }];
}

- (void)onSyncServerStart {
    [self dispatchMainThread:^{
        if (self.syncServerStart) {
            self.syncServerStart();
        }
        
        [self.conversationListeners onSyncServerStart];
    }];
}

- (void)onTotalUnreadMessageCountChanged:(int32_t)totalUnreadCount {
    [self dispatchMainThread:^{
        if (self.onTotalUnreadMessageCountChanged) {
            self.onTotalUnreadMessageCountChanged(totalUnreadCount);
        }
        
        [self.conversationListeners onTotalUnreadMessageCountChanged:totalUnreadCount];
    }];
}

#pragma mark -
#pragma mark - Signaling

- (void)onInvitationCancelled:(NSString * _Nullable)invitationCancelledCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:invitationCancelledCallback];
    
    [self dispatchMainThread:^{
        if (self.onInvitationCancelled) {
            self.onInvitationCancelled(info);
        }
      
        [self.signalingListeners onInvitationCancelled:info];
    }];
}

- (void)onInvitationTimeout:(NSString * _Nullable)invitationTimeoutCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:invitationTimeoutCallback];
    
    [self dispatchMainThread:^{
        if (self.onInvitationTimeout) {
            self.onInvitationTimeout(info);
        }
        
        [self.signalingListeners onInvitationTimeout:info];
    }];
}

- (void)onInviteeAccepted:(NSString * _Nullable)inviteeAcceptedCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:inviteeAcceptedCallback];
    
    [self dispatchMainThread:^{
        if (self.onInviteeAccepted) {
            self.onInviteeAccepted(info);
        }
        
        [self.signalingListeners onInviteeAccepted:info];
    }];
}

- (void)onInviteeAcceptedByOtherDevice:(NSString * _Nullable)inviteeAcceptedCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:inviteeAcceptedCallback];
    
    [self dispatchMainThread:^{
        if (self.onInviteeAcceptedByOtherDevice) {
            self.onInviteeAcceptedByOtherDevice(info);
        }
        
        [self.signalingListeners onInviteeAcceptedByOtherDevice:info];
    }];
}

- (void)onInviteeRejected:(NSString * _Nullable)inviteeRejectedCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:inviteeRejectedCallback];
    
    [self dispatchMainThread:^{
        if (self.onInviteeRejected) {
            self.onInviteeRejected(info);
        }
        
        [self.signalingListeners onInviteeRejected:info];
    }];
}

- (void)onInviteeRejectedByOtherDevice:(NSString * _Nullable)inviteeRejectedCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:inviteeRejectedCallback];
    
    [self dispatchMainThread:^{
        if (self.onInviteeRejectedByOtherDevice) {
            self.onInviteeRejectedByOtherDevice(info);
        }
        
        [self.signalingListeners onInviteeRejectedByOtherDevice:info];
    }];
}

- (void)onReceiveNewInvitation:(NSString * _Nullable)receiveNewInvitationCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:receiveNewInvitationCallback];
    
    [self dispatchMainThread:^{
        if (self.onReceiveNewInvitation) {
            self.onReceiveNewInvitation(info);
        }
        
        [self.signalingListeners onReceiveNewInvitation:info];
    }];
}

- (void)onHangUp:(NSString *)hangUpCallback {
    OIMSignalingInfo *info = [OIMSignalingInfo mj_objectWithKeyValues:hangUpCallback];
    
    [self dispatchMainThread:^{
        if (self.onHunguUp) {
            self.onHunguUp(info);
        }
        
        [self.signalingListeners onHunguUp:info];
    }];
}

- (void)onRoomParticipantConnected:(NSString *)onRoomParticipantConnectedCallback {
    OIMParticipantConnectedInfo *info = [OIMParticipantConnectedInfo mj_objectWithKeyValues:onRoomParticipantConnectedCallback];
    
    [self dispatchMainThread:^{
        if (self.onRoomParticipantConnected) {
            self.onRoomParticipantConnected(info);
        }
        
        [self.signalingListeners onRoomParticipantConnected:info];
    }];
}

- (void)onRoomParticipantDisconnected:(NSString *)onRoomParticipantDisconnectedCallback {
    OIMParticipantConnectedInfo *info = [OIMParticipantConnectedInfo mj_objectWithKeyValues:onRoomParticipantDisconnectedCallback];
    
    [self dispatchMainThread:^{
        if (self.onRoomParticipantDisconnected) {
            self.onRoomParticipantDisconnected(info);
        }
        
        [self.signalingListeners onRoomParticipantDisconnected:info];
    }];
}

- (void)onStreamChange:(NSString *)OnStreamChangeCallback {
    OIMMeetingStreamEvent *info = [OIMMeetingStreamEvent mj_objectWithKeyValues:OnStreamChangeCallback];
    
    [self dispatchMainThread:^{
        if (self.onStreamChange) {
            self.onStreamChange(info);
        }
        
        [self.signalingListeners onStreamChange:info];
    }];
}

- (void)onReceiveCustomSignal:(NSString *)customSignalCallback {
    
    [self dispatchMainThread:^{
        if (self.onReceiveCustomSignal) {
            self.onReceiveCustomSignal(customSignalCallback);
        }
        
        [self.signalingListeners onReceiveCustomSignal:customSignalCallback];
    }];
}

#pragma mark -
#pragma mark - Organization

- (void)onOrganizationUpdated {
    [self dispatchMainThread:^{
        if (self.organizationUpdated) {
            self.organizationUpdated();
        }
        
        [self.organizationListeners onOrganizationUpdated];
    }];
}

#pragma mark -
#pragma mark - Organization

- (void)onRecvNewNotification {
    [self dispatchMainThread:^{
        if (self.recvNewNotification) {
            self.recvNewNotification();
        }
        
        [self.workMomentsListeners onRecvNewNotification];
    }];
}

@end
