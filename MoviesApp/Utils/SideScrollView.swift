//
//  SideScrollView.swift
//  MoviesApp
//
//  Created by Mustafa Okay on 23.12.2022.
//

import SwiftUI

struct SideScrollView: View {
    var resultArr: [Result]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(resultArr) { data in
                    NavigationLink {
                        DetailView(movie: data)
                    } label: {
                        VStack {
                            AsyncImage(url: URL(string: Constants.imageSizew300 + (data.posterPath ?? "")), scale: 3) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(10)
                                    .frame(width: 150, height: 250)
                            } placeholder: {
                                ProgressView()
                            }
                            Spacer()
                        }
                        .padding(8)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct SideScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SideScrollView(resultArr: [Result.expResult])
    }
}
