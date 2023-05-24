//
//  DemoModel.swift
//  streamamg-sdk-demo
//
//  Created by Franco Driansetti on 22/05/2023.
//

import Foundation

struct DemoModel {
    let entryId: String
    let serverId: String
    let partnerId: Int
    let mediaTitle: String

    init(entryId: String, serverId: String, partnerId: Int, mediaTitle: String) {
        self.entryId = entryId
        self.serverId = serverId
        self.partnerId = partnerId
        self.mediaTitle = mediaTitle
    }
}

func loadCustomFields(from file: String) -> [DemoModel] {
    guard let url = Bundle.main.url(forResource: "Demos", withExtension: "json") else {
        return []
    }
    
    let data = try! Data(contentsOf: url)
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]

    var customFields: [DemoModel] = []
    for item in json {
        let entryId = item["entryID"] as! String
        let serverId = item["serverURL"] as! String
        let partnerId = item["partnerID"] as! Int
        let mediaTitle = item["mediaTitle"] as! String

        let customField = DemoModel(entryId: entryId, serverId: serverId, partnerId: partnerId, mediaTitle: mediaTitle)
        customFields.append(customField)
    }

    return customFields
}

let customFields = loadCustomFields(from: "Demos.json")
