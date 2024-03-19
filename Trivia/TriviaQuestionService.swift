//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Reva Mahto on 3/18/24.
//

import Foundation

class TriviaQuestionService {
    
    enum APIError: Error {
        case invalidURL
        case requestFailed
        case invalidData
    }
    
    func fetchTriviaQuestions(completion: @escaping ([TriviaQuestion]?, Error?) -> Void) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=5&type=multiple") else {
            completion(nil, APIError.invalidURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(nil, APIError.requestFailed)
                return
            }
            
            guard let data = data else {
                completion(nil, APIError.invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(TriviaAPIResponse.self, from: data)
                completion(response.results, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}


