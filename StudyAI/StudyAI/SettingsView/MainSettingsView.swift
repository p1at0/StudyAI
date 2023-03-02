//
//  MainSettingsView.swift
//  StudyAI
//
//  Created by Abdulla on 12.02.2023.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account")) {
                    NavigationLink(destination: ProfileView()) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color("Color"))
                            Text("Profile")
                        }
                    }
                    NavigationLink(destination: SecurityView()) {
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(Color("Color"))
                            Text("Security")
                        }
                    }
                }
                Section(header: Text("Notifications")) {
                    NavigationLink(destination: NotificationsView()) {
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundColor(Color("Color"))
                            Text("Notifications")
                        }
                    }
                }
                Section(header: Text("Support")) {
                    NavigationLink(destination: SupportView()) {
                        HStack {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundColor(Color("Color"))
                            Text("Support")
                        }
                    }
                }
            }
            .navigationBarTitle("StudyAI", displayMode: .inline)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .navigationBarTitle("Profile")
    }
}

struct SecurityView: View {
    var body: some View {
        Text("Security")
            .navigationBarTitle("Security")
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Notifications")
            .navigationBarTitle("Notifications")
    }
}

struct SupportView: View {
    var body: some View {
        Text("Support")
            .navigationBarTitle("Support")
    }
}
