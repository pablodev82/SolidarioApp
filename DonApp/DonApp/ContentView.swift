//
//  ContentView.swift
//  DonApp
//
//  Created by Admin on 05/03/2025.
//


import SwiftUI

struct DonationView: View {
    @State private var donationAmount: String = ""
    @State private var confirmationMessage: String = ""
  
    let causes = [
        ("Educacion", "book.fill"),
        ("Children", "person.2.fill"),
        ("Medicos", "cross.case.fill"),
        ("Ambiente", "leaf.fill"),
        ("Animales", "hare.fill"),
        ("Artes & Cultura", "paintbrush.fill"),
        ("Comunidades", "person.3.fill"),
        ("Desastres Naturales", "flame.fill"),
        ("Otros", "questionmark.circle.fill")
    ]
    
    @State private var selectedCause = "General Charity" // Default cause

    var body: some View {
        NavigationView {
            VStack {
                Text("Simulador de Donaciones")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    TextField("Monto a Donar (USD)  👈  🙏", text: $donationAmount)
                        .keyboardType(.decimalPad)
                        .padding()
                        .border(Color.blue.opacity(0.8), width: 1)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                        .padding(.horizontal, 30)

                    Text("Selecciona un causa")
                        .font(.headline)
                        .padding(.top)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                    ForEach(causes, id: \.0) { cause, icon in
                        Button(action: {
                            selectedCause = cause
                        }) {
                            VStack {
                                Image(systemName: icon)
                                    .font(.title)
                                    .foregroundColor(selectedCause == cause ? .white : .blue)
                                Text(cause)
                                    .font(.footnote)
                                    .foregroundColor(selectedCause == cause ? .white : .blue)
                            }
                            .frame(width: 90, height: 90)
                            .background(selectedCause == cause ? Color.blue : Color.gray.opacity(0.2)) // hacel el cambio de color
                            .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button("Donar Ahora  💸") {
                    simulateDonation()
                }
                .font(.title)
                .padding(.top, 5)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .cornerRadius(12)
                .shadow(radius: 3)
                .padding(.horizontal, 30)
                
                if !confirmationMessage.isEmpty {
                    Text(confirmationMessage)
                        .padding()
                        .foregroundColor(.green)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Donation App", displayMode: .inline)
        }
    }
        
        func simulateDonation() {
            guard let amount = Double(donationAmount), amount > 0  else {
                confirmationMessage = "Por favor, ingresa un monto valido."
                return
            }
            
            confirmationMessage = "¡¡¡ Gracias por donar $\(String(format: "%.2f", amount)) USD a \(selectedCause) 👍 !!!"
            donationAmount = ""
        }
    }

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}
 
