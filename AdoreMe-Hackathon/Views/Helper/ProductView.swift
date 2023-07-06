//
//  ProductView.swift
//  AdoreMe-Hackathon
//
//  Created by Andrei.M-AM on 06.07.2023.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image("product_Image")
                    .resizable()
                    .aspectRatio(7/9, contentMode: .fill)
                    .scaledToFit()
                
                Image(systemName: "heart")
                    .resizable()
                     .frame(width: 12, height: 12)
                     .foregroundColor(.black)
                     .padding(8)
                     .background(Color.white)
                     .clipShape(Circle())
                     .padding(.top, 16)
                     .padding(.trailing, 16)
            }
            
            ZStack {
                Color("SocialColor")
                    .frame(width: .infinity)
                Text("Bestseller")
                    .font(.system(size: 14))
               
            }
            .frame(height: 24)
         
            .padding(.top, -8)
            
            Text("NEW! Carina DD+ Contour")
                .font(.system(size: 11))
                .padding(.bottom, 2)
            
            Text("Diletta Push Up")
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(Color("BodyPrimaryText"))
                .padding(.bottom, 2)
             
            
            HStack {
                Text("$39.95")
                    .font(.system(size: 14))
                Text("$49.95")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
            }
            
            HStack {
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 13, height: 13)
                
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 13, height: 13)
            }

        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .frame(width: 194, height: 383)
    }
}
