//
//  Onboarding.swift
//  CinePoster
//
//  Created by Kevin Christanto on 20/05/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(AppColor.secondary)
            
            VStack{
                Text(Prompt.Title.onboard)
                    .fontWeight(.bold)
                    .font(.system(size: 34))
                    .multilineTextAlignment(.center)
                    .foregroundColor(AppColor.primary)
                    .padding(.bottom, 80)
                    .padding(.top, 80)
                
                VStack {
                    HStack{
                        Image(systemName: Prompt.Image.plusCircle)
                            .font(.system(size: 48))
                            .foregroundColor(AppColor.primary)
                        
                        VStack (alignment: .leading){
                            Text(Prompt.Instructions.title1)
                                .font(.footnote)
                                .fontWeight(.bold)
                            
                            Text(Prompt.Instructions.content1)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(AppColor.textColor)
                            
                        }
                    }.frame(width: 337, height: 56)
                        .padding(.bottom, 29)
                    
                    HStack{
                        Image(systemName: Prompt.Image.predict)
                            .font(.system(size: 44))
                            .foregroundColor(AppColor.primary)
                        
                        VStack (alignment: .leading){
                            Text(Prompt.Instructions.title2)
                                .font(.footnote)
                                .fontWeight(.bold)
                            
                            Text(Prompt.Instructions.content2)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(AppColor.textColor)
                            
                        }
                    }.frame(width: 337, height: 56)
                    
                    Spacer()
                    
                    Button(action: {
                        isPresented = false
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 305, height: 41)
                                .cornerRadius(12)
                                .foregroundColor(AppColor.primary)
                            
                            Text(Prompt.Button.next)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
            }
        }
    }
    
    struct Onboarding_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView(isPresented: .constant(true))
        }
    }
}
