//
//  ContentView.swift
//  ThemeConfigurationScreen
//
//  Created by Israel Pinheiro Braga Mesquita on 21/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDarkMode = false
    @State var automaticThemeToggle = true
    @State var manualLightThemeToggle = true
    @State var manualDarkThemeToggle = false
    @State var boldTextToggle = false
    @State var trueToneToggle = false
    @State var sliderValue = 50.0
    private let footerText = 
        """
        Automatically adapt iPhone display based on 
        ambient lightning conditions to make colors appear
        consitent in different environments.
        """
    
    var body: some View {
        Form {
            Section("APPEARANCE") {
                HStack {
                    VStack {
                        Spacer()
                        Image("light_theme")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 200)
                        Spacer()
                        Text("Light")
                        Spacer()
                        Image(systemName: manualLightThemeToggle ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(manualLightThemeToggle ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                isDarkMode = false
                                if !manualLightThemeToggle {
                                    manualLightThemeToggle.toggle()
                                    manualDarkThemeToggle = !manualLightThemeToggle
                                }
                            }
                    }
                    VStack {
                        Spacer()
                        Image("dark_theme")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 200)
                        Spacer()
                        Text("Dark")
                        Spacer()
                        Image(systemName: manualDarkThemeToggle ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(manualDarkThemeToggle ? Color(UIColor.systemBlue) : Color.secondary)
                            .onTapGesture {
                                isDarkMode = true
                                if !manualDarkThemeToggle {
                                    manualDarkThemeToggle.toggle()
                                    manualLightThemeToggle = !manualDarkThemeToggle
                                }
                            }
                    }
                }
                HStack {
                    Text("Automatic")
                    Spacer()
                    Toggle("", isOn: $automaticThemeToggle)
                }
                HStack {
                    Text("Actions")
                    Spacer()
                    Text("Light Until Sunset")
                        .foregroundStyle(Color.gray)
                        .font(.system(.callout))
                }
            }
            
            Section {
                HStack {
                    Text("Text Size")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
                HStack {
                    Text("Bold Text")
                    Spacer()
                    Toggle("", isOn: $boldTextToggle)
                }
            }
            
            
            Section(header: Text("BRIGHTNESS"), footer: Text(footerText)) {
                HStack {
                    Image(systemName: "sun.max.fill")
                    Slider(value: $sliderValue, in: 0...100)
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                HStack {
                    Text("True Tone")
                    Spacer()
                    Toggle("", isOn: $trueToneToggle)
                }
            }
            
            Section {
                HStack {
                    Text("Night Shift")
                    Spacer()
                    Text("10pm to 7am")
                        .foregroundStyle(Color.gray)
                        .font(.system(.callout))
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    ContentView()
}
