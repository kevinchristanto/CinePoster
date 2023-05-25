//
//  ResultView.swift
//  CinePoster
//
//  Created by Kevin Christanto on 23/05/23.
//

import SwiftUI

struct ResultView: View {
    
    public var movies: Movie
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(AppColor.secondary)
                
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 359, height: 573)
                    .cornerRadius(11)
                
                VStack(alignment: .leading){
                    Image(uiImage: movies.imagePoster) //ini diganti sesuai dengan image yang diinput user gmn ya???
                        .resizable()
                        .frame(width: 300, height: 450)
                        .cornerRadius(22)
                    
                    Text(movies.title)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(AppColor.primary)
                        .padding(.bottom, 4)
                    
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .foregroundColor(AppColor.secondary)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(AppColor.primary, lineWidth: 1)
                                )

                            Text(movies.genre1)
                                .foregroundColor(AppColor.primary)
                                .fontWeight(.medium)
                                .font(.system(size: 12))
                                .padding(.horizontal)
                            
                        }
                        .fixedSize(horizontal: true, vertical: false)


                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .foregroundColor(AppColor.secondary)
                                .frame()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .stroke(AppColor.primary, lineWidth: 1)
                                )

                            Text(movies.genre2)
                                .foregroundColor(AppColor.primary)
                                .font(.system(size: 12))
                                .padding(.horizontal)
                            
                        }
                        .fixedSize(horizontal: true, vertical: false)
                    }
                    
                }.frame(width: 359, height: 530)
            }
        }
        .navigationBarTitle("Result")
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(movies: Movie(imagePoster: (UIImage(named: "testing"))!, title: "Surat Cinta Untuk Starla (2017)", genre1: "Drama", genre2: "Romance"))
    }
}
