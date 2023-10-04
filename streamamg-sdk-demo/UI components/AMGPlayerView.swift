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
    @State private var statusBarOrientation = UIInterfaceOrientation.portrait

    var body: some View {
        VStack {
            AMGPlayerRepresentable(serveAdvert: $serveAdvert, serverUrl: $serverUrl, partnerID: $partnerID, entryID: $entryID)
                .aspectRatio(16/9, contentMode: statusBarOrientation.isPortrait ? .fit : .fill)
                .frame(minWidth: 400, maxWidth: statusBarOrientation.isPortrait ? 400 : .infinity, minHeight: 300, maxHeight: statusBarOrientation.isPortrait ? 300 : .infinity)
                .edgesIgnoringSafeArea(.all)
                .onRotate { newOrientation in
                    statusBarOrientation = newOrientation
                }
            
            if statusBarOrientation.isPortrait {
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
    
    func changeOrientation(to orientation: UIInterfaceOrientation) {
        if #available(iOS 16.0, *) {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: orientation.isLandscape ? .landscape : .portrait))
        } else {
            UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
        }
    }
}

struct DeviceRotationViewModifier: ViewModifier {
    let statusBarAction: (UIInterfaceOrientation) -> Void

    @available(iOS, deprecated: 13.0)
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didChangeStatusBarOrientationNotification)) { _ in
                statusBarAction(UIApplication.shared.statusBarOrientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIInterfaceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(statusBarAction: action))
    }
}

struct AMGPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AMGPlayerView()
    }
}
