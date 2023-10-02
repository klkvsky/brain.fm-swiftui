//
//  playingNow.swift
//  brainfm-improved
//
//  Created by Baiel Kulikovsky on 1/10/23.
//

import SwiftUI

struct playingNow: View {
    @Binding var isPlaying: Bool
    @Binding var isLiked: Bool
    @State private var isAnimated: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Spacer()
                Text("42")
                    .fontWeight(.bold)
                    .font(.system(size: 72))
                
                HStack{
                    Image(systemName: "hands.clap.fill")
                        .font(.system(size: 14))
                    Text("1 week streak")
                        .fontWeight(.bold)
                        .padding(.leading, -2)
                }
                .opacity(0.5)
                
                
                Spacer()
                HStack(alignment: .center){
                    Image(systemName: "icloud.and.arrow.down")
                        .font(.system(size: 22))
                    Spacer()
                    VStack(spacing: 2){
                        Text("exaltation")
                            .fontWeight(.semibold)
                            .font(.system(size: 23))
                        Text("DEEP WORK · PIANO")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .opacity(0.5)
                    }
                    Spacer()
                    
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.system(size: 22))
                        .contentTransition(.symbolEffect(.replace.downUp.byLayer))
                        .sensoryFeedback(.impact(flexibility: .soft, intensity: 1), trigger: isLiked)
                        .onTapGesture{
                            withAnimation{
                                isLiked.toggle()
                            }
                        }
                }
                .padding(.horizontal)
                .padding(.top)
                
                RoundedRectangle(cornerRadius: 100)
                    .frame(maxWidth: .infinity, maxHeight: 7)
                    .padding()
                    .opacity(0.5)
                    .overlay{
                        HStack{
                            RoundedRectangle(cornerRadius: 100)
                                .frame(maxWidth: 130, maxHeight: 7)
                            Spacer()
                        }
                        .padding()
                    }
                
                HStack{
                    Image(systemName: "backward.end.fill")
                        .font(.system(size: 38))
                    Spacer()
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .font(.system(size: 50))
                        .contentTransition(.symbolEffect(.replace.downUp.byLayer))
                        .sensoryFeedback(.impact(flexibility: .soft, intensity: 1), trigger: isPlaying)
                        .onTapGesture{
                            withAnimation{
                                isPlaying.toggle()
                            }
                        }
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .font(.system(size: 38))
                }
                .padding(.horizontal, 80)
                .padding(.top, 60)
                
                HStack{
                    Image(systemName: "timer")
                        .font(.system(size: 28))
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.system(size: 28))
                    Spacer()
                    Image(systemName: "gauge.with.dots.needle.0percent")
                        .font(.system(size: 28))
                }
                .padding(.horizontal, 50)
                .padding(.bottom)
                .padding(.top, 70)
            }
            
            ZStack{
                Circle()
                    .stroke(.white, lineWidth: 11)
                    .opacity(0.15)
                    .scaleEffect(isAnimated ? 1.05 : 0.95)
                    .animation(.bouncy(duration: 10).repeatForever(autoreverses: true), value: isAnimated)
                
                Circle()
                    .stroke(.white, lineWidth: 7.8)
                    .opacity(0.1)
                    .scaleEffect(isAnimated ? 1.4 : 1.35)
                    .animation(.bouncy(duration: 10).repeatForever(autoreverses: true), value: isAnimated)
                
                Circle()
                    .stroke(.white, lineWidth: 6.1)
                    .opacity(0.05)
                    .scaleEffect(isAnimated ? 1.8 : 1.75)
                    .animation(.bouncy(duration: 10).repeatForever(autoreverses: true), value: isAnimated)
                
                Circle()
                    .stroke(.white, lineWidth: 5)
                    .opacity(0.03)
                    .scaleEffect(isAnimated ? 2.2 : 2.15)
                    .animation(.bouncy(duration: 10).repeatForever(autoreverses: true), value: isAnimated)
                
                Circle()
                    .stroke(.white, lineWidth: 4.2)
                    .opacity(0.01)
                    .scaleEffect(isAnimated ? 2.6 : 2.55)
                    .animation(.bouncy(duration: 10).repeatForever(autoreverses: true), value: isAnimated)
            }
            .offset(y: -120)
            .onAppear{
                withAnimation{
                    isAnimated = true
                }
            }
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.15, green: 0.13, blue: 0.33).opacity(0.4), location: 0.46),
                    Gradient.Stop(color: Color(red: 0.82, green: 0.25, blue: 0.5).opacity(0.4), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
        .background(Color(red: 0.1, green: 0.13, blue: 0.25))
    }
}

#Preview {
    playingNow(isPlaying: .constant(true), isLiked: .constant(false))
}
