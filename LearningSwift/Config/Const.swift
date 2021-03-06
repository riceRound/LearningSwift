//
//  Const.swift
//  LearningSwift
//
//  Created by wangyuan on 2018/7/3.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

import UIKit


let device_id: Int64 = 6096495334
let iid: Int64 = 5034850950


//服务器地址
let BaseUrl = "http://wd-api.h2he.cn"

//屏幕宽度
let kScreenWidth = UIScreen.main.bounds.size.width

//屏幕高度
let kScreenHeight = UIScreen.main.bounds.size.height

//比例计算
func Scale(num: Int) -> CGFloat {
    return kScreenWidth/375.0 * CGFloat(num)
}

//状态栏高度
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

//底部导航栏高度
let kTabBarHeight: CGFloat = 49

//导航栏高度
let kNavBarHeight: CGFloat = 64

//聊天ToolBar高度
let kChatBarHeight: CGFloat = 215

//iPhoneX
let isIphoneX: Bool = (kScreenWidth == 812)

func RGBA(_ r: CGFloat,_ g: CGFloat,_ b: CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor.init(red: r/255, green: g/255, blue: b/255, alpha: a)
}

func RGBASame(_ r: CGFloat,_ a: CGFloat) -> UIColor {
    return RGBA(r, r, r, a)
}

func RGB(_ r: CGFloat,_ g: CGFloat,_ b: CGFloat) -> UIColor {
    return RGBA(r, g, b, 1)
}

func RGBSame(_ r: CGFloat) -> UIColor {
    return RGBA(r, r, r, 1)
}

//16进制颜色
//func HexColor(hex: String) -> UIColor {
//
//}

//block
typealias CommnonBlock = (_ result: Any?) -> ()

//AppDelegate
let RootDelegate = (UIApplication.shared.delegate) as! AppDelegate



