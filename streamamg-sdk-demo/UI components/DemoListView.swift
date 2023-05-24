//
//  DemoListView.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 22/05/2023.
//

import SwiftUI

struct DemoListView: View {
    
    
    var body: some View {
      NavigationView {
        List(customFields, id: \.entryId) { customField in
          NavigationLink(destination: AMGPlayerView(customFields: customField)) {
            ListRow(customField: customField)
          }
        }
        .navigationBarTitle("Demo List View", displayMode: .inline)
      }
    }
  }

  struct ListRow: View {
    let customField: DemoModel

    var body: some View {
      VStack(alignment: .leading) {
        Text(customField.mediaTitle)
          .font(.title)
          .foregroundColor(.primary)
      }
      .padding()
      .background(Color(UIColor.systemBackground))
      .cornerRadius(8)
    }
  }

  struct DemoListView_Previews: PreviewProvider {
    static var previews: some View {
      DemoListView()
    }
  }
