//
//  LoadUsersManager.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/3/21.
//

import Foundation

//MARK:- URL Request

final class LoadUsersManager {
    
    static let shared = LoadUsersManager()
    
    let baseUrl = Constants.apiUrl
    
    func getUsersData (success: @escaping ([UsersModel]) -> Void, failure: @escaping (String) -> Void) {
        guard let requestUrl = URL(string: self.baseUrl) else { return }
        
        URLSession.shared.dataTask(with: requestUrl) {(data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("API Status: \(httpResponse.statusCode)")
            }
            guard let returnedApiData = data, error == nil else {
                print("The error is \(error?.localizedDescription ?? "There is an error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([UsersModel].self, from: returnedApiData)
                success(decodedData)
               
            } catch {
                failure("The decoding\(error)")
            }
            
        }.resume()
    }
}
