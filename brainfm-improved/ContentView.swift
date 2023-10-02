//
//  ContentView.swift
//  brainfm-improved
//
//  Created by Baiel Kulikovsky on 30/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying: Bool = false {
        didSet{
            if isPlaying {
                startPlaying()
            } else {
                pausePlaying()
            }
        }
    }
    @State private var currentPosition: CGFloat = 0
    @State private var isLiked: Bool = false
    @State private var isAnimated: Bool = false
    @State private var isPlayingNowOpen: Bool = false
    @GestureState private var offset: CGSize = .zero
    
    
    let placeholderCardInfo: [[String: String]] = [
        [
            "levelOfEnergy": "high",
            "title": "exaltation",
            "subtitle": "deep work · paino",
            "artwork" : "https://plus.unsplash.com/premium_photo-1663937462527-f1e9fa235851?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YWJzdHJhY3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"
        ],
        [
            "levelOfEnergy": "medium",
            "title": "serenity",
            "subtitle": "meditation · yoga",
            "artwork": "https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YWJzdHJhY3R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60"
        ],
        [
            "levelOfEnergy": "low",
            "title": "tranquility",
            "subtitle": "reading · nature walk",
            "artwork": "https://images.unsplash.com/photo-1618005198919-d3d4b5a92ead?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGFic3RyYWN0fGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
        ],
        [
            "levelOfEnergy": "high",
            "title": "euphoria",
            "subtitle": "dancing · party",
            "artwork": "https://images.unsplash.com/photo-1604079628040-94301bb21b91?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGFic3RyYWN0fGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
        ],
        [
            "levelOfEnergy": "medium",
            "title": "relaxation",
            "subtitle": "spa · massage",
            "artwork": "https://images.unsplash.com/photo-1534312527009-56c7016453e6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGFic3RyYWN0fGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
        ],
        [
            "levelOfEnergy": "low",
            "title": "calmness",
            "subtitle": "breathing · mindfulness",
            "artwork": "https://images.unsplash.com/photo-1561212044-bac5ef688a07?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGFic3RyYWN0fGVufDB8fDB8fHww&auto=format&fit=crop&w=900&q=60"
        ]
    ]
    
    
    var body: some View {
        ZStack{
            VStack{
                HStack(alignment: .center){
                    AsyncImage(url: URL(string: "https://pbs.twimg.com/profile_images/1700634521312374784/fGkryAm1_400x400.jpg")!) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person.circle")
                    }
                    .frame(width: 30, height: 30)
                    
                    Spacer()
                    Button{
                    } label: {
                        Image(systemName: "heart.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                    }
                }
                .padding()
                Spacer()
                ZStack{
                    VStack(spacing: 8){
                        HStack{
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .font(.title)
                                .contentTransition(.symbolEffect(.replace.downUp.byLayer))
                            Text("Focus")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        .onTapGesture {
                            withAnimation{
                                isPlaying.toggle()
                            }
                        }
                        .sensoryFeedback(.impact(flexibility: .soft, intensity: 1), trigger: isPlaying)
                        
                        HStack(alignment: .center){
                            Image(systemName: "wand.and.stars.inverse")
                            Text("Change Mood")
                                .font(.subheadline)
                        }
                        .fontWeight(.semibold)
                        .padding(.vertical, 9)
                        .padding(.horizontal, 12)
                        .background(.white.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                    }
                    .zIndex(2)
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.pink, .orange],
                                startPoint: .bottomLeading,
                                endPoint: .topTrailing
                            )
                        )
                        .blur(radius: 50)
                        .padding()
                        .zIndex(1)
                        .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                        .scaleEffect(isAnimated ? 1.05 : 0.95)
                        .animation(.linear(duration: 5).repeatForever(autoreverses: true), value: isAnimated)
                        .onAppear{
                            isAnimated.toggle()
                        }
                }
                .foregroundStyle(.white)
                .fontWeight(.bold)
                
                Spacer()
                VStack(alignment: .leading){
                    HStack{
                        Text("Recommended for you")
                            .foregroundStyle(.white.opacity(0.5))
                            .textCase(.uppercase)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(placeholderCardInfo, id: \.self) { cardInfo in
                                RecommendCard(levelOfEnergy: cardInfo["levelOfEnergy"]!, title: cardInfo["title"]!, subtitle: cardInfo["subtitle"]!, artwork: cardInfo["artwork"]!)
                            }
                        }
                        .padding(.horizontal)
                        .scrollTargetLayout()
                        .frame(height: 160)
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
                HStack{
                    Image(systemName: "gauge.with.dots.needle.0percent")
                        .font(.system(size: 20))
                        .opacity(0.8)
                    VStack(alignment: .leading){
                        Text("exaltation")
                            .font(.system(size: 13.5))
                            .fontWeight(.semibold)
                        Text("DEEP WORK · PIANO")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .opacity(0.5)
                    }
                    .onTapGesture {
                        withAnimation{
                            isPlayingNowOpen.toggle()
                        }
                    }
                    Spacer()
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .contentTransition(.symbolEffect(.replace.downUp.byLayer))
                        .sensoryFeedback(.impact(flexibility: .soft, intensity: 1), trigger: isLiked)
                        .onTapGesture{
                            withAnimation{
                                isLiked.toggle()
                            }
                        }
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(.black.opacity(0.4))
                .overlay(
                        ZStack {
                            VStack {
                                Spacer()
                                Rectangle()
                                    .fill(Color.white.opacity(0.3))
                                    .frame(maxWidth: .infinity, maxHeight: 3)
                            }
                            VStack {
                                Spacer()
                                HStack {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(maxWidth: .infinity, maxHeight: 3)
                                        .frame(width: currentPosition)
                                    Spacer()
                                }
                            }
                        }
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .offset(y: isPlayingNowOpen ? 80 : 0)
                .animation(.spring(), value: isPlayingNowOpen)
                
                Spacer()
            }
            .opacity(isPlayingNowOpen ? 0 : 1)
            .animation(.spring(), value: isPlayingNowOpen)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.1, green: 0.13, blue: 0.25))
            
            if isPlayingNowOpen {
                playingNow(isPlaying: $isPlaying, isLiked: $isLiked)
                    .transition(.move(edge: .bottom).animation(.spring(duration: 0.1)))
                    .opacity(isPlayingNowOpen ? 1 : 0)
                    .offset(y: offset.height > 0 ? offset.height : 0)
                    .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                        .updating($offset) { value, gestureOffset, _ in
                            gestureOffset = value.translation
                        }
                        .onEnded { value in
                            if value.translation.height > 10 {
                                withAnimation {
                                    isPlayingNowOpen = false
                                }
                            }
                        }
                    )
            }
            
        }
    }
    
    func startPlaying() {
        // Start playing logic goes here
        currentPosition = 0 // Reset position
        withAnimation(.linear(duration: 60)) {
            // Update currentPosition to the desired final value
            currentPosition = 300
        }
    }

    func pausePlaying() {
        // Pause playing logic goes here
        withAnimation(.linear(duration: 0.2)) {
            // Update currentPosition to the current progress position
            currentPosition = currentPosition
        }
    }
}

#Preview {
    ContentView()
}
