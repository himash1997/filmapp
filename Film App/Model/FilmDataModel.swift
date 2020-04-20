//
//  FilmDataModel.swift
//  Film App
//
//  Created by Himash Nadeeshan on 4/19/20.
//  Copyright © 2020 Himash Nadeeshan. All rights reserved.
//

import Foundation


class FilmDataModel{
    
    var title :String = ""
    var year : String = ""
    var poster : String = ""
    var type : String = ""
    
    init(filmname:String, year:String, poster:String, type:String) {
        self.title = filmname
        self.year = year
        self.poster = poster
        self.type = type
    }
    
}
