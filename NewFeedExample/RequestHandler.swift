//
//  RequestHandler.swift
//  NewFeedExample
//
//  Created by Venkat Pericharla on 18/12/21.
//

import Foundation
import SwiftUI

enum RequestMethod: String {
    
    case GET
    case POST
    case PUT
    case DELETE
}


struct RequestHandler {
    
    init() {
        
        
    }
    
    func makeRequest<T: Codable>(url: String, requestMethod: RequestMethod = .GET, headers: [String: String] = [:], dataType: T ,onCompletion: @escaping (Result<T, NSError>)->Void){
        
        OperationQueue.current?.addOperation {
            
            guard let request = self.prepareRequest(url: url, reqMethod: requestMethod, headers: headers)
            else {
                
                return
            }
            
            let config = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: config)
            
            urlSession.dataTask(with: request) { data, res, error in
                do {
                    let json = JSONDecoder()
                    let dataObj = try json.decode(T.self, from: data!)
                    onCompletion(.success(dataObj))
                }catch{}
            }.resume()
        }
        
    }
    
    private func updateRequestHeaders(headers: [String: String]?, request: inout URLRequest) {
        
        // add any defaukt headers for all the requests
        
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        // add headers specific to request
        
        for header in headers ?? [:] {
            
            request.addValue(header.key, forHTTPHeaderField: header.value)
        }
        
    }
    
    private func prepareRequest(url: String, reqMethod: RequestMethod, headers: [String: String]?) -> URLRequest? {
        
        guard let url = URL(string: url) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = reqMethod.rawValue
        self.updateRequestHeaders(headers: headers, request: &urlRequest)
        return urlRequest
    }
    
}

