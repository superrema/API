//
//  Struct.swift
//  AcatAPI
//
//  Created by Remachann . on 10/11/1444 AH.
//

import Foundation
import SwiftUI

struct Responsee: Codable {
    var result: [Cat]
}

struct Cat: Codable , Identifiable{
    
    let id: String
    var url: String
    let width,height: Int
    
   
    }

