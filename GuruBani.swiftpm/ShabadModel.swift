//
//  File.swift
//  EkamBani
//
//  Created by Astha on 11/02/25.
//

import Foundation

enum Language: String, CaseIterable {
    case punjabi = "Punjabi"
    case hinglish = "Hinglish"
    case english = "English"
}

struct Shabad: Identifiable {
    let id: Int
    let title: String
    let punjabi: String
    let hinglish: String
    let english: String
    
    static let allShabads: [Shabad] = [
        Shabad(
            id: 1,
            title: "Mul Mantar",
            punjabi: "ੴ ਸਤਿ ਨਾਮੁ ਕਰਤਾ ਪੁਰਖੁ ਨਿਰਭਉ ਨਿਰਵੈਰੁ ਅਕਾਲ ਮੂਰਤਿ ਅਜੂਨੀ ਸੈਭੰ ਗੁਰ ਪ੍ਰਸਾਦਿ ॥",
            hinglish: "Ik Onkar Sat Naam Karta Purakh Nirbhau Nirvair Akal Murat Ajuni Saibhang Gur Prasad",
            english: "One Universal Creator God, The Name Is Truth, Creative Being Personified, No Fear, No Hatred, Image Of The Undying, Beyond Birth, Self-Existent, By Guru's Grace"
        ),
        Shabad(
            id: 2,
            title: "Japji Sahib",
            punjabi: "ਆਦਿ ਸਚੁ ਜੁਗਾਦਿ ਸਚੁ ॥ ਹੈ ਭੀ ਸਚੁ ਨਾਨਕ ਹੋਸੀ ਭੀ ਸਚੁ ॥",
            hinglish: "Aad Sach Jugaad Sach || Hai Bhi Sach Nanak Hosi Bhi Sach ||",
            english: "True In The Beginning, True Throughout The Ages, True Here And Now. O Nanak, Forever And Ever True."
        ),
        Shabad(
            id: 3,
            title: "So Dar (Rehras)",
            punjabi: "ਸੋ ਦਰੁ ਤੇਰਾ ਕੇਹਾ ਸੋ ਘਰੁ ਕੇਹਾ ਜਿਤੁ ਬਹਿ ਸਰਬ ਸਮਾਲੇ ॥",
            hinglish: "So Dar Tera Keha So Ghar Keha Jit Beh Sarab Samale ||",
            english: "What is that Gate, and what is that Home, in which You sit and take care of all?"
        ),
        Shabad(
            id: 4,
            title: "Sohila",
            punjabi: "ਸੋਹਿਲਾ ਰਾਗੁ ਗਉੜੀ ਦੀਪਕੀ ਮਹਲਾ ੧",
            hinglish: "Sohila Rag Gauri Deepaki Mehla 1",
            english: "Sohila, The Song Of Praise in Raga Gauri Deepaki, First Mehl"
        )
    ]
} 
