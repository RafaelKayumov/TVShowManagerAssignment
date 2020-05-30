//
//  TVShowViewModel.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Foundation
import Parse

struct TVShowViewModel: Encodable {
    let title: String
    let yearOfRelease: String
    let numberOfSeasons: String

    enum CodingKeys: String, CodingKey {
        case yearOfRelease = "year"
        case numberOfSeasons = "seasons"

        case title
    }

    init(title: String, yearOfRelease: String, numberOfSeasons: String) {
        self.title = title
        self.yearOfRelease = yearOfRelease
        self.numberOfSeasons = numberOfSeasons
    }

    init?(parseObject: PFObject) {
        guard parseObject.parseClassName == ParseObjectType.tvShow.rawValue else { return nil }
        self.title = parseObject[CodingKeys.title.rawValue] as? String ?? ""
        self.yearOfRelease = String(parseObject[CodingKeys.yearOfRelease.rawValue] as? Int ?? 0)
        self.numberOfSeasons = String(parseObject[CodingKeys.numberOfSeasons.rawValue] as? Int ?? 0)
    }

    var parseObject: PFObject {
        let object = PFObject(className: ParseObjectType.tvShow.rawValue)
        object[CodingKeys.yearOfRelease.rawValue] = Int(yearOfRelease)
        object[CodingKeys.numberOfSeasons.rawValue] = Int(numberOfSeasons)
        object[CodingKeys.title.rawValue] = title
        return object
    }
}
