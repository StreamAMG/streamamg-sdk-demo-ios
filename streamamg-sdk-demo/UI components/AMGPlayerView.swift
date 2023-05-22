//
//  AMGPlayer.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 22/05/2023.
//

import SwiftUI
import StreamAMGSDK

struct AMGPlayerView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> AMGPlayKit {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        let playKit = AMGPlayKit(frame: frame, partnerID: 3001133, analytics: nil)
        playKit.createPlayer(analytics: nil, enableIMA: false)
        
        let controls = AMGControlBuilder()
            .setBitrateSelector(true)
            .setSubtitlesSelector(true)
            .build()
        playKit.addStandardControl(config: controls)
        
        playKit.backgroundColor = .systemBlue
        playKit.loadMedia(serverUrl: "https://open.http.mp.streamamg.com", partnerID: 3001403, entryID: "0_t9jf5rk6")
        
        
        playKit.play()
        return playKit
    }
    
    func updateUIView(_ uiView: AMGPlayKit, context: Context) {}
}

struct AMGPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AMGPlayerView()
    }
}
