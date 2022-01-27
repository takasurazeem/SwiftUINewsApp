//
//  SettingsView.swift
//  SwuiftUINewsApp
//
//  Created by Takasur Azeem on 27/01/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Display"),
                        footer: Text("System Settigns will override the Dark Mode and use the current device theme.")) {
                    
                    Toggle(isOn: $darkModeEnabled) {
                        Text("Dark Mode")
                    }
                    .onChange(of: darkModeEnabled) { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    }
                    
                    Toggle(isOn: $systemThemeEnabled) {
                        Text("Use System Settings")
                    }
                    .onChange(of: systemThemeEnabled) { _ in
                        SystemThemeManager.shared.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)
                    }
                }
                Section() {
                    Link(destination: URL(string: "https://www.linkedin.com/in/takasur-azeem/")!) {
                        Label("LinkedIn: takasur-azeem", systemImage: "link")
                    }
                }
                .foregroundColor(Theme.textColour)
                .font(.system(size: 16, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(darkModeEnabled: .constant(true), systemThemeEnabled: .constant(false))
    }
}
