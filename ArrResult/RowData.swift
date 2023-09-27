////
////  RowData.swift
////  SherwoodSwiftUI
////
////  Created by Alex Beattie on 1/1/21.
////
//
//import SwiftUI
//
//struct RowData: View {
//    
//    var listing: Value
//    var body: some View {
//        
//        ZStack {
//            VStack (alignment: .leading, spacing: 12) {
//                
//                HStack (alignment: .bottom, spacing: 20){
//                    
//                    VStack (alignment: .leading) {
//                        Text("$\(listing.ListPrice ?? "")")
//                            .font(.system(size: 16, weight: .semibold))
//                            .foregroundColor(Color(.label))
//                        Text("Price")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(.gray)
//                    }
//                    Spacer()
//                    
//                    VStack (alignment: .leading) {
//                        Text("\(listing.BedroomsTotal ?? "")")
//                            .font(.system(size: 16, weight: .semibold))
//                            .foregroundColor(Color(.label))
//                        Text("Beds")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(.gray)
//                    }
//                    Spacer()
//                    
//                    VStack (alignment: .leading) {
//                        Text("\(listing.BathroomsTotalDecimal)")
//                            .font(.system(size: 16, weight: .semibold))
//                            .foregroundColor(Color(.label))
//                        Text("Baths")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(.gray)
//                    }
//                    
//                    Spacer()
//                    
//                    VStack (alignment: .leading) {
//                        Spacer()
//                        Text("\(listing.BuildingAreaTotal, specifier: "%.0f")")
//                            .font(.system(size: 16, weight: .semibold))
//                            .foregroundColor(Color(.label))
//                        
//                        Text("Sq Feet")
//                            .font(.system(size: 14, weight: .regular))
//                            .foregroundColor(.gray)
//                        
//                    }
//                }.padding(.horizontal)
//                
//                HStack (alignment: .lastTextBaseline, spacing: 0){
//                    
//                    VStack (alignment:.center) {
//                        HStack {
//                            VStack (alignment: .leading){
//                                Text(listing.UnparsedAddress)
//                                    .font(.system(size: 14, weight: .regular))
//                                    .foregroundColor(Color(.gray))
//                                HStack {
//                                    Text("\(listing.City),")
//                                        .font(.system(size: 14, weight: .regular))
//                                        .foregroundColor(Color(.gray))
//                                    Text("\(listing.StateOrProvince),")
//                                        .font(.system(size: 14, weight: .regular))
//                                        .foregroundColor(Color(.gray))
//                                    Text(listing.PostalCode)
//                                        .font(.system(size: 14, weight: .regular))
//                                        .foregroundColor(Color(.gray))
//                                }
//                                
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//        }
//    }
//}
//
//struct RowData_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//        RowData(listing: listing)
//    }
//}
