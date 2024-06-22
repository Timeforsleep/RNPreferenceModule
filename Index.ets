//###S###
//评论发布器
export {AHCommentReplySheet} from './src/main/ets/component/commentReplyView/AHCommentReplySheet'

//Toast相关
export {AHToastStatus,AHToastStateView} from './src/main/ets/component/toast/AHToastStateView'
export {AHToastView} from './src/main/ets/component/toast/AHToastView'
export {AHTopToastView} from './src/main/ets/component/toast/AHTopToastView'
export {AHToastEngine} from './src/main/ets/component/toast/AHToastEngine'

export {AHDiaLogCommonView} from './src/main/ets/component/dialog/AHDiaLogCommonView'

export {AHAvoidBarAreaStackView,AHAvoidBarAreaColumView} from './src/main/ets/component/baseview/AHAvoidBarAreaView'

//表情键盘布局
export {AHEmojiKeyboard} from './src/main/ets/component/EmojiKeyboard/AHEmojiKeyboard'
export {AHEmotionManager} from './src/main/ets/component/EmojiKeyboard/model/AHEmotionManager'
export {AHEmotionModel} from './src/main/ets/component/EmojiKeyboard/model/AHEmotionModel'
export {AHEmotionConstants} from './src/main/ets/component/EmojiKeyboard/constants/AHEmotionConstants'
export {AHEmotionEnumType} from './src/main/ets/component/EmojiKeyboard/constants/AHEmotionEnumType'
export const pageSchemeMapping: AHPageMapping[] = [
/* 设置首页 */
  { "autohome://setting/setting": import("./src/main/ets/pages/Index") },
  /* 推送设置 */
  { "autohome://setting/pushsetting": import("./src/main/ets/pages/AHPushSettingsPage") },
  /* 隐私设置 */
  { "autohome://setting/privateSetting": import("./src/main/ets/pages/PrivacySetting") },
  /* 相关许可证 */
  { "autohome://setting/RelevantLicence": import("./src/main/ets/pages/RelevantLicence") },
  /* 关于汽车之家 */
  { "autohome://setting/AboutAutoHome": import("./src/main/ets/pages/AboutAutoHome") }
]


export { AHTitleBarView } from "./src/main/ets/component/navigationbar/AHTitleBarView"

export { AHTabItemBuildView } from "./src/main/ets/component/bottombar/AHTabItemBuildView"

export { TabBarItemModel } from "./src/main/ets/component/bottombar/TabBarItemModel"

export { AHPullToRefreshConfigurator } from './src/main/ets/component/pullToRefresh/AHPullToRefreshConfigurator'
export {  default as AHPullToRefreshLayout } from './src/main/ets/component/pullToRefresh/AHPullToRefreshLayout'

export { AHLoadingView } from './src/main/ets/component/loading/AHLoadingView'

export { AHLoadingStateOptions,
  LoadingOptions,
  EmptyDataOptions,
  NetworkErrorOptions,
  LoadingErrorOptions,
  PositionErrorOptions } from './src/main/ets/component/loading/AHLoadingStateOptions'

export { AHRefreshFooterView,
  AHFooterLoadingStatus
} from './src/main/ets/component/loading/AHRefreshFooterView'

export { AHSecondNavView } from './src/main/ets/component/secondnav/AHSecondNavView'
export { AHSecondNavOptions } from './src/main/ets/component/secondnav/AHSecondNavOptions'

//一级导航栏
//export {TabNav} from './src/main/ets/component/tabbar/TabNav'
// export {TabNavContent} from './src/main/ets/component/tabbar/TabNavContent'
// export {TabNavUtil} from './src/main/ets/component/tabbar/TabNavUtil'
// export {TabNavParams, TabNavItemModel ,TabNavRightModel,TabNavStyle} from './src/main/ets/component/tabbar/TabNavParams'
export * from "./src/main/ets/component/tabbar/AHSlidingTabBar";



/**
 * 这里注册对外暴露的数据协议
 */
export const dataSchemeMapping: AHDataMapping[] = [
/* 获取APP推送开关状态 */
  { "autohome://setting/getnotificationauthorizationstatus": import('./src/main/ets/dataScheme/AHPushAuthorizationStatusCallback') },
  /* 设置APP推送开关状态 */
  { "autohome://setting/appsystemmessageswitch": import('./src/main/ets/dataScheme/AHSystemMessageSwitchCallback') },
  /* 打开手机系统推送权限设置页面 */
  { "autohome://setting/opensystemconfig": import('./src/main/ets/dataScheme/AHOpenSystemConfigCallback') },
]
//徽标数
export { AHBadgeView } from "./src/main/ets/component/AHBadgeView";

export {AHImagePreviewView} from './src/main/ets/component/AHPhotoBrowser/view/AHImagePreviewView'
export {AHPicturePreviewView} from './src/main/ets/component/AHPhotoBrowser/view/AHPicturePreviewView'

export { AHQuickIndexView } from './src/main/ets/component/quickIndex/AHQuickIndexView'