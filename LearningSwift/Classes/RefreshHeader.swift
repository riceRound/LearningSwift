//
//  RefreshHeader.swift
//  LearningSwift
//
//  Created by wangyuan on 2018/7/4.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

import UIKit
import MJRefresh

class RefreshHeader: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        var images = [UIImage]()
        
        for index in 0..<16 {
            let image = UIImage(named: "dropdown_loading_0\(index)")
            images.append(image!)
            
        }
        
        setImages(images, for: .idle)
        setImages(images, for: .refreshing)
        setTitle("下拉刷新", for: .idle)
        setTitle("松开刷新", for: .pulling)
        setTitle("刷新中", for: .refreshing)
        setTitle("没有更多数据啦", for: .noMoreData)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        
        gifView.contentMode = .center
        gifView.frame = CGRect(x: 0, y: 4, width: mj_w, height: 25)
        stateLabel.font = UIFont.systemFont(ofSize: 12)
        stateLabel.frame = CGRect(x: 0, y: 35, width: mj_w, height: 14)
    }
}

class RefreshAutoGifFooter: MJRefreshAutoGifFooter {
    
    /// 初始化
    override func prepare() {
        super.prepare()
        // 设置控件的高度
        mj_h = 50
        // 图片数组
        var images = [UIImage]()
        // 遍历
        for index in 0..<8 {
            let image = UIImage(named: "sendloading_18x18_\(index)")
            images.append(image!)
        }
        // 设置空闲状态的图片
        setImages(images, for: .idle)
        // 设置刷新状态的图片
        setImages(images, for: .refreshing)
        setTitle("下拉刷新", for: .idle)
        setTitle("松开刷新", for: .pulling)
        setTitle("刷新中", for: .refreshing)
        setTitle("没有更多数据啦", for: .noMoreData)
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        gifView.x = 135
        gifView.centerY = stateLabel.centerY
    }
    
}
