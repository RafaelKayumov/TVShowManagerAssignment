//
//  ParseService+Setup.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Parse

///It's unsafe to store keys and secrets client side
///Values are hardcoded as exception to save time
private let kParseAppId = "UvBvjdPeATFfYW9PeMjuoyX0ZGkD9XVY6NJAwshV"
private let kParseClientKey = "rxbpcYTOYya1NXcMbyaXNdLOCNs2VwY86OZ6w9ZE"
private let kServerURLString = "https://parseapi.back4app.com/"

extension ParseService {

    static func setup() {
        let parseConfig = ParseClientConfiguration {
            $0.isLocalDatastoreEnabled = true
            $0.applicationId = kParseAppId
            $0.clientKey = kParseClientKey
            $0.server = kServerURLString
        }
        Parse.initialize(with: parseConfig)
    }
}
