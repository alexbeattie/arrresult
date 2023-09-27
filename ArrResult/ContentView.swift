//
//  ContentView.swift
//  ArrResult
//
//  Created by Alex Beattie on 9/22/23.
//

import SwiftUI
import Kingfisher

struct Listing: Codable {
    let value: [Value]
}
struct Value: Codable {
    var BuyerAgentEmail: String?
    var ClosePrice: Int?
    var CoListAgentFullName: String
    var ListAgentFullName: String
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
    var UnparsedAddress: String
    var PostalCode: String
    var StateOrProvince: String
    var City: String
    var BathroomsTotalDecimal: Float
    var Model: String?
}
struct Media: Codable {
    var MediaCategory: String
    var MediaURL: String?
}


struct ContentView: View {
    @State private var results = [Value]()
    let columns = [
        GridItem()]

    var body: some View {
        NavigationView {
            ScrollView {
//                LazyVGrid(columns: columns) {
                    ForEach(results, id:\.ListingKey) { item in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: item.Media.first?.MediaURL ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width:400, height:200)

                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 400, height: 250)
//                                .resizable()
//                            KFImage(URL(string: item.Media.first?.MediaURL ?? ""))
//                                .resizable()
//                                .scaledToFill()
//                                .cornerRadius(6)
//                                .frame(width:400, height:200)
//                                .clipped()
                          
                            ZStack {
                                VStack (alignment: .leading, spacing: 12) {
                                
                                            HStack {
                                                VStack{
                                                    Text(item.UnparsedAddress)
                                                        .font(.system(size: 16, weight: .regular))
                                                        .foregroundColor(Color(.white))
                                                    HStack {
                                                        Text("\(item.Model ?? "Not Named")")
                                                            .font(.system(size: 14, weight: .regular))
                                                            .foregroundColor(Color(.gray))
                                                        Text("\(item.MlsStatus)")
                                                            .font(.system(size: 14, weight: .heavy))
                                                            .foregroundColor(Color(.white))
//                                                        Text(item.PostalCode)
//                                                            .font(.system(size: 14, weight: .regular))
//                                                            .foregroundColor(Color(.gray))
                                                        
                                                    }
                                                    HStack {
//                                                        Text(item.CoListAgentFullName)
                                                        Text("$")
                                                        Text(String(item.ListPrice ?? 0))
                                                            .font(.system(size: 14, weight: .regular))
                                                            .foregroundColor(Color(.gray))
                                                            

                                                    }
                                                    .padding(.horizontal)
                                            }
                                        }
                                        .padding(.horizontal)
                                    
                                }
                            }
                      

                        }

                        
                    }
                
                
                .task {
                    await loadData()
                    
                }
                
            }
            .navigationTitle("Alex")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            
            //            .border(Color.yellow, width: 3)
            //            .background(Color.blue)
            //            .padding(10)
            //            .border(Color.red, width: 3)
            
            
            //            .padding(.vertical)
        }
    }
    func loadData() async {
        guard let url = URL(string: "http://lireadgroup.com/sparkDataTwo.json") else {
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
