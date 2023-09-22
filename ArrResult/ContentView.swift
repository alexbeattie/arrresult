//
//  ContentView.swift
//  ArrResult
//
//  Created by Alex Beattie on 9/22/23.
//

import SwiftUI

struct Listing: Codable {
    let value: [Value]
}
struct Value: Codable {
    var BuyerAgentEmail: String?
    var ClosePrice: Int?
    var CoListAgentFirstName: String
    var CoListAgentLastName: String
    var Latitude: Float?
    var Longitude: Float?
    var ListPrice: Int?
    var BedroomsTotal: Int?
    var LotSizeAcres: Double?
    var MlsStatus: String
    var OffMarketDate: String?
    var OnMarketDate: String?
    var PendingTimestamp: String?
    var Media: [Media]
    var ListingKey: String
}
struct Media: Codable {
    var MediaCategory: String
    var MediaURL: String?
}


struct ContentView: View {
    @State private var results = [Value]()
    var body: some View {
        List(results, id:\.ListingKey) { item in
            VStack(alignment: .leading) {
                Text(item.CoListAgentFirstName)
                    .font(.headline)
                Text(item.CoListAgentLastName)
            }
        }
        .task {
            await loadData()
            
        }
    .padding()
    }
    func loadData() async {
        guard let url = URL(string: "http://lireadgroup.com/sparkData.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            if let decodedResponse = try? JSONDecoder().decode(Listing.self, from: data) {
                results = decodedResponse.value
            }
            print(results)
            // more code to come
        } catch {
            print("Invalid data")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
