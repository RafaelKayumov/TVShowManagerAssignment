//
//  ParseService.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Parse

class ParseService: ParseServiceProtocol {
    func saveObject(objectDictionary: [String: Any], type: ParseObjectType, completion: @escaping ParseCallback) {
        let objectToSave = PFObject(className: type.rawValue, dictionary: objectDictionary)
        objectToSave.saveInBackground { (success, error) in
            guard success, error == nil else {
                completion(false, error)
                return
            }
            completion(true, nil)
        }
    }

    func deleteObjectWith(type: ParseObjectType, id: String, completion: @escaping ParseCallback) {
        let query = PFQuery(className: type.rawValue)
        query.getObjectInBackground(withId: id) { (object, error) in
            guard let object = object, error == nil else {
                completion(false, error)
                return
            }

            object.deleteEventually()
            completion(true, nil)
        }
    }

    func queryObjectsWith(type: ParseObjectType, completion: @escaping ParseCollectionFetchCallback) {
        let query = PFQuery(className: type.rawValue)
        query.order(byAscending: "createdAt")
        query.findObjectsInBackground(block: completion)
    }
}
