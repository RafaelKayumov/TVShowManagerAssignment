//
//  ServiceAssembly.swift
//  TVShowManagerAssignment
//
//  Created by Rafael Kayumov on 30/05/2020.
//  Copyright © 2020 Rafael Kayumov. All rights reserved.
//

import Foundation

class ServiceAssembly: ServiceAssemblyProtocol {
    func parseService() -> ParseService {
        return ParseService()
    }
}
