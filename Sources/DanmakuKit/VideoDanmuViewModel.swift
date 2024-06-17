//
//  VideoDanmuViewModel.swift
//  Bilibili
//
//  Created by huanghong on 2024/5/6.
//

import Foundation
import UIKit

public class VideoDanmuViewModel: ObservableObject{
    
    private let danmuProvider = VideoDanmuProvider()
    public let danmuView = DanmakuView()
    
    public init(cid:Int , startPos: Int = 0) {
        initDanmakuProvider(cid: cid, startPos: startPos)
        
        danmuView.accessibilityLabel = "danmuView"
//        danmuView.makeConstraintsToBindToSuperview()
        
        // TODO: 需要让用户设置
//        danmuView.isHidden = !Settings.defaultDanmuStatus
        danmuView.isHidden = false
        
        danmuProvider.onShowDanmu = {
            [weak self] in
            self?.danmuView.shoot(danmaku: $0)
        }
        self.danmuProvider.playerTimeChange(time: 20)
    }
    
    public func initDanmakuProvider(cid:Int , startPos: Int) {
        Task{
            await danmuProvider.initVideo(cid: cid, startPos: startPos)
        }
    }
    
    public func makeView() -> DanmakuView {
        self.danmuView.frame = CGRectMake(0, 0, 1280, 200)
        danmuView.recaculateTracks()
        danmuView.paddingTop = 5
        danmuView.trackHeight = 50
//        danmuView.displayArea = Settings.danmuArea.percent
        return self.danmuView
    }
    
    public func playerTimeChange(time: TimeInterval){
        danmuProvider.playerTimeChange(time: time)
    }
    
}
