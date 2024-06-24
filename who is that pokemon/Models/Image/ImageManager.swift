//
//  ImageManager.swift
//  who is that pokemon
//
//  Created by David De la Hoz on 23/06/24.
//

import Foundation

protocol ImageManagerDelegate {
    func didUpdateImage(imageModel: ImageModel)
    func didFailWithErrorImage(error: Error)
}

struct ImageManager {
    var delegate: ImageManagerDelegate?
    
    func fetchImage(with imageUrl: String) {
        performRequest(with: imageUrl)
    }
    
    private func performRequest(with imageUrl: String) {
        if let url = URL(string: imageUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data,_,error) in
                if error != nil {
                    self.delegate?.didFailWithErrorImage(error: error!)
                }
                
                if let safeData = data {
                    if let imageModel = parseJSON(imageData: safeData) {
                        self.delegate?.didUpdateImage(imageModel: imageModel)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(imageData: Data) -> ImageModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ImageData.self, from: imageData)
            let imageModel = ImageModel(imageURL: decodedData.sprites?.other?.officialArtWork?.frontDefault ?? "")
            return imageModel
        } catch {
            return nil
        }
    }
}
