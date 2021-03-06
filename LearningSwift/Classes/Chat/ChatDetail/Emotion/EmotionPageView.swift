//
//  EmotionPageView.swift
//  LearningSwift
//
//  Created by wangyuan on 2018/8/14.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

import UIKit

class EmotionPageView: BaseView {

    var emotions = [EmotionModel]()
    
    private lazy var deleteBtn: UIButton = {
        let deleteBtn: UIButton = UIButton()
        deleteBtn.setImage(UIImage.init(named: "emotion_delete"), for: .normal)
        deleteBtn.addTarget(self, action: #selector(deleteBtnClicked), for: .touchUpInside)
        return deleteBtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = RGB(237, 237, 246)
        self.addSubview(deleteBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func setEmotions(_ emotionArr: Array<EmotionModel>) {
        self.emotions = emotionArr
        for emotion:EmotionModel in emotionArr {
            let emotionBtn: EmotionButton = EmotionButton()
            emotionBtn.setEmotion(emotion)
            emotionBtn.addTarget(self, action: #selector(emotionBtnClicked(_:)), for: .touchUpInside)
            self.addSubview(emotionBtn)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let inset: CGFloat = 15
        let count: Int = self.emotions.count
        let btnW: CGFloat = (self.width - 2*inset) / CGFloat(EmotionMaxCols)
        let btnH: CGFloat = (self.height - 2*inset) / CGFloat(EmotionMaxRows)
        
        for index in 0 ..< count {
            let btn = self.subviews[index + 1]
            btn.width = btnW
            btn.height = btnH
            btn.x = inset + CGFloat(index % EmotionMaxCols)*btnW
            btn.y = inset + CGFloat(index / EmotionMaxCols)*btnH
        }
        self.deleteBtn.width = btnW
        self.deleteBtn.height = btnH
        self.deleteBtn.x = inset + CGFloat(count % EmotionMaxCols)*btnW
        self.deleteBtn.y = inset + CGFloat(count / EmotionMaxCols)*btnH
    }
    
    
    @objc func deleteBtnClicked() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: EmotionDidDeleteNotification), object: nil)
    }
    
    @objc func emotionBtnClicked(_ button: EmotionButton) {
        var userInfoDic: [String: EmotionModel] = [:]
        userInfoDic[SelectEmotionKey] = button.emotion
        
        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: EmotionDidSelectNotification), object: nil, userInfo: userInfoDic))
    }
}
