//
//  ParseServiceProtocol.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Parse

enum ParseObjectType: String {
    case tvShow
}

typealias ParseCallback = (Bool, Error?) -> Void
typealias ParseCollectionFetchCallback = ([PFObject]?, Error?) -> Void

protocol ParseServiceProtocol {
    func saveObject(objectDictionary: [String: Any], type: ParseObjectType, completion: @escaping ParseCallback)
    func deleteObjectWith(type: ParseObjectType, id: String, completion: @escaping ParseCallback)
    func queryObjectsWith(type: ParseObjectType, completion: @escaping ParseCollectionFetchCallback)
}
