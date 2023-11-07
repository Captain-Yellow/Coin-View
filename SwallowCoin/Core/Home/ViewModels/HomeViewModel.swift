//
//  HomeViewModel.swift
//  SwallowCoin
//
//  Created by Mohammad Afshar on 13/10/2023.
//#colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 1)

import Foundation

class HomeViewModel: ObservableObject {
    @Published var recivedData = [CoinDataModel]()
    @Published var topCoin = [CoinDataModel]()
    @Published var finishLoading = false
    
    init() {
        fetchCoinData()
    }
    
    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        guard let url = URL(string: urlString) else {
            print("Debug Error: Invalid URL")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil else {
                print("\n\n data task failed with error -> \(error!) \n\n")
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print ("Debug Check: URLsession Response Success")
            } else if let httpResponse = response as? HTTPURLResponse {
                print ("Debug Warning: URLsession Response Unexpected Status Code \(httpResponse.statusCode)")
            }
            
            if let data = data {
                if let decodedJson = self?.parseJson(data) {
                    DispatchQueue.main.async {
                        self?.recivedData = decodedJson
                        print(decodedJson)
                        self?.topMoverCoins()
                        self?.finishLoading = true
                    }
                } else {
                    print("Debug Error : Cant assine decoded json to decodedJson property")
                }
            } else {
                print("\n\n Cannot Unwrap data from data task \n\n")
            }
        }
        dataTask.resume()
    }
    
    func parseJson(_ data: Data) -> [CoinDataModel]? {
        do {
            /// Dont Forget : use [].self if json file is a array
            let decodedJson = try JSONDecoder().decode([CoinDataModel].self, from: data)
            return decodedJson
        } catch let error {
            print("\n\n Debug Error: JSONDecoder Failed -> \(error) \n\n")
        }
        return nil
    }
    
    func topMoverCoins() {
        let sorted = recivedData.sorted {
            ($0.priceChangePercentage24H ?? 0) > ($1.priceChangePercentage24H ?? 1)
        }
        self.topCoin = Array(sorted.prefix(10))
    }
}
