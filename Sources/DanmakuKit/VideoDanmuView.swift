//
//  VideoDanmuView.swift
//  Bilibili
//
//  Created by huanghong on 2024/5/6.
//

import SwiftUI

public struct VideoDanmuView: UIViewRepresentable {
    
    var videoDanmuVM: VideoDanmuViewModel

    public init(videoDanmuVM: VideoDanmuViewModel) {
        self.videoDanmuVM =  videoDanmuVM
    }
    
    public func makeUIView(context: Context) -> DanmakuView {
        let view = videoDanmuVM.makeView()
        view.frame = CGRect(x: 0, y: 0, width: 1280, height: 200)
        view.play()
        return view
    }
    
    public func updateUIView(_ uiView: DanmakuView, context: Context) {
        
    }
}
