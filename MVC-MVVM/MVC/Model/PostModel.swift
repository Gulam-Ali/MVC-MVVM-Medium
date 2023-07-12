//
//  PostModel.swift
//  MVC-MVVM
//
//  Created by Sachin Mittal on 12/07/23.
//

import Foundation

struct Posts : Decodable{
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?
}
