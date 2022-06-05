//
//  Petition.swift
//  Whitehouse Petitions
//
//  Created by TheGIZzz on 5/6/2565 BE.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
