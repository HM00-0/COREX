import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.2), .gray.opacity(0.1)]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image(systemName: "building.2.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.blue)
                        .shadow(radius: 10)

                    VStack(spacing: 4) {
                        Text("Welcome to")
                            .font(.title2)
                            .foregroundColor(.blue)

                        Text("COREX")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .foregroundColor(.blue)
                    }

                    NavigationLink(destination: ChatView()) {
                        Text("Start Chat")
                            .font(.headline)
                            .padding() 
                            .frame(width: 200)
                            .background(Color.blue.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(12)//coins
                            .shadow(radius: 4)
                    }
                }
                .padding()
            }
        }
    }
}
