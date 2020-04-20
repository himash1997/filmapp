//
//  SendRequest.swift
//  Film App
//
//  Created by Himash Nadeeshan on 4/19/20.
//  Copyright © 2020 Himash Nadeeshan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SendRequest{

    let M_URL = "http://www.omdbapi.com/?apikey=5aa48c99"

    func getData(completion: @escaping (Array<FilmDataModel>?) -> ()) {

        var films = [FilmDataModel]()
        
        Alamofire.request(self.M_URL, method: .get,parameters: ["s":"lord"]).responseJSON{
            response in
            if response.result.isSuccess{

                let filmdata : JSON = JSON(response.result.value!)
                let items = filmdata["Search"].array!

                for i in items{
                    let title = i["Title"].stringValue
                    let year = i["Year"].stringValue
                   // let imdbID = i["imdbID"].stringValue
                    let type = i["Type"].stringValue
                    let posterurl = i["Poster"].stringValue

                    films.append(FilmDataModel(filmname: title, year: year, poster: posterurl, type: type))
                }
                
                completion(films)

            }else if response.result.isFailure {
                completion(films)
            }
        }

    }

}


