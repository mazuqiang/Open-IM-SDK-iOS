//
//  OIMGroupApplicationInfo.h
//  OpenIMSDK
//
//  Created by x on 2022/2/11.
//

#import <Foundation/Foundation.h>
#import "OIMModelDefine.h"

NS_ASSUME_NONNULL_BEGIN

///申请进群信息
///
@interface OIMGroupApplicationInfo : NSObject

@property (nonatomic, nullable, copy) NSString *groupID;
@property (nonatomic, nullable, copy) NSString *groupName;
@property (nonatomic, nullable, copy) NSString *notification;
@property (nonatomic, nullable, copy) NSString *introduction;
@property (nonatomic, nullable, copy) NSString *groupFaceURL;
@property (nonatomic, nullable, copy) NSString *createTime;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, nullable, copy) NSString *creatorUserID;
@property (nonatomic, assign) NSInteger groupType;
@property (nonatomic, nullable, copy) NSString *ownerUserID;
@property (nonatomic, assign) NSInteger memberCount;
@property (nonatomic, nullable, copy) NSString *userID;
@property (nonatomic, nullable, copy) NSString *nickname;
@property (nonatomic, nullable, copy) NSString *userFaceURL;
@property (nonatomic, assign) OIMGender gender;
@property (nonatomic, assign) OIMApplicationStatus handleResult;
@property (nonatomic, nullable, copy) NSString *reqMsg;
@property (nonatomic, nullable, copy) NSString *handledMsg;
@property (nonatomic, assign) NSInteger reqTime;
@property (nonatomic, nullable, copy) NSString *handleUserID;
@property (nonatomic, assign) NSInteger handledTime;
@property (nonatomic, nullable, copy) NSString *ex;
@property (nonatomic, nullable, copy) NSString *inviterUserID;
@property (nonatomic, assign) OIMJoinType joinSource;

@end

NS_ASSUME_NONNULL_END
