//
//  AMGPlayer.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 22/05/2023.
//

import SwiftUI
import StreamAMGSDK

struct AMGPlayerView: View {

    @State private var serveAdvert: String = "https://pubads.g.doubleclick.net/gampad/ads?iu=/21775744923/external/single_ad_samples&sz=640x480&cust_params=sample_ct%3Dlinear&ciu_szs=300x250%2C728x90&gdfp_req=1&output=vast&unviewed_position_start=1&env=vp&impl=s&correlator="
    @State private var serverUrl: String = "https://mp.streamamg.com"
    @State private var partnerID: Int = 3001355
    @State private var entryID: String = "0_whx96g4q"

    var body: some View {
        VStack {
            AMGPlayerRepresentable(serveAdvert: $serveAdvert, serverUrl: $serverUrl, partnerID: $partnerID, entryID: $entryID)
                .frame(width: 400, height: 300)
                .cornerRadius(8)
                .shadow(radius: 4)
                .padding()
            Form {
                Section(header: Text("Advert")) {
                    TextField("Advert URL", text: $serveAdvert)
                }

                Section(header: Text("Media")) {
                    TextField("Server URL", text: $serverUrl)
                    TextField("Partner ID", value: $partnerID, formatter: NumberFormatter())
                    TextField("Entry ID", text: $entryID)
                }
            }.frame(height: 300)
            .padding()
        }
    }
}

struct AMGPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AMGPlayerView()
    }
}
