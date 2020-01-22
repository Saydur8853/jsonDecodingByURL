//
//  ViewController.swift
//  jsonDecoding
//
//  Created by SAYDUR on 1/22/20.
//  Copyright © 2020 SAYDUR. All rights reserved.
//

import UIKit

struct Country: Decodable {
    let name: String
    let capital: String
    let region: String
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let url = "https://restcountries.eu/rest/v2/all"
        let urlObj = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObj!) {(data, response, error) in
            
            do{
                let countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for Country in countries {
                    print(Country.name + ":" + Country.capital)
                }
                
            } catch{
                //return()//print("Not me error")
            }
            }.resume()
    }


}

