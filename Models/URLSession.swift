//
//  URLSession.swift
//  movies
//
//  Created by Kripa Lamichhane on 3/13/23.
//

import Foundation

 let session = URLSession.shared


//struct URLSession{
  
    
    
    func getRessies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        var urlRequest = URLRequest(url: url)
       
        urlRequest.allHTTPHeaderFields = ["Authorization" : ""]
      session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                return
            }
            if let httpResponse = response as?HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    if let confirmedData = data{
                        print(confirmedData)
                    }
                }
            }
        }
    }


