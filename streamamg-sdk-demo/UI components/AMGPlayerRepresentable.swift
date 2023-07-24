//
//  AMGPlayerRepresentable.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 17/07/2023.
//

import SwiftUI
import StreamAMGSDK

struct AMGPlayerRepresentable: UIViewRepresentable {
    
    @Binding var serveAdvert: String
    @Binding var serverUrl: String
    @Binding var partnerID: Int
    @Binding var entryID: String
    
    func makeUIView(context: Context) -> AMGPlayKit {
        let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        let playKit = AMGPlayKit(frame: frame, partnerID: partnerID, analytics: nil)
        playKit.createPlayer(analytics: nil, enableIMA: false)
        
        let controls = AMGControlBuilder()
            .setBitrateSelector(true)
            .setSubtitlesSelector(true)
            .build()
        
        playKit.addStandardControl(config: controls)
        playKit.loadMedia(serverUrl: serverUrl, partnerID: partnerID, entryID: entryID)
        playKit.backgroundColor = .systemBlue
        playKit.serveAdvert(adTagUrl: serveAdvert)
        playKit.play()
        return playKit
    }
    
    func updateUIView(_ uiView: AMGPlayKit, context: Context) {
        uiView.serveAdvert(adTagUrl: serveAdvert)
        uiView.loadMedia(serverUrl: serverUrl, partnerID: partnerID, entryID: entryID)
    }
}


//struct AMGPlayerRepresentable_Previews: PreviewProvider {
//    static var previews: some View {
//    var serveAdvert: String = "https://delivery.adnuntius.com/i?network=1b8806&auId=00000000002844e5&tt=vast4-2"
//        var serverUrl: String = "https://open.http.mp.streamamg.com"
//    var partnerID: Int = 3001355
//        var entryID: String = "0_whx96g4q"
//
//        AMGPlayerRepresentable(serveAdvert: serveAdvert, serverUrl: serverUrl, partnerID: partnerID, entryID: entryID)
//    }
//}
