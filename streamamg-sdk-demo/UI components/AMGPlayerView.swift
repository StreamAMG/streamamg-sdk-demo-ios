//
//  AMGPlayer.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 22/05/2023.
//

import SwiftUI
import StreamAMGSDK

struct AMGPlayerView: UIViewRepresentable {
    let customFields: DemoModel!

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
        playKit.loadMedia(serverUrl: customFields.serverId, partnerID: customFields.partnerId, entryID: customFields.entryId)
        
        
        playKit.play()
        return playKit
        
    }
    
    func updateUIView(_ uiView: AMGPlayKit, context: Context) {
        print("updateUIView")
    }
}

struct AMGPlayer_Previews: PreviewProvider {
    static var previews: some View {
     
        AMGPlayerView(customFields: DemoModel(entryId: "0_t9jf5rk6", serverId: "https://open.http.mp.streamamg.com", partnerId: 3001403, mediaTitle: "TESTW"))
    }
}
