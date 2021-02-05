//
//  NetworkService.swift
//  GalleryCollection
//
//  Created by Bunny Bhargav on 22/10/20.
//  Copyright © 2020 Bunny Bhargav. All rights reserved.
//

import Foundation



class APIService
{
     func getDataFromEndpoint(urlString u_str: URL, completion: @escaping (Error?, Data?) ->  Void)
    {
        let task = URLSession.shared.dataTask(with: u_str) { (data, response, error) in
            if let err = error
            {
            completion(err, nil)
            }
            if let objectdata = data
            {
            completion(nil, objectdata)
            }
        }
        task.resume()
    }
}


class JsonParser {
    class func getJsonDataObjectsfromResponse<T: Decodable>(withData data: Data, type: T.Type, completion: @escaping (Error?, [T]?) -> Void)
    {
    let decoder = JSONDecoder()
        do {
        
            let allItems = try decoder.decode([T].self, from: data)
            completion(nil, allItems)
        } catch {
            print(error)
            completion(error, nil)
        }
    }
    class func getJsonDataObjectfromResponse<T: Decodable>(withData data: Data, type: T.Type, completion: @escaping (Error?, T?) -> Void)
    {
    let decoder = JSONDecoder()
        do {
        let allItems = try decoder.decode(T.self, from: data)
            completion(nil, allItems)
        } catch {
            print(error)
            completion(error, nil)
        }
    }
}
