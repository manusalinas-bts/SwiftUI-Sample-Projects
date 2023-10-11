//
//  ContentView.swift
//  SettingsFormApp
//
//  Created by Manuel Salinas on 7/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var deviceName = "iPhone 15 Pro Max"
    @State private var isSoundenabled = false
    
    @State private var emailIndex = 0
    private var emailOptions = ["All", "Transactional", "Marketing", "Personal"]
    
    @State private var volumeSliderValue: Double = 50
    @State private var stepper: Int = 0
    @State private var date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Device Name") {
                    TextField("Name", text: $deviceName)
                }
                
                Section("General") {
                    Toggle("Sound", isOn: $isSoundenabled)
                    
                    Picker("Email", selection: $emailIndex) {
                        ForEach(emailOptions.indices, id: \.self) {
                            Text(self.emailOptions[$0])
                        }
                    }
                    
                    VStack {
                        Text("Volume")
                        
                        Slider(value: $volumeSliderValue, in: 0...100, step: 1) {
                            EmptyView()
                        } minimumValueLabel: {
                            Image(systemName: "speaker.wave.1.fill")
                            
                        } maximumValueLabel: {
                            Image(systemName: "speaker.wave.3.fill")
                        }
                        
                        Text("\(volumeSliderValue.formatted(.number)) %")
                            .font(.caption)
                    }
                    
                    Stepper(value: $stepper, in: 0...10) {
                        Text("Alertas: \(stepper)")
                    }
                    
                    DatePicker("Fecha", selection: $date, displayedComponents: .date)
                }
                
                Button {
                    reset()
                } label: {
                    Text("Reset")
                        .foregroundStyle(.red)
                }


            }
            .navigationTitle("Settings")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.indigo, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Image(systemName: "gear")
                        .onTapGesture {
                            print("accion")
                        }
                }
            }
        }
    }
    
    private func reset() {
        deviceName = ""
        isSoundenabled = false
        emailIndex = 0
        volumeSliderValue = 50
        stepper = 0
        date = Date()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
