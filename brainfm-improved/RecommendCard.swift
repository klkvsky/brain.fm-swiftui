//
//  RecommendCard.swift
//  brainfm-improved
//
//  Created by Baiel Kulikovsky on 1/10/23.
//

import SwiftUI

struct RecommendCard: View {
    var levelOfEnergy: String
    var title: String
    var subtitle: String
    var artwork: String
    
    var body: some View {
        ZStack{
          
            VStack{
                AsyncImage(url: URL(string: artwork)!) { image in
                    ZStack{
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 160)
                            .opacity(0.6)
                            .zIndex(3)
                        
                        Rectangle().fill(.black)
                            .zIndex(1)
                    }
                } placeholder: {
                }
                .scaleEffect(1.2)
            }
            .zIndex(1)
            .frame(width: 156, height: 156)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.leading, -12)
            .padding(.bottom, -12)
            
            VStack(alignment: .leading){
                Spacer()
                VStack(alignment: .leading){
                    HStack(alignment: .center){
                        Image(systemName: levelOfEnergy == "low" ? "gauge.with.dots.needle.0percent" : levelOfEnergy == "medium" ? "gauge.with.dots.needle.50percent" : "gauge.with.dots.needle.100percent")
                            .font(.caption2)
                        Text(title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.leading, -4)
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    Text(subtitle)
                        .foregroundStyle(.white.opacity(0.5))
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
            }
            .zIndex(2)
            
            LinearGradient(
                colors: [.clear, levelOfEnergy == "low" ? .green : levelOfEnergy == "medium" ? .blue : .red ],
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .padding(.leading, -12)
            .padding(.bottom, -12)
        }
        .padding(.leading, 12)
        .padding(.bottom, 12)
        .frame(minWidth: 160, maxWidth: 160, minHeight: 160, maxHeight: 160)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    RecommendCard(levelOfEnergy: "low", title: "exaltation", subtitle: "deep work · piano", artwork: "https://images.unsplash.com/photo-1618005198919-d3d4b5a92ead?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGFic3RyYWN0fGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60")
}
