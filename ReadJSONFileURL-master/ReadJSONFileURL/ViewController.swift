//
//  ViewController.swift
//  ReadJSONFileURL
//
//  Created by ProgrammingWithSwift on 2020/03/22.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import UIKit
/* "createdAt":"2022-01-24T20:52:50.765Z","isOccupied":false,"maxOccupancy":53539,"id":"1"},{"createdAt":"2022-01-25T14:37:26.128Z","isOccupied":false,"maxOccupancy":34072,"id":"2"
 */

let ROOM_URL = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms"

struct DemoData: Codable {
    let createdAt: String?
    let isOccupied: String?
    let maxOccupancy:Int?
    let id:Int?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        //if let localData = self.readLocalFile(forName: "data") {
        //    self.parse(jsonData: localData)
        //}
        
        let urlString = ROOM_URL
        self.loadJson(fromURLString: urlString) { (result) in
            switch result {
            case .success(let data):
                self.parse(jsonData: data)
            case .failure(let error):
                print(error)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: ROOM_URL) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }

    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(DemoData.self,
                                                       from: jsonData)
            
            let maxOccupancy = decodedData.maxOccupancy ?? 0
            let id = decodedData.id ?? 0
            print("Title: ", maxOccupancy)
            print("Description: ", id)
            print("===================================")
        } catch {
            print("decode error")
        }
    }
}

