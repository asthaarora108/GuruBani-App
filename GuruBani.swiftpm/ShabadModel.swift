//
//  File.swift
//  EkamBani
//
//  Created by Astha on 11/02/25.
//

import Foundation

enum Language: String, CaseIterable {
    case punjabi = "Punjabi"
    case hinglish = "Transliteration"
    case english = "Meaning"
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
            title: "Mool Mantar",
            punjabi: "ੴ ਸਤਿ ਨਾਮੁ ਕਰਤਾ ਪੁਰਖੁ ਨਿਰਭਉ ਨਿਰਵੈਰੁ ਅਕਾਲ ਮੂਰਤਿ ਅਜੂਨੀ ਸੈਭੰ ਗੁਰ ਪ੍ਰਸਾਦਿ॥ ॥ ਜਪੁ ॥ ਆਦਿ ਸਚੁ ਜੁਗਾਦਿ ਸਚੁ॥ ਹੈ ਭੀ ਸਚੁ ਨਾਨਕ ਹੋਸੀ ਭੀ ਸਚੁ॥",
            hinglish: "Ek ong kaar sat naam kartaa purakh nirbha-o nirvair akaal moorat ajoonee saibhang gur prasaad. Jap. Aad sach jugaad sach hai bhee sach Naanak hosee bhee sach.",
            english: "One Universal Creator God, the Name is Truth, Creative Being personified, no fear, no hatred, image of the Undying, beyond birth, self-existent, by Guru’s Grace. Chant and meditate! True in the primal beginning, True throughout the ages, True here and now, O Nanak, forever and ever True."
        ),
        Shabad(
            id: 2,
            title: "Japji Sahib",
            punjabi: "ੴ ਸਤਿਨਾਮੁ ਕਰਤਾ ਪੁਰਖੁ ਨਿਰਭਉ ਨਿਰਵੈਰੁ ਅਕਾਲ ਮੂਰਤਿ ਅਜੂਨੀ ਸੈਭੰ ਗੁਰਪ੍ਰਸਾਦਿ ॥ ॥ ਜਪੁ ॥ਆਦਿ ਸਚੁ ਜੁਗਾਦਿ ਸਚੁ ॥ ਹੈ ਭੀ ਸਚੁ ਨਾਨਕ ਹੋਸੀ ਭੀ ਸਚੁ ॥੧॥ ਸੋਚੈ ਸੋਚਿ ਨ ਹੋਵਈ ਜੇ ਸੋਚੀ ਲਖ ਵਾਰ ॥ ਚੁਪੈ ਚੁਪ ਨ ਹੋਵਈ ਜੇ ਲਾਇ ਰਹਾ ਲਿਵ ਤਾਰ ॥ ਭੁਖਿਆ ਭੁਖ ਨ ਉਤਰੀ ਜੇ ਬੰਨਾ ਪੁਰੀਆ ਭਾਰ ॥ ਸਹਸ ਸਿਆਣਪਾ ਲਖ ਹੋਹਿ ਤ ਇਕ ਨ ਚਲੈ ਨਾਲਿ ॥ ਕਿਵ ਸਚਿਆਰਾ ਹੋਈਐ ਕਿਵ ਕੂੜੈ ਤੁਟੈ ਪਾਲਿ ॥ ਹੁਕਮਿ ਰਜਾਈ ਚਲਣਾ ਨਾਨਕ ਲਿਖਿਆ ਨਾਲਿ ॥੧॥ ਹੁਕਮੀ ਹੋਵਨਿ ਆਕਾਰ ਹੁਕਮੁ ਨ ਕਹਿਆ ਜਾਈ ॥ ਹੁਕਮੀ ਹੋਵਨਿ ਜੀਅ ਹੁਕਮਿ ਮਿਲੈ ਵਡਿਆਈ ॥ ਹੁਕਮੀ ਉਤਮੁ ਨੀਚੁ ਹੁਕਮਿ ਲਿਖਿ ਦੁਖ ਸੁਖ ਪਾਈਅਹਿ ॥ ਇਕਨਾ ਹੁਕਮੀ ਬਖਸੀਸ ਇਕਿ ਹੁਕਮੀ ਸਦਾ ਭਵਾਈਅਹਿ ॥ ਹੁਕਮੈ ਅੰਦਰਿ ਸਭੁ ਕੋ ਬਾਹਰਿ ਹੁਕਮ ਨ ਕੋਇ ॥ ਨਾਨਕ ਹੁਕਮੈ ਜੇ ਬੁਝੈ ਤ ਹਉਮੈ ਕਹੈ ਨ ਕੋਇ ॥੨॥ ਗਾਵੈ ਕੋ ਤਾਣੁ ਹੋਵੈ ਕਿਸੈ ਤਾਣੁ ॥ ਗਾਵੈ ਕੋ ਦਾਤਿ ਜਾਣੈ ਨੀਸਾਣੁ ॥ ਗਾਵੈ ਕੋ ਗੁਣ ਵਡਿਆਈਆ ਚਾਰ ॥ ਗਾਵੈ ਕੋ ਵਿਦਿਆ ਵਿਖਮੁ ਵੀਚਾਰੁ ॥ ਗਾਵੈ ਕੋ ਸਾਜਿ ਕਰੇ ਤਨੁ ਖੇਹ ॥ ਗਾਵੈ ਕੋ ਜੀਅ ਲੈ ਫਿਰਿ ਦੇਹ ॥ ਗਾਵੈ ਕੋ ਜਾਪੈ ਦਿਸੈ ਦੂਰਿ ॥ ਗਾਵੈ ਕੋ ਵੇਖੈ ਹਾਦਰਾ ਹਦੂਰਿ ॥ ਕਥਨਾ ਕਥੀ ਨ ਆਵੈ ਤੋਟਿ ॥ ਕਥਿ ਕਥਿ ਕਥੀ ਕੋਟੀ ਕੋਟਿ ਕੋਟਿ ॥ ਦੇਦਾ ਦੇ ਲੈਦੇ ਥਕਿ ਪਾਹਿ ॥ ਜੁਗਾ ਜੁਗੰਤਰਿ ਖਾਹੀ ਖਾਹਿ ॥ ਹੁਕਮੀ ਹੁਕਮੁ ਚਲਾਏ ਰਾਹੁ ॥ ਨਾਨਕ ਵਿਗਸੈ ਵੇਪਰਵਾਹੁ ॥੩॥ ਸਾਚਾ ਸਾਹਿਬੁ ਸਾਚੁ ਨਾਇ ਭਾਖਿਆ ਭਾਉ ਅਪਾਰੁ ॥ ਆਖਹਿ ਮੰਗਹਿ ਦੇਹਿ ਦੇਹਿ ਦਾਤਿ ਕਰੇ ਦਾਤਾਰੁ ॥ ਫੇਰਿ ਕਿ ਅਗੈ ਰਖੀਐ ਜਿਤੁ ਦਿਸੈ ਦਰਬਾਰੁ ॥ ਮੁਹੌ ਕਿ ਬੋਲਣੁ ਬੋਲੀਐ ਜਿਤੁ ਸੁਣਿ ਧਰੇ ਪਿਆਰੁ ॥ ਅੰਮ੍ਰਿਤ ਵੇਲਾ ਸਚੁ ਨਾਉ ਵਡਿਆਈ ਵੀਚਾਰੁ ॥ ਕਰਮੀ ਆਵੈ ਕਪੜਾ ਨਦਰੀ ਮੋਖੁ ਦੁਆਰੁ ॥ ਨਾਨਕ ਏਵੈ ਜਾਣੀਐ ਸਭੁ ਆਪੇ ਸਚਿਆਰੁ ॥੪॥ ਥਾਪਿਆ ਨ ਜਾਇ ਕੀਤਾ ਨ ਹੋਇ ॥ ਆਪੇ ਆਪਿ ਨਿਰੰਜਨੁ ਸੋਇ ॥ ਜਿਨਿ ਸੇਵਿਆ ਤਿਨਿ ਪਾਇਆ ਮਾਨੁ ॥ ਨਾਨਕ ਗਾਵੀਐ ਗੁਣੀ ਨਿਧਾਨੁ ॥ ਗਾਵੀਐ ਸੁਣੀਐ ਮਨਿ ਰਖੀਐ ਭਾਉ ॥ ਦੁਖੁ ਪਰਹਰਿ ਸੁਖੁ ਘਰਿ ਲੈ ਜਾਇ ॥ ਗੁਰਮੁਖਿ ਨਾਦੰ ਗੁਰਮੁਖਿ ਵੇਦੰ ਗੁਰਮੁਖਿ ਰਹਿਆ ਸਮਾਈ ॥ ਗੁਰੁ ਈਸਰੁ ਗੁਰੁ ਗੋਰਖੁ ਬਰਮਾ ਗੁਰੁ ਪਾਰਬਤੀ ਮਾਈ ॥ ਜੇ ਹਉ ਜਾਣਾ ਆਖਾ ਨਾਹੀ ਕਹਣਾ ਕਥਨੁ ਨ ਜਾਈ ॥ ਗੁਰਾ ਇਕ ਦੇਹਿ ਬੁਝਾਈ ॥ ਸਭਨਾ ਜੀਆ ਕਾ ਇਕੁ ਦਾਤਾ ਸੋ ਮੈ ਵਿਸਰਿ ਨ ਜਾਈ ॥੫॥ ਤੀਰਥਿ ਨਾਵਾ ਜੇ ਤਿਸੁ ਭਾਵਾ ਵਿਣੁ ਭਾਣੇ ਕਿ ਨਾਇ ਕਰੀ ॥ ਜੇਤੀ ਸਿਰਠਿ ਉਪਾਈ ਵੇਖਾ ਵਿਣੁ ਕਰਮਾ ਕਿ ਮਿਲੈ ਲਈ ॥ ਮਤਿ ਵਿਚਿ ਰਤਨ ਜਵਾਹਰ ਮਾਣਿਕ ਜੇ ਇਕ ਗੁਰ ਕੀ ਸਿਖ ਸੁਣੀ ॥ ਗੁਰਾ ਇਕ ਦੇਹਿ ਬੁਝਾਈ ॥ ਸਭਨਾ ਜੀਆ ਕਾ ਇਕੁ ਦਾਤਾ ਸੋ ਮੈ ਵਿਸਰਿ ਨ ਜਾਈ ॥੬॥ ਜੇ ਜੁਗ ਚਾਰੇ ਆਰਜਾ ਹੋਰ ਦਸੂਣੀ ਹੋਇ ॥ ਨਵਾ ਖੰਡਾ ਵਿਚਿ ਜਾਣੀਐ ਨਾਲਿ ਚਲੈ ਸਭੁ ਕੋਇ ॥ ਚੰਗਾ ਨਾਉ ਰਖਾਇ ਕੈ ਜਸੁ ਕੀਰਤਿ ਜਗਿ ਲੇਇ ॥ ਜੇ ਤਿਸੁ ਨਦਰਿ ਨ ਆਵਈ ਤ ਵਾਤ ਨ ਪੁਛੈ ਕੇ ॥ ਕੀਟਾ ਅੰਦਰਿ ਕੀਟੁ ਕਰਿ ਦੋਸੀ ਦੋਸੁ ਧਰੇ ॥ ਨਾਨਕ ਨਿਰਗੁਣਿ ਗੁਣੁ ਕਰੇ ਗੁਣਵੰਤਿਆ ਗੁਣੁ ਦੇ ॥ ਤੇਹਾ ਕੋਇ ਨ ਸੁਝਈ ਜਿ ਤਿਸੁ ਗੁਣੁ ਕੋਇ ਕਰੇ ॥੭॥ ਸੁਣਿਐ ਸਿਧ ਪੀਰ ਸੁਰਿ ਨਾਥ ॥ ਸੁਣਿਐ ਧਰਤਿ ਧਵਲ ਆਕਾਸ ॥ ਸੁਣਿਐ ਦੀਪ ਲੋਅ ਪਾਤਾਲ ॥ ਸੁਣਿਐ ਪੋਹਿ ਨ ਸਕੈ ਕਾਲੁ ॥ ਨਾਨਕ ਭਗਤਾ ਸਦਾ ਵਿਗਾਸੁ ॥ ਸੁਣਿਐ ਦੂਖ ਪਾਪ ਕਾ ਨਾਸੁ ॥੮॥ ਸੁਣਿਐ ਈਸਰੁ ਬਰਮਾ ਇੰਦੁ ॥ ਸੁਣਿਐ ਮੁਖਿ ਸਾਲਾਹਣ ਮੰਦੁ ॥ ਸੁਣਿਐ ਜੋਗ ਜੁਗਤਿ ਤਨਿ ਭੇਦ ॥ ਸੁਣਿਐ ਸਾਸਤ ਸਿਮ੍ਰਿਤਿ ਵੇਦ ॥ ਨਾਨਕ ਭਗਤਾ ਸਦਾ ਵਿਗਾਸੁ ॥ ਸੁਣਿਐ ਦੂਖ ਪਾਪ ਕਾ ਨਾਸੁ ॥੯॥ ਸੁਣਿਐ ਸਤੁ ਸੰਤੋਖੁ ਗਿਆਨੁ ॥ ਸੁਣਿਐ ਅਠਸਠਿ ਕਾ ਇਸਨਾਨੁ ॥ ਸੁਣਿਐ ਪੜਿ ਪੜਿ ਪਾਵਹਿ ਮਾਨੁ ॥ ਸੁਣਿਐ ਲਾਗੈ ਸਹਜਿ ਧਿਆਨੁ ॥ ਨਾਨਕ ਭਗਤਾ ਸਦਾ ਵਿਗਾਸੁ ॥ ਸੁਣਿਐ ਦੂਖ ਪਾਪ ਕਾ ਨਾਸੁ ॥੧੦॥ ਸੁਣਿਐ ਸਰਾ ਗੁਣਾ ਕੇ ਗਾਹ ॥ ਸੁਣਿਐ ਸੇਖ ਪੀਰ ਪਾਤਿਸਾਹ ॥ ਸੁਣਿਐ ਅੰਧੇ ਪਾਵਹਿ ਰਾਹੁ ॥ ਸੁਣਿਐ ਹਾਥ ਹੋਵੈ ਅਸਗਾਹੁ ॥ ਨਾਨਕ ਭਗਤਾ ਸਦਾ ਵਿਗਾਸੁ ॥ ਸੁਣਿਐ ਦੂਖ ਪਾਪ ਕਾ ਨਾਸੁ ॥੧੧॥"
//            ਮੰਨੇ ਕੀ ਗਤਿ ਕਹੀ ਨ ਜਾਇ ॥ ਜੇ ਕੋ ਕਹੈ ਪਿਛੈ ਪਛੁਤਾਇ ॥ ਕਾਗਦਿ ਕਲਮ ਨ ਲਿਖਣਹਾਰੁ ॥ ਮੰਨੇ ਕਾ ਬਹਿ ਕਰਨਿ ਵੀਚਾਰੁ ॥ ਐਸਾ ਨਾਮੁ ਨਿਰੰਜਨੁ ਹੋਇ ॥ ਜੇ ਕੋ ਮੰਨਿ ਜਾਣੈ ਮਨਿ ਕੋਇ ॥੧੨॥
//            ਮੰਨੈ ਸੁਰਤਿ ਹੋਵੈ ਮਨਿ ਬੁਧਿ ॥ ਮੰਨੈ ਸਗਲ ਭਵਣ ਕੀ ਸੁਧਿ ॥ ਮੰਨੈ ਮੁਹਿ ਚੋਟਾ ਨਾ ਖਾਇ ॥ ਮੰਨੈ ਜਮ ਕੈ ਸਾਥਿ ਨ ਜਾਇ ॥ ਐਸਾ ਨਾਮੁ ਨਿਰੰਜਨੁ ਹੋਇ ॥ ਜੇ ਕੋ ਮੰਨਿ ਜਾਣੈ ਮਨਿ ਕੋਇ ॥੧੩॥
//            ਮੰਨੈ ਮਾਰਗਿ ਠਾਕ ਨ ਪਾਇ ॥ ਮੰਨੈ ਪਤਿ ਸਿਉ ਪਰਗਟੁ ਜਾਇ ॥ ਮੰਨੈ ਮਗੁ ਨ ਚਲੈ ਪੰਥੁ ॥ ਮੰਨੈ ਧਰਮ ਸੇਤੀ ਸਨਬੰਧੁ ॥ ਐਸਾ ਨਾਮੁ ਨਿਰੰਜਨੁ ਹੋਇ ॥ ਜੇ ਕੋ ਮੰਨਿ ਜਾਣੈ ਮਨਿ ਕੋਇ ॥੧੪॥
//            ਮੰਨੈ ਪਾਵਹਿ ਮੋਖੁ ਦੁਆਰੁ ॥ ਮੰਨੈ ਪਰਵਾਰੈ ਸਾਧਾਰੁ ॥ ਮੰਨੈ ਤਰੈ ਤਾਰੇ ਗੁਰੁ ਸਿਖ ॥ ਮੰਨੈ ਨਾਨਕ ਭਵਹਿ ਨ ਭਿਖ ॥ ਐਸਾ ਨਾਮੁ ਨਿਰੰਜਨੁ ਹੋਇ ॥ ਜੇ ਕੋ ਮੰਨਿ ਜਾਣੈ ਮਨਿ ਕੋਇ ॥੧੫॥
//            ਪੰਚ ਪਰਵਾਣ ਪੰਚ ਪਰਧਾਨੁ ॥ ਪੰਚੇ ਪਾਵਹਿ ਦਰਗਹਿ ਮਾਨੁ ॥ ਪੰਚੇ ਸੋਹਹਿ ਦਰਿ ਰਾਜਾਨੁ ॥ ਪੰਚਾ ਕਾ ਗੁਰੁ ਏਕੁ ਧਿਆਨੁ ॥ ਜੇ ਕੋ ਕਹੈ ਕਰੈ ਵੀਚਾਰੁ ॥ ਕਰਤੇ ਕੈ ਕਰਣੈ ਨਾਹੀ ਸੁਮਾਰੁ ॥ ਧੌਲੁ ਧਰਮੁ ਦਇਆ ਕਾ ਪੂਤੁ ॥ ਸੰਤੋਖੁ ਥਾਪਿ ਰਖਿਆ ਜਿਨਿ ਸੂਤਿ ॥ ਜੇ ਕੋ ਬੁਝੈ ਹੋਵੈ ਸਚਿਆਰੁ ॥ ਧਵਲੈ ਉਪਰਿ ਕੇਤਾ ਭਾਰੁ ॥ ਧਰਤੀ ਹੋਰੁ ਪਰੈ ਹੋਰੁ ਹੋਰੁ ॥ ਤਿਸ ਤੇ ਭਾਰੁ ਤਲੈ ਕਵਣੁ ਜੋਰੁ ॥ ਜੀਅ ਜਾਤਿ ਰੰਗਾ ਕੇ ਨਾਵ ॥ ਸਭਨਾ ਲਿਖਿਆ ਵੁੜੀ ਕਲਾਮ ॥ ਏਹੁ ਲੇਖਾ ਲਿਖਿ ਜਾਣੈ ਕੋਇ ॥ ਲੇਖਾ ਲਿਖਿਆ ਕੇਤਾ ਹੋਇ ॥ ਕੇਤਾ ਤਾਣੁ ਸੁਆਲਿਹੁ ਰੂਪੁ ॥ ਕੇਤੀ ਦਾਤਿ ਜਾਣੈ ਕੌਣੁ ਕੂਤੁ ॥ ਕੀਤਾ ਪਸਾਉ ਏਕੋ ਕਵਾਉ ॥ ਤਿਸ ਤੇ ਹੋਏ ਲਖ ਦਰੀਆਉ ॥ ਕੁਦਰਤਿ ਕਵਣ ਕਹਾ ਵੀਚਾਰੁ ॥ ਵਾਰਿਆ ਨ ਜਾਵਾ ਏਕ ਵਾਰ ॥ ਜੋ ਤੁਧੁ ਭਾਵੈ ਸਾਈ ਭਲੀ ਕਾਰ ॥ ਤੂ ਸਦਾ ਸਲਾਮਤਿ ਨਿਰੰਕਾਰ ॥੧੬॥
//            ਅਸੰਖ ਜਪ ਅਸੰਖ ਭਾਉ ॥ ਅਸੰਖ ਪੂਜਾ ਅਸੰਖ ਤਪ ਤਾਉ ॥ ਅਸੰਖ ਗਰੰਥ ਮੁਖਿ ਵੇਦ ਪਾਠ ॥ ਅਸੰਖ ਜੋਗ ਮਨਿ ਰਹਹਿ ਉਦਾਸ ॥ ਅਸੰਖ ਭਗਤ ਗੁਣ ਗਿਆਨ ਵੀਚਾਰ ॥ ਅਸੰਖ ਸਤੀ ਅਸੰਖ ਦਾਤਾਰ ॥ ਅਸੰਖ ਸੂਰ ਮੁਹ ਭਖ ਸਾਰ ॥ ਅਸੰਖ ਮੋਨਿ ਲਿਵ ਲਾਇ ਤਾਰ ॥ ਕੁਦਰਤਿ ਕਵਣ ਕਹਾ ਵੀਚਾਰੁ ॥ ਵਾਰਿਆ ਨ ਜਾਵਾ ਏਕ ਵਾਰ ॥ ਜੋ ਤੁਧੁ ਭਾਵੈ ਸਾਈ ਭਲੀ ਕਾਰ ॥ ਤੂ ਸਦਾ ਸਲਾਮਤਿ ਨਿਰੰਕਾਰ ॥੧੭॥
//            ਅਸੰਖ ਮੂਰਖ ਅੰਧ ਘੋਰ ॥ ਅਸੰਖ ਚੋਰ ਹਰਾਮਖੋਰ ॥ ਅਸੰਖ ਅਮਰ ਕਰਿ ਜਾਹਿ ਜੋਰ ॥ ਅਸੰਖ ਗਲਵਢ ਹਤਿਆ ਕਮਾਹਿ ॥ ਅਸੰਖ ਪਾਪੀ ਪਾਪੁ ਕਰਿ ਜਾਹਿ ॥ ਅਸੰਖ ਕੂੜਿਆਰ ਕੂੜੇ ਫਿਰਾਹਿ ॥ ਅਸੰਖ ਮਲੇਛ ਮਲੁ ਭਖਿ ਖਾਹਿ ॥ ਅਸੰਖ ਨਿੰਦਕ ਸਿਰਿ ਕਰਹਿ ਭਾਰੁ ॥ ਨਾਨਕੁ ਨੀਚੁ ਕਹੈ ਵੀਚਾਰੁ ॥ ਵਾਰਿਆ ਨ ਜਾਵਾ ਏਕ ਵਾਰ ॥ ਜੋ ਤੁਧੁ ਭਾਵੈ ਸਾਈ ਭਲੀ ਕਾਰ ॥ ਤੂ ਸਦਾ ਸਲਾਮਤਿ ਨਿਰੰਕਾਰ ॥੧੮॥
//            ਅਸੰਖ ਨਾਵ ਅਸੰਖ ਥਾਵ ॥ ਅਗੰਮ ਅਗੰਮ ਅਸੰਖ ਲੋਅ ॥ ਅਸੰਖ ਕਹਹਿ ਸਿਰਿ ਭਾਰੁ ਹੋਇ ॥ ਅਖਰੀ ਨਾਮੁ ਅਖਰੀ ਸਾਲਾਹ ॥ ਅਖਰੀ ਗਿਆਨੁ ਗੀਤ ਗੁਣ ਗਾਹ ॥ ਅਖਰੀ ਲਿਖਣੁ ਬੋਲਣੁ ਬਾਣਿ ॥ ਅਖਰਾ ਸਿਰਿ ਸੰਜੋਗੁ ਵਖਾਣਿ ॥ ਜਿਨਿ ਏਹਿ ਲਿਖੇ ਤਿਸੁ ਸਿਰਿ ਨਾਹਿ ॥ ਜਿਵ ਫੁਰਮਾਏ ਤਿਵ ਤਿਵ ਪਾਹਿ ॥ ਜੇਤਾ ਕੀਤਾ ਤੇਤਾ ਨਾਉ ॥ ਵਿਣੁ ਨਾਵੈ ਨਾਹੀ ਕੋ ਥਾਉ ॥ ਕੁਦਰਤਿ ਕਵਣ ਕਹਾ ਵੀਚਾਰੁ ॥ ਵਾਰਿਆ ਨ ਜਾਵਾ ਏਕ ਵਾਰ ॥ ਜੋ ਤੁਧੁ ਭਾਵੈ ਸਾਈ ਭਲੀ ਕਾਰ ॥ ਤੂ ਸਦਾ ਸਲਾਮਤਿ ਨਿਰੰਕਾਰ ॥੧੯॥
//            ਭਰੀਐ ਹਥੁ ਪੈਰੁ ਤਨੁ ਦੇਹ ॥ ਪਾਣੀ ਧੋਤੈ ਉਤਰਸੁ ਖੇਹ ॥ ਮੂਤ ਪਲੀਤੀ ਕਪੜੁ ਹੋਇ ॥ ਦੇ ਸਾਬੂਣੁ ਲਈਐ ਓਹੁ ਧੋਇ ॥ ਭਰੀਐ ਮਤਿ ਪਾਪਾ ਕੈ ਸੰਗਿ ॥ ਓਹੁ ਧੋਪੈ ਨਾਵੈ ਕੈ ਰੰਗਿ ॥ ਪੁੰਨੀ ਪਾਪੀ ਆਖਣੁ ਨਾਹਿ ॥ ਕਰਿ ਕਰਿ ਕਰਣਾ ਲਿਖਿ ਲੈ ਜਾਹੁ ॥ ਆਪੇ ਬੀਜਿ ਆਪੇ ਹੀ ਖਾਹੁ ॥ ਨਾਨਕ ਹੁਕਮੀ ਆਵਹੁ ਜਾਹੁ ॥੨੦॥
//            ਤੀਰਥੁ ਤਪੁ ਦਇਆ ਦਤੁ ਦਾਨੁ ॥ ਜੇ ਕੋ ਪਾਵੈ ਤਿਲ ਕਾ ਮਾਨੁ ॥ ਸੁਣਿਆ ਮੰਨਿਆ ਮਨਿ ਕੀਤਾ ਭਾਉ ॥ ਅੰਤਰਗਤਿ ਤੀਰਥਿ ਮਲਿ ਨਾਉ ॥ ਸਭਿ ਗੁਣ ਤੇਰੇ ਮੈ ਨਾਹੀ ਕੋਇ ॥ ਵਿਣੁ ਗੁਣ ਕੀਤੇ ਭਗਤਿ ਨ ਹੋਇ ॥ ਸੁਅਸਤਿ ਆਥਿ ਬਾਣੀ ਬਰਮਾਉ ॥ ਸਤਿ ਸੁਹਾਣੁ ਸਦਾ ਮਨਿ ਚਾਉ ॥ ਕਵਣੁ ਸੁ ਵੇਲਾ ਵਖਤੁ ਕਵਣੁ ਕਵਣ ਥਿਤਿ ਕਵਣੁ ਵਾਰੁ ॥ ਕਵਣਿ ਸਿ ਰੁਤੀ ਮਾਹੁ ਕਵਣੁ ਜਿਤੁ ਹੋਆ ਆਕਾਰੁ ॥ ਵੇਲ ਨ ਪਾਈਆ ਪੰਡਤੀ ਜਿ ਹੋਵੈ ਲੇਖੁ ਪੁਰਾਣੁ ॥ ਵਖਤੁ ਨ ਪਾਇਓ ਕਾਦੀਆ ਜਿ ਲਿਖਨਿ ਲੇਖੁ ਕੁਰਾਣੁ ॥ ਥਿਤਿ ਵਾਰੁ ਨਾ ਜੋਗੀ ਜਾਣੈ ਰੁਤਿ ਮਾਹੁ ਨਾ ਕੋਈ ॥ ਜਾ ਕਰਤਾ ਸਿਰਠੀ ਕਉ ਸਾਜੇ ਆਪੇ ਜਾਣੈ ਸੋਈ ॥ ਕਿਵ ਕਰਿ ਆਖਾ ਕਿਵ ਸਾਲਾਹੀ ਕਿਉ ਵਰਨੀ ਕਿਵ ਜਾਣਾ ॥ ਨਾਨਕ ਆਖਣਿ ਸਭੁ ਕੋ ਆਖੈ ਇਕ ਦੂ ਇਕੁ ਸਿਆਣਾ ॥ ਵਡਾ ਸਾਹਿਬੁ ਵਡੀ ਨਾਈ ਕੀਤਾ ਜਾ ਕਾ ਹੋਵੈ ॥ ਨਾਨਕ ਜੇ ਕੋ ਆਪੌ ਜਾਣੈ ਅਗੈ ਗਇਆ ਨ ਸੋਹੈ ॥੨੧॥
//            ਪਾਤਾਲਾ ਪਾਤਾਲ ਲਖ ਆਗਾਸਾ ਆਗਾਸ ॥ ਓੜਕ ਓੜਕ ਭਾਲਿ ਥਕੇ ਵੇਦ ਕਹਨਿ ਇਕ ਵਾਤ ॥ ਸਹਸ ਅਠਾਰਹ ਕਹਨਿ ਕਤੇਬਾ ਅਸੁਲੂ ਇਕੁ ਧਾਤੁ ॥ ਲੇਖਾ ਹੋਇ ਤ ਲਿਖੀਐ ਲੇਖੈ ਹੋਇ ਵਿਣਾਸੁ ॥ ਨਾਨਕ ਵਡਾ ਆਖੀਐ ਆਪੇ ਜਾਣੈ ਆਪੁ ॥੨੨॥
//            ਸਾਲਾਹੀ ਸਾਲਾਹਿ ਏਤੀ ਸੁਰਤਿ ਨ ਪਾਈਆ ॥ ਨਦੀਆ ਅਤੈ ਵਾਹ ਪਵਹਿ ਸਮੁੰਦਿ ਨ ਜਾਣੀਅਹਿ ॥ ਸਮੁੰਦ ਸਾਹ ਸੁਲਤਾਨ ਗਿਰਹਾ ਸੇਤੀ ਮਾਲੁ ਧਨੁ ॥ ਕੀੜੀ ਤੁਲਿ ਨ ਹੋਵਨੀ ਜੇ ਤਿਸੁ ਮਨਹੁ ਨ ਵੀਸਰਹਿ ॥੨੩॥
//            ਅੰਤੁ ਨ ਸਿਫਤੀ ਕਹਣਿ ਨ ਅੰਤੁ ॥ ਅੰਤੁ ਨ ਕਰਣੈ ਦੇਣਿ ਨ ਅੰਤੁ ॥ ਅੰਤੁ ਨ ਵੇਖਣਿ ਸੁਣਣਿ ਨ ਅੰਤੁ ॥ ਅੰਤੁ ਨ ਜਾਪੈ ਕਿਆ ਮਨਿ ਮੰਤੁ ॥ ਅੰਤੁ ਨ ਜਾਪੈ ਕੀਤਾ ਆਕਾਰੁ ॥ ਅੰਤੁ ਨ ਜਾਪੈ ਪਾਰਾਵਾਰੁ ॥ ਅੰਤ ਕਾਰਣਿ ਕੇਤੇ ਬਿਲਲਾਹਿ ॥ ਤਾ ਕੇ ਅੰਤ ਨ ਪਾਏ ਜਾਹਿ ॥ ਏਹੁ ਅੰਤੁ ਨ ਜਾਣੈ ਕੋਇ ॥ ਬਹੁਤਾ ਕਹੀਐ ਬਹੁਤਾ ਹੋਇ ॥ ਵਡਾ ਸਾਹਿਬੁ ਊਚਾ ਥਾਉ ॥ ਊਚੇ ਉਪਰਿ ਊਚਾ ਨਾਉ ॥ ਏਵਡੁ ਊਚਾ ਹੋਵੈ ਕੋਇ ॥ ਤਿਸੁ ਊਚੇ ਕਉ ਜਾਣੈ ਸੋਇ ॥ ਜੇਵਡੁ ਆਪਿ ਜਾਣੈ ਆਪਿ ਆਪਿ ॥ ਨਾਨਕ ਨਦਰੀ ਕਰਮੀ ਦਾਤਿ ॥੨੪॥
//            ਬਹੁਤਾ ਕਰਮੁ ਲਿਖਿਆ ਨਾ ਜਾਇ ॥ ਵਡਾ ਦਾਤਾ ਤਿਲੁ ਨ ਤਮਾਇ ॥ ਕੇਤੇ ਮੰਗਹਿ ਜੋਧ ਅਪਾਰ ॥ ਕੇਤਿਆ ਗਣਤ ਨਹੀ ਵੀਚਾਰੁ ॥ ਕੇਤੇ ਖਪਿ ਤੁਟਹਿ ਵੇਕਾਰ ॥ ਕੇਤੇ ਲੈ ਲੈ ਮੁਕਰੁ ਪਾਹਿ ॥ ਕੇਤੇ ਮੂਰਖ ਖਾਹੀ ਖਾਹਿ ॥ ਕੇਤਿਆ ਦੂਖ ਭੂਖ ਸਦ ਮਾਰ ॥ ਏਹਿ ਭਿ ਦਾਤਿ ਤੇਰੀ ਦਾਤਾਰ ॥ ਬੰਦਿ ਖਲਾਸੀ ਭਾਣੈ ਹੋਇ ॥ ਹੋਰੁ ਆਖਿ ਨ ਸਕੈ ਕੋਇ ॥ ਜੇ ਕੋ ਖਾਇਕੁ ਆਖਣਿ ਪਾਇ ॥ ਓਹੁ ਜਾਣੈ ਜੇਤੀਆ ਮੁਹਿ ਖਾਇ ॥ ਆਪੇ ਜਾਣੈ ਆਪੇ ਦੇਇ ॥ ਆਖਹਿ ਸਿ ਭਿ ਕੇਈ ਕੇਇ ॥ ਜਿਸ ਨੋ ਬਖਸੇ ਸਿਫਤਿ ਸਾਲਾਹ ॥ ਨਾਨਕ ਪਾਤਿਸਾਹੀ ਪਾਤਿਸਾਹੁ ॥੨੫॥
//            ਅਮੁਲ ਗੁਣ ਅਮੁਲ ਵਾਪਾਰ ॥ ਅਮੁਲ ਵਾਪਾਰੀਏ ਅਮੁਲ ਭੰਡਾਰ ॥ ਅਮੁਲ ਆਵਹਿ ਅਮੁਲ ਲੈ ਜਾਹਿ ॥ ਅਮੁਲ ਭਾਇ ਅਮੁਲਾ ਸਮਾਹਿ ॥ ਅਮੁਲੁ ਧਰਮੁ ਅਮੁਲੁ ਦੀਬਾਣੁ ॥ ਅਮੁਲੁ ਤੁਲੁ ਅਮੁਲੁ ਪਰਵਾਣੁ ॥ ਅਮੁਲੁ ਬਖਸੀਸ ਅਮੁਲੁ ਨੀਸਾਣੁ ॥ ਅਮੁਲੁ ਕਰਮੁ ਅਮੁਲੁ ਫੁਰਮਾਣੁ ॥ ਅਮੁਲੋ ਅਮੁਲੁ ਆਖਿਆ ਨ ਜਾਇ ॥ ਆਖਿ ਆਖਿ ਰਹੇ ਲਿਵ ਲਾਇ ॥ ਆਖਹਿ ਵੇਦ ਪਾਠ ਪੁਰਾਣ ॥ ਆਖਹਿ ਪੜੇ ਕਰਹਿ ਵਖਿਆਣ ॥ ਆਖਹਿ ਬਰਮੇ ਆਖਹਿ ਇੰਦ ॥ ਆਖਹਿ ਗੋਪੀ ਤੈ ਗੋਵਿੰਦ ॥ ਆਖਹਿ ਈਸਰ ਆਖਹਿ ਸਿਧ ॥ ਆਖਹਿ ਕੇਤੇ ਕੀਤੇ ਬੁਧ ॥ ਆਖਹਿ ਦਾਨਵ ਆਖਹਿ ਦੇਵ ॥ ਆਖਹਿ ਸੁਰਿ ਨਰ ਮੁਨਿ ਜਨ ਸੇਵ ॥ ਕੇਤੇ ਆਖਹਿ ਆਖਣਿ ਪਾਹਿ ॥ ਕੇਤੇ ਕਹਿ ਕਹਿ ਉਠਿ ਉਠਿ ਜਾਹਿ ॥ ਏਤੇ ਕੀਤੇ ਹੋਰਿ ਕਰੇਹਿ ॥ ਤਾ ਆਖਿ ਨ ਸਕਹਿ ਕੇਈ ਕੇਇ ॥ ਜੇਵਡੁ ਭਾਵੈ ਤੇਵਡੁ ਹੋਇ ॥ ਨਾਨਕ ਜਾਣੈ ਸਾਚਾ ਸੋਇ ॥ ਜੇ ਕੋ ਆਖੈ ਬੋਲੁਵਿਗਾੜੁ ॥ ਤਾ ਲਿਖੀਐ ਸਿਰਿ ਗਾਵਾਰਾ ਗਾਵਾਰੁ ॥੨੬॥
//            ਸੋ ਦਰੁ ਕੇਹਾ ਸੋ ਘਰੁ ਕੇਹਾ ਜਿਤੁ ਬਹਿ ਸਰਬ ਸਮਾਲੇ ॥ ਵਾਜੇ ਨਾਦ ਅਨੇਕ ਅਸੰਖਾ ਕੇਤੇ ਵਾਵਣਹਾਰੇ ॥ ਕੇਤੇ ਰਾਗ ਪਰੀ ਸਿਉ ਕਹੀਅਨਿ ਕੇਤੇ ਗਾਵਣਹਾਰੇ ॥ ਗਾਵਹਿ ਤੁਹਨੋ ਪਉਣੁ ਪਾਣੀ ਬੈਸੰਤਰੁ ਗਾਵੈ ਰਾਜਾ ਧਰਮੁ ਦੁਆਰੇ ॥ ਗਾਵਹਿ ਚਿਤੁ ਗੁਪਤੁ ਲਿਖਿ ਜਾਣਹਿ ਲਿਖਿ ਲਿਖਿ ਧਰਮੁ ਵੀਚਾਰੇ ॥ ਗਾਵਹਿ ਈਸਰੁ ਬਰਮਾ ਦੇਵੀ ਸੋਹਨਿ ਸਦਾ ਸਵਾਰੇ ॥ ਗਾਵਹਿ ਇੰਦ ਇਦਾਸਣਿ ਬੈਠੇ ਦੇਵਤਿਆ ਦਰਿ ਨਾਲੇ ॥ ਗਾਵਹਿ ਸਿਧ ਸਮਾਧੀ ਅੰਦਰਿ ਗਾਵਨਿ ਸਾਧ ਵਿਚਾਰੇ ॥ ਗਾਵਨਿ ਜਤੀ ਸਤੀ ਸੰਤੋਖੀ ਗਾਵਹਿ ਵੀਰ ਕਰਾਰੇ ॥ ਗਾਵਨਿ ਪੰਡਿਤ ਪੜਨਿ ਰਖੀਸਰ ਜੁਗੁ ਜੁਗੁ ਵੇਦਾ ਨਾਲੇ ॥ ਗਾਵਹਿ ਮੋਹਣੀਆ ਮਨੁ ਮੋਹਨਿ ਸੁਰਗਾ ਮਛ ਪਇਆਲੇ ॥ ਗਾਵਨਿ ਰਤਨ ਉਪਾਏ ਤੇਰੇ ਅਠਸਠਿ ਤੀਰਥ ਨਾਲੇ ॥ ਗਾਵਹਿ ਜੋਧ ਮਹਾਬਲ ਸੂਰਾ ਗਾਵਹਿ ਖਾਣੀ ਚਾਰੇ ॥ ਗਾਵਹਿ ਖੰਡ ਮੰਡਲ ਵਰਭੰਡਾ ਕਰਿ ਕਰਿ ਰਖੇ ਧਾਰੇ ॥ ਸੇਈ ਤੁਧੁਨੋ ਗਾਵਹਿ ਜੋ ਤੁਧੁ ਭਾਵਨਿ ਰਤੇ ਤੇਰੇ ਭਗਤ ਰਸਾਲੇ ॥ ਹੋਰਿ ਕੇਤੇ ਗਾਵਨਿ ਸੇ ਮੈ ਚਿਤਿ ਨ ਆਵਨਿ ਨਾਨਕੁ ਕਿਆ ਵੀਚਾਰੇ ॥ ਸੋਈ ਸੋਈ ਸਦਾ ਸਚੁ ਸਾਹਿਬੁ ਸਾਚਾ ਸਾਚੀ ਨਾਈ ॥ ਹੈ ਭੀ ਹੋਸੀ ਜਾਇ ਨ ਜਾਸੀ ਰਚਨਾ ਜਿਨਿ ਰਚਾਈ ॥ ਰੰਗੀ ਰੰਗੀ ਭਾਤੀ ਕਰਿ ਕਰਿ ਜਿਨਸੀ ਮਾਇਆ ਜਿਨਿ ਉਪਾਈ ॥ ਕਰਿ ਕਰਿ ਵੇਖੈ ਕੀਤਾ ਆਪਣਾ ਜਿਵ ਤਿਸ ਦੀ ਵਡਿਆਈ ॥ ਜੋ ਤਿਸੁ ਭਾਵੈ ਸੋਈ ਕਰਸੀ ਹੁਕਮੁ ਨ ਕਰਣਾ ਜਾਈ ॥ ਸੋ ਪਾਤਿਸਾਹੁ ਸਾਹਾ ਪਾਤਿਸਾਹਿਬੁ ਨਾਨਕ ਰਹਣੁ ਰਜਾਈ ॥੨੭॥
//            ਮੁੰਦਾ ਸੰਤੋਖੁ ਸਰਮੁ ਪਤੁ ਝੋਲੀ ਧਿਆਨ ਕੀ ਕਰਹਿ ਬਿਭੂਤਿ ॥ ਖਿੰਥਾ ਕਾਲੁ ਕੁਆਰੀ ਕਾਇਆ ਜੁਗਤਿ ਡੰਡਾ ਪਰਤੀਤਿ ॥ ਆਈ ਪੰਥੀ ਸਗਲ ਜਮਾਤੀ ਮਨਿ ਜੀਤੈ ਜਗੁ ਜੀਤੁ ॥ ਆਦੇਸੁ ਤਿਸੈ ਆਦੇਸੁ ॥ ਆਦਿ ਅਨੀਲੁ ਅਨਾਦਿ ਅਨਾਹਤਿ ਜੁਗੁ ਜੁਗੁ ਏਕੋ ਵੇਸੁ ॥੨੮॥
//            ਭੁਗਤਿ ਗਿਆਨੁ ਦਇਆ ਭੰਡਾਰਣਿ ਘਟਿ ਘਟਿ ਵਾਜਹਿ ਨਾਦ ॥ ਆਪਿ ਨਾਥੁ ਨਾਥੀ ਸਭ ਜਾ ਕੀ ਰਿਧਿ ਸਿਧਿ ਅਵਰਾ ਸਾਦ ॥ ਸੰਜੋਗੁ ਵਿਜੋਗੁ ਦੁਇ ਕਾਰ ਚਲਾਵਹਿ ਲੇਖੇ ਆਵਹਿ ਭਾਗ ॥ ਆਦੇਸੁ ਤਿਸੈ ਆਦੇਸੁ ॥ ਆਦਿ ਅਨੀਲੁ ਅਨਾਦਿ ਅਨਾਹਤਿ ਜੁਗੁ ਜੁਗੁ ਏਕੋ ਵੇਸੁ ॥੨੯॥
//            ਏਕਾ ਮਾਈ ਜੁਗਤਿ ਵਿਆਈ ਤਿਨਿ ਚੇਲੇ ਪਰਵਾਣੁ ॥ ਇਕੁ ਸੰਸਾਰੀ ਇਕੁ ਭੰਡਾਰੀ ਇਕੁ ਲਾਏ ਦੀਬਾਣੁ ॥ ਜਿਵ ਤਿਸੁ ਭਾਵੈ ਤਿਵੈ ਚਲਾਵੈ ਜਿਵ ਹੋਵੈ ਫੁਰਮਾਣੁ ॥ ਓਹੁ ਵੇਖੈ ਓਨਾ ਨਦਰਿ ਨ ਆਵੈ ਬਹੁਤਾ ਏਹੁ ਵਿਡਾਣੁ ॥ ਆਦੇਸੁ ਤਿਸੈ ਆਦੇਸੁ ॥ ਆਦਿ ਅਨੀਲੁ ਅਨਾਦਿ ਅਨਾਹਤਿ ਜੁਗੁ ਜੁਗੁ ਏਕੋ ਵੇਸੁ ॥੩੦॥
//            ਆਸਣੁ ਲੋਇ ਲੋਇ ਭੰਡਾਰ ॥ ਜੋ ਕਿਛੁ ਪਾਇਆ ਸੁ ਏਕਾ ਵਾਰ ॥ ਕਰਿ ਕਰਿ ਵੇਖੈ ਸਿਰਜਣਹਾਰੁ ॥ ਨਾਨਕ ਸਚੇ ਕੀ ਸਾਚੀ ਕਾਰ ॥ ਆਦੇਸੁ ਤਿਸੈ ਆਦੇਸੁ ॥ ਆਦਿ ਅਨੀਲੁ ਅਨਾਦਿ ਅਨਾਹਤਿ ਜੁਗੁ ਜੁਗੁ ਏਕੋ ਵੇਸੁ ॥੩੧॥
//            ਇਕ ਦੂ ਜੀਭੌ ਲਖ ਹੋਹਿ ਲਖ ਹੋਵਹਿ ਲਖ ਵੀਸ ॥ ਲਖੁ ਲਖੁ ਗੇੜਾ ਆਖੀਅਹਿ ਏਕੁ ਨਾਮੁ ਜਗਦੀਸ ॥ ਏਤੁ ਰਾਹਿ ਪਤਿ ਪਵੜੀਆ ਚੜੀਐ ਹੋਇ ਇਕੀਸ ॥ ਸੁਣਿ ਗਲਾ ਆਕਾਸ ਕੀ ਕੀਟਾ ਆਈ ਰੀਸ ॥ ਨਾਨਕ ਨਦਰੀ ਪਾਈਐ ਕੂੜੀ ਕੂੜੈ ਠੀਸ ॥੩੨॥
//            ਆਖਣਿ ਜੋਰੁ ਚੁਪੈ ਨਹ ਜੋਰੁ ॥ ਜੋਰੁ ਨ ਮੰਗਣਿ ਦੇਣਿ ਨ ਜੋਰੁ ॥ ਜੋਰੁ ਨ ਜੀਵਣਿ ਮਰਣਿ ਨਹ ਜੋਰੁ ॥ ਜੋਰੁ ਨ ਰਾਜਿ ਮਾਲਿ ਮਨਿ ਸੋਰੁ ॥ ਜੋਰੁ ਨ ਸੁਰਤੀ ਗਿਆਨਿ ਵੀਚਾਰਿ ॥ ਜੋਰੁ ਨ ਜੁਗਤੀ ਛੁਟੈ ਸੰਸਾਰੁ ॥ ਜਿਸੁ ਹਥਿ ਜੋਰੁ ਕਰਿ ਵੇਖੈ ਸੋਇ ॥ ਨਾਨਕ ਉਤਮੁ ਨੀਚੁ ਨ ਕੋਇ ॥੩੩॥
//            ਰਾਤੀ ਰੁਤੀ ਥਿਤੀ ਵਾਰ ॥ ਪਵਣ ਪਾਣੀ ਅਗਨੀ ਪਾਤਾਲ ॥ ਤਿਸੁ ਵਿਚਿ ਧਰਤੀ ਥਾਪਿ ਰਖੀ ਧਰਮ ਸਾਲ ॥ ਤਿਸੁ ਵਿਚਿ ਜੀਅ ਜੁਗਤਿ ਕੇ ਰੰਗ ॥ ਤਿਨ ਕੇ ਨਾਮ ਅਨੇਕ ਅਨੰਤ ॥ ਕਰਮੀ ਕਰਮੀ ਹੋਇ ਵੀਚਾਰੁ ॥ ਸਚਾ ਆਪਿ ਸਚਾ ਦਰਬਾਰੁ ॥ ਤਿਥੈ ਸੋਹਨਿ ਪੰਚ ਪਰਵਾਣੁ ॥ ਨਦਰੀ ਕਰਮਿ ਪਵੈ ਨੀਸਾਣੁ ॥ ਕਚ ਪਕਾਈ ਓਥੈ ਪਾਇ ॥ ਨਾਨਕ ਗਇਆ ਜਾਪੈ ਜਾਇ ॥੩੪॥
//            ਧਰਮ ਖੰਡ ਕਾ ਏਹੋ ਧਰਮੁ ॥ ਗਿਆਨ ਖੰਡ ਕਾ ਆਖਹੁ ਕਰਮੁ ॥ ਕੇਤੇ ਪਵਣ ਪਾਣੀ ਵੈਸੰਤਰ ਕੇਤੇ ਕਾਨ ਮਹੇਸ ॥ ਕੇਤੇ ਬਰਮੇ ਘਾੜਤਿ ਘੜੀਅਹਿ ਰੂਪ ਰੰਗ ਕੇ ਵੇਸ ॥ ਕੇਤੀਆ ਕਰਮ ਭੂਮੀ ਮੇਰ ਕੇਤੇ ਕੇਤੇ ਧੂ ਉਪਦੇਸ ॥ ਕੇਤੇ ਇੰਦ ਚੰਦ ਸੂਰ ਕੇਤੇ ਕੇਤੇ ਮੰਡਲ ਦੇਸ ॥ ਕੇਤੇ ਸਿਧ ਬੁਧ ਨਾਥ ਕੇਤੇ ਕੇਤੇ ਦੇਵੀ ਵੇਸ ॥ ਕੇਤੇ ਦੇਵ ਦਾਨਵ ਮੁਨਿ ਕੇਤੇ ਕੇਤੇ ਰਤਨ ਸਮੁੰਦ ॥ ਕੇਤੀਆ ਖਾਣੀ ਕੇਤੀਆ ਬਾਣੀ ਕੇਤੇ ਪਾਤ ਨਰਿੰਦ ॥ ਕੇਤੀਆ ਸੁਰਤੀ ਸੇਵਕ ਕੇਤੇ ਨਾਨਕ ਅੰਤੁ ਨ ਅੰਤੁ ॥੩੫॥
//            ਗਿਆਨ ਖੰਡ ਮਹਿ ਗਿਆਨੁ ਪਰਚੰਡੁ ॥ ਤਿਥੈ ਨਾਦ ਬਿਨੋਦ ਕੋਡ ਅਨੰਦੁ ॥ ਸਰਮ ਖੰਡ ਕੀ ਬਾਣੀ ਰੂਪੁ ॥ ਤਿਥੈ ਘਾੜਤਿ ਘੜੀਐ ਬਹੁਤੁ ਅਨੂਪੁ ॥ ਤਾ ਕੀਆ ਗਲਾ ਕਥੀਆ ਨਾ ਜਾਹਿ ॥ ਜੇ ਕੋ ਕਹੈ ਪਿਛੈ ਪਛੁਤਾਇ ॥ ਤਿਥੈ ਘੜੀਐ ਸੁਰਤਿ ਮਤਿ ਮਨਿ ਬੁਧਿ ॥ ਤਿਥੈ ਘੜੀਐ ਸੁਰਾ ਸਿਧਾ ਕੀ ਸੁਧਿ ॥੩੬॥
//            ਕਰਮ ਖੰਡ ਕੀ ਬਾਣੀ ਜੋਰੁ ॥ ਤਿਥੈ ਹੋਰੁ ਨ ਕੋਈ ਹੋਰੁ ॥ ਤਿਥੈ ਜੋਧ ਮਹਾਬਲ ਸੂਰ ॥ ਤਿਨ ਮਹਿ ਰਾਮੁ ਰਹਿਆ ਭਰਪੂਰ ॥ ਤਿਥੈ ਸੀਤੋ ਸੀਤਾ ਮਹਿਮਾ ਮਾਹਿ ॥ ਤਾ ਕੇ ਰੂਪ ਨ ਕਥਨੇ ਜਾਹਿ ॥ ਨਾ ਓਹਿ ਮਰਹਿ ਨ ਠਾਗੇ ਜਾਹਿ ॥ ਜਿਨ ਕੈ ਰਾਮੁ ਵਸੈ ਮਨ ਮਾਹਿ ॥ ਤਿਥੈ ਭਗਤ ਵਸਹਿ ਕੇ ਲੋਅ ॥ ਕਰਹਿ ਅਨੰਦੁ ਸਚਾ ਮਨਿ ਸੋਇ ॥ ਸਚ ਖੰਡਿ ਵਸੈ ਨਿਰੰਕਾਰੁ ॥ ਕਰਿ ਕਰਿ ਵੇਖੈ ਨਦਰਿ ਨਿਹਾਲ ॥ ਤਿਥੈ ਖੰਡ ਮੰਡਲ ਵਰਭੰਡ ॥ ਜੇ ਕੋ ਕਥੈ ਤ ਅੰਤ ਨ ਅੰਤ ॥ ਤਿਥੈ ਲੋਅ ਲੋਅ ਆਕਾਰ ॥ ਜਿਵ ਜਿਵ ਹੁਕਮੁ ਤਿਵੈ ਤਿਵ ਕਾਰ ॥ ਵੇਖੈ ਵਿਗਸੈ ਕਰਿ ਵੀਚਾਰੁ ॥ ਨਾਨਕ ਕਥਨਾ ਕਰੜਾ ਸਾਰੁ ॥੩੭॥
//            ਜਤੁ ਪਾਹਾਰਾ ਧੀਰਜੁ ਸੁਨਿਆਰੁ ॥ ਅਹਰਣਿ ਮਤਿ ਵੇਦੁ ਹਥੀਆਰੁ ॥ ਭਉ ਖਲਾ ਅਗਨਿ ਤਪ ਤਾਉ ॥ ਭਾਂਡਾ ਭਾਉ ਅੰਮ੍ਰਿਤੁ ਤਿਤੁ ਢਾਲਿ ॥ ਘੜੀਐ ਸਬਦੁ ਸਚੀ ਟਕਸਾਲ ॥ ਜਿਨ ਕਉ ਨਦਰਿ ਕਰਮੁ ਤਿਨ ਕਾਰ ॥ ਨਾਨਕ ਨਦਰੀ ਨਦਰਿ ਨਿਹਾਲ ॥੩੮॥
//            ਸਲੋਕੁ ॥
//            ਪਵਣੁ ਗੁਰੂ ਪਾਣੀ ਪਿਤਾ ਮਾਤਾ ਧਰਤਿ ਮਹਤੁ ॥ ਦਿਵਸੁ ਰਾਤਿ ਦੁਇ ਦਾਈ ਦਾਇਆ ਖੇਲੈ ਸਗਲ ਜਗਤੁ ॥ ਚੰਗਿਆਈਆ ਬੁਰਿਆਈਆ ਵਾਚੈ ਧਰਮੁ ਹਦੂਰਿ ॥ ਕਰਮੀ ਆਪੋ ਆਪਣੀ ਕੇ ਨੇੜੈ ਕੇ ਦੂਰਿ ॥ ਜਿਨੀ ਨਾਮੁ ਧਿਆਇਆ ਗਏ ਮਸਕਤਿ ਘਾਲਿ ॥ ਨਾਨਕ ਤੇ ਮੁਖ ਉਜਲੇ ਕੇਤੀ ਛੁਟੀ ਨਾਲਿ ॥੧॥",
            ,hinglish: "Ik-oamkkaari satinaamu karataa purakhu nirabhau niravairu akaal moorati ajoonee saibhann guraprsaadi ||"
//            || japu ||
//            Aadi sachu jugaadi sachu || Hai bhee sachu naanak hosee bhee sachu ||1||
//            Sochai sochi na hovaee je sochee lakh vaar || Chupai chup na hovaee je laai rahaa liv taar || Bhukhiaa bhukh na utaree je bannaa pureeaa bhaar || Sahas siaa(nn)apaa lakh hohi ta ik na chalai naali || Kiv sachiaaraa hoeeai kiv koo(rr)ai tutai paali || Hukami rajaaee chala(nn)aa naanak likhiaa naali ||1||
//            Hukamee hovani aakaar hukamu na kahiaa jaaee || Hukamee hovani jeea hukami milai vadiaaee || Hukamee utamu neechu hukami likhi dukh sukh paaeeahi || Ikanaa hukamee bakhasees iki hukamee sadaa bhavaaeeahi || Hukamai anddari sabhu ko baahari hukam na koi || Naanak hukamai je bujhai ta haumai kahai na koi ||2||
//            Gaavai ko taa(nn)u hovai kisai taa(nn)u || Gaavai ko daati jaa(nn)ai neesaa(nn)u || Gaavai ko gu(nn) vadiaaeeaa chaar || Gaavai ko vidiaa vikhamu veechaaru || Gaavai ko saaji kare tanu kheh || Gaavai ko jeea lai phiri deh || Gaavai ko jaapai disai doori || Gaavai ko vekhai haadaraa hadoori || Kathanaa kathee na aavai toti || Kathi kathi kathee kotee koti koti || Dedaa de laide thaki paahi || Jugaa juganttari khaahee khaahi || Hukamee hukamu chalaae raahu || Naanak vigasai veparavaahu ||3||
//            Saachaa saahibu saachu naai bhaakhiaa bhaau apaaru || Aakhahi manggahi dehi dehi daati kare daataaru || Pheri ki agai rakheeai jitu disai darabaaru || Muhau ki bola(nn)u boleeai jitu su(nn)i dhare piaaru || Ammmrit velaa sachu naau vadiaaee veechaaru || Karamee aavai kapa(rr)aa nadaree mokhu duaaru || Naanak evai jaa(nn)eeai sabhu aape sachiaaru ||4||
//            Thaapiaa na jaai keetaa na hoi || Aape aapi niranjjanu soi || Jini seviaa tini paaiaa maanu || Naanak gaaveeai gu(nn)ee nidhaanu || Gaaveeai su(nn)eeai mani rakheeai bhaau || Dukhu parahari sukhu ghari lai jaai || Guramukhi naadann guramukhi vedann guramukhi rahiaa samaaee || Guru eesaru guru gorakhu baramaa guru paarabatee maaee || Je hau jaa(nn)aa aakhaa naahee kaha(nn)aa kathanu na jaaee || Guraa ik dehi bujhaaee || Sabhanaa jeeaa kaa iku daataa so mai visari na jaaee ||5||
//            Teerathi naavaa je tisu bhaavaa vi(nn)u bhaa(nn)e ki naai karee || Jetee sirathi upaaee vekhaa vi(nn)u karamaa ki milai laee || Mati vichi ratan javaahar maa(nn)ik je ik gur kee sikh su(nn)ee || Guraa ik dehi bujhaaee || Sabhanaa jeeaa kaa iku daataa so mai visari na jaaee ||6||
//            Je jug chaare aarajaa hor dasoo(nn)ee hoi || Navaa khanddaa vichi jaa(nn)eeai naali chalai sabhu koi || Changgaa naau rakhaai kai jasu keerati jagi lei || Je tisu nadari na aavaee ta vaat na puchhai ke || Keetaa anddari keetu kari dosee dosu dhare || Naanak niragu(nn)i gu(nn)u kare gu(nn)avanttiaa gu(nn)u de || Tehaa koi na sujhaee ji tisu gu(nn)u koi kare ||7||
//            Su(nn)iai sidh peer suri naath || Su(nn)iai dharati dhaval aakaas || Su(nn)iai deep loa paataal || Su(nn)iai pohi na sakai kaalu || Naanak bhagataa sadaa vigaasu || Su(nn)iai dookh paap kaa naasu ||8||
//            Su(nn)iai eesaru baramaa ianddu || Su(nn)iai mukhi saalaaha(nn) manddu || Su(nn)iai jog jugati tani bhed || Su(nn)iai saasat simriti ved || Naanak bhagataa sadaa vigaasu || Su(nn)iai dookh paap kaa naasu ||9||
//            Su(nn)iai satu santtokhu giaanu || Su(nn)iai athasathi kaa isanaanu || Su(nn)iai pa(rr)i pa(rr)i paavahi maanu || Su(nn)iai laagai sahaji dhiaanu || Naanak bhagataa sadaa vigaasu || Su(nn)iai dookh paap kaa naasu ||10||
//            Su(nn)iai saraa gu(nn)aa ke gaah || Su(nn)iai sekh peer paatisaah || Su(nn)iai anddhe paavahi raahu || Su(nn)iai haath hovai asagaahu || Naanak bhagataa sadaa vigaasu || Su(nn)iai dookh paap kaa naasu ||11||
//            Manne kee gati kahee na jaai || Je ko kahai pichhai pachhutaai || Kaagadi kalam na likha(nn)ahaaru || Manne kaa bahi karani veechaaru || Aisaa naamu niranjjanu hoi || Je ko manni jaa(nn)ai mani koi ||12||
//            Mannai surati hovai mani budhi || Mannai sagal bhava(nn) kee sudhi || Mannai muhi chotaa naa khaai || Mannai jam kai saathi na jaai || Aisaa naamu niranjjanu hoi || Je ko manni jaa(nn)ai mani koi ||13||
//            Mannai maaragi thaak na paai || Mannai pati siu paragatu jaai || Mannai magu na chalai pantthu || Mannai dharam setee sanabanddhu || Aisaa naamu niranjjanu hoi || Je ko manni jaa(nn)ai mani koi ||14||
//            Mannai paavahi mokhu duaaru || Mannai paravaarai saadhaaru || Mannai tarai taare guru sikh || Mannai naanak bhavahi na bhikh || Aisaa naamu niranjjanu hoi || Je ko manni jaa(nn)ai mani koi ||15||
//            Pancch paravaa(nn) pancch paradhaanu || Pancche paavahi daragahi maanu || Pancche sohahi dari raajaanu || Pancchaa kaa guru eku dhiaanu || Je ko kahai karai veechaaru || Karate kai kara(nn)ai naahee sumaaru || Dhaulu dharamu daiaa kaa pootu || Santtokhu thaapi rakhiaa jini sooti || Je ko bujhai hovai sachiaaru || Dhavalai upari ketaa bhaaru || Dharatee horu parai horu horu || Tis te bhaaru talai kava(nn)u joru || Jeea jaati ranggaa ke naav || Sabhanaa likhiaa vu(rr)ee kalaam || Ehu lekhaa likhi jaa(nn)ai koi || Lekhaa likhiaa ketaa hoi || Ketaa taa(nn)u suaalihu roopu || Ketee daati jaa(nn)ai kau(nn)u kootu || Keetaa pasaau eko kavaau || Tis te hoe lakh dareeaau || Kudarati kava(nn) kahaa veechaaru || Vaariaa na jaavaa ek vaar || Jo tudhu bhaavai saaee bhalee kaar || Too sadaa salaamati nirankkaar ||16||
//            Asankkh jap asankkh bhaau || Asankkh poojaa asankkh tap taau || Asankkh garantth mukhi ved paath || Asankkh jog mani rahahi udaas || Asankkh bhagat gu(nn) giaan veechaar || Asankkh satee asankkh daataar || Asankkh soor muh bhakh saar || Asankkh moni liv laai taar || Kudarati kava(nn) kahaa veechaaru || Vaariaa na jaavaa ek vaar || Jo tudhu bhaavai saaee bhalee kaar || Too sadaa salaamati nirankkaar ||17||
//            Asankkh moorakh anddh ghor || Asankkh chor haraamakhor || Asankkh amar kari jaahi jor || Asankkh galavadh hatiaa kamaahi || Asankkh paapee paapu kari jaahi || Asankkh koo(rr)iaar koo(rr)e phiraahi || Asankkh malechh malu bhakhi khaahi || Asankkh ninddak siri karahi bhaaru || Naanaku neechu kahai veechaaru || Vaariaa na jaavaa ek vaar || Jo tudhu bhaavai saaee bhalee kaar || Too sadaa salaamati nirankkaar ||18||
//            Asankkh naav asankkh thaav || Agamm agamm asankkh loa || Asankkh kahahi siri bhaaru hoi || Akharee naamu akharee saalaah || Akharee giaanu geet gu(nn) gaah || Akharee likha(nn)u bola(nn)u baa(nn)i || Akharaa siri sanjjogu vakhaa(nn)i || Jini ehi likhe tisu siri naahi || Jiv phuramaae tiv tiv paahi || Jetaa keetaa tetaa naau || Vi(nn)u naavai naahee ko thaau || Kudarati kava(nn) kahaa veechaaru || Vaariaa na jaavaa ek vaar || Jo tudhu bhaavai saaee bhalee kaar || Too sadaa salaamati nirankkaar ||19||
//            Bhareeai hathu pairu tanu deh || Paa(nn)ee dhotai utarasu kheh || Moot paleetee kapa(rr)u hoi || De saaboo(nn)u laeeai ohu dhoi || Bhareeai mati paapaa kai sanggi || Ohu dhopai naavai kai ranggi || Punnee paapee aakha(nn)u naahi || Kari kari kara(nn)aa likhi lai jaahu || Aape beeji aape hee khaahu || Naanak hukamee aavahu jaahu ||20||
//            Teerathu tapu daiaa datu daanu || Je ko paavai til kaa maanu || Su(nn)iaa manniaa mani keetaa bhaau || Anttaragati teerathi mali naau || Sabhi gu(nn) tere mai naahee koi || Vi(nn)u gu(nn) keete bhagati na hoi || Suasati aathi baa(nn)ee baramaau || Sati suhaa(nn)u sadaa mani chaau || Kava(nn)u su velaa vakhatu kava(nn)u kava(nn) thiti kava(nn)u vaaru || Kava(nn)i si rutee maahu kava(nn)u jitu hoaa aakaaru || Vel na paaeeaa panddatee ji hovai lekhu puraa(nn)u || Vakhatu na paaio kaadeeaa ji likhani lekhu kuraa(nn)u || Thiti vaaru naa jogee jaa(nn)ai ruti maahu naa koee || Jaa karataa sirathee kau saaje aape jaa(nn)ai soee || Kiv kari aakhaa kiv saalaahee kiu varanee kiv jaa(nn)aa || Naanak aakha(nn)i sabhu ko aakhai ik doo iku siaa(nn)aa || Vadaa saahibu vadee naaee keetaa jaa kaa hovai || Naanak je ko aapau jaa(nn)ai agai gaiaa na sohai ||21||
//            Paataalaa paataal lakh aagaasaa aagaas || O(rr)ak o(rr)ak bhaali thake ved kahani ik vaat || Sahas athaarah kahani katebaa asuloo iku dhaatu || Lekhaa hoi ta likheeai lekhai hoi vi(nn)aasu || Naanak vadaa aakheeai aape jaa(nn)ai aapu ||22||
//            Saalaahee saalaahi etee surati na paaeeaa || Nadeeaa atai vaah pavahi samunddi na jaa(nn)eeahi || Samundd saah sulataan girahaa setee maalu dhanu || Kee(rr)ee tuli na hovanee je tisu manahu na veesarahi ||23||
//            Anttu na siphatee kaha(nn)i na anttu || Anttu na kara(nn)ai de(nn)i na anttu || Anttu na vekha(nn)i su(nn)a(nn)i na anttu || Anttu na jaapai kiaa mani manttu || Anttu na jaapai keetaa aakaaru || Anttu na jaapai paaraavaaru || Antt kaara(nn)i kete bilalaahi || Taa ke antt na paae jaahi || Ehu anttu na jaa(nn)ai koi || Bahutaa kaheeai bahutaa hoi || Vadaa saahibu uchaa thaau || Uche upari uchaa naau || Evadu uchaa hovai koi || Tisu uche kau jaa(nn)ai soi || Jevadu aapi jaa(nn)ai aapi aapi || Naanak nadaree karamee daati ||24||
//            Bahutaa karamu likhiaa naa jaai || Vadaa daataa tilu na tamaai || Kete manggahi jodh apaar || Ketiaa ga(nn)at nahee veechaaru || Kete khapi tutahi vekaar || Kete lai lai mukaru paahi || Kete moorakh khaahee khaahi || Ketiaa dookh bhookh sad maar || Ehi bhi daati teree daataar || Banddi khalaasee bhaa(nn)ai hoi || Horu aakhi na sakai koi || Je ko khaaiku aakha(nn)i paai || Ohu jaa(nn)ai jeteeaa muhi khaai || Aape jaa(nn)ai aape dei || Aakhahi si bhi keee kei || Jis no bakhase siphati saalaah || Naanak paatisaahee paatisaahu ||25||
//            Amul gu(nn) amul vaapaar || Amul vaapaareee amul bhanddaar || Amul aavahi amul lai jaahi || Amul bhaai amulaa samaahi || Amulu dharamu amulu deebaa(nn)u || Amulu tulu amulu paravaa(nn)u || Amulu bakhasees amulu neesaa(nn)u || Amulu karamu amulu phuramaa(nn)u || Amulo amulu aakhiaa na jaai || Aakhi aakhi rahe liv laai || Aakhahi ved paath puraa(nn) || Aakhahi pa(rr)e karahi vakhiaa(nn) || Aakhahi barame aakhahi iandd || Aakhahi gopee tai govindd || Aakhahi eesar aakhahi sidh || Aakhahi kete keete budh || Aakhahi daanav aakhahi dev || Aakhahi suri nar muni jan sev || Kete aakhahi aakha(nn)i paahi || Kete kahi kahi uthi uthi jaahi || Ete keete hori karehi || Taa aakhi na sakahi keee kei || Jevadu bhaavai tevadu hoi || Naanak jaa(nn)ai saachaa soi || Je ko aakhai boluvigaa(rr)u || Taa likheeai siri gaavaaraa gaavaaru ||26||
//            So daru kehaa so gharu kehaa jitu bahi sarab samaale || Vaaje naad anek asankkhaa kete vaava(nn)ahaare || Kete raag paree siu kaheeani kete gaava(nn)ahaare || Gaavahi tuhano pau(nn)u paa(nn)ee baisanttaru gaavai raajaa dharamu duaare || Gaavahi chitu gupatu likhi jaa(nn)ahi likhi likhi dharamu veechaare || Gaavahi eesaru baramaa devee sohani sadaa savaare || Gaavahi iandd idaasa(nn)i baithe devatiaa dari naale || Gaavahi sidh samaadhee anddari gaavani saadh vichaare || Gaavani jatee satee santtokhee gaavahi veer karaare || Gaavani panddit pa(rr)ani rakheesar jugu jugu vedaa naale || Gaavahi moha(nn)eeaa manu mohani suragaa machh paiaale || Gaavani ratan upaae tere athasathi teerath naale || Gaavahi jodh mahaabal sooraa gaavahi khaa(nn)ee chaare || Gaavahi khandd manddal varabhanddaa kari kari rakhe dhaare || Seee tudhuno gaavahi jo tudhu bhaavani rate tere bhagat rasaale || Hori kete gaavani se mai chiti na aavani naanaku kiaa veechaare || Soee soee sadaa sachu saahibu saachaa saachee naaee || Hai bhee hosee jaai na jaasee rachanaa jini rachaaee || Ranggee ranggee bhaatee kari kari jinasee maaiaa jini upaaee || Kari kari vekhai keetaa aapa(nn)aa jiv tis dee vadiaaee || Jo tisu bhaavai soee karasee hukamu na kara(nn)aa jaaee || So paatisaahu saahaa paatisaahibu naanak raha(nn)u rajaaee ||27||
//            Munddaa santtokhu saramu patu jholee dhiaan kee karahi bibhooti || Khintthaa kaalu kuaaree kaaiaa jugati danddaa parateeti || Aaee pantthee sagal jamaatee mani jeetai jagu jeetu || Aadesu tisai aadesu || Aadi aneelu anaadi anaahati jugu jugu eko vesu ||28||
//            Bhugati giaanu daiaa bhanddaara(nn)i ghati ghati vaajahi naad || Aapi naathu naathee sabh jaa kee ridhi sidhi avaraa saad || Sanjjogu vijogu dui kaar chalaavahi lekhe aavahi bhaag || Aadesu tisai aadesu || Aadi aneelu anaadi anaahati jugu jugu eko vesu ||29||
//            Ekaa maaee jugati viaaee tini chele paravaa(nn)u || Iku sanssaaree iku bhanddaaree iku laae deebaa(nn)u || Jiv tisu bhaavai tivai chalaavai jiv hovai phuramaa(nn)u || Ohu vekhai onaa nadari na aavai bahutaa ehu vidaa(nn)u || Aadesu tisai aadesu || Aadi aneelu anaadi anaahati jugu jugu eko vesu ||30||
//            Aasa(nn)u loi loi bhanddaar || Jo kichhu paaiaa su ekaa vaar || Kari kari vekhai siraja(nn)ahaaru || Naanak sache kee saachee kaar || Aadesu tisai aadesu || Aadi aneelu anaadi anaahati jugu jugu eko vesu ||31||
//            Ik doo jeebhau lakh hohi lakh hovahi lakh vees || Lakhu lakhu ge(rr)aa aakheeahi eku naamu jagadees || Etu raahi pati pava(rr)eeaa cha(rr)eeai hoi ikees || Su(nn)i galaa aakaas kee keetaa aaee rees || Naanak nadaree paaeeai koo(rr)ee koo(rr)ai thees ||32||
//            Aakha(nn)i joru chupai nah joru || Joru na mangga(nn)i de(nn)i na joru || Joru na jeeva(nn)i mara(nn)i nah joru || Joru na raaji maali mani soru || Joru na suratee giaani veechaari || Joru na jugatee chhutai sanssaaru || Jisu hathi joru kari vekhai soi || Naanak utamu neechu na koi ||33||
//            Raatee rutee thitee vaar || Pava(nn) paa(nn)ee aganee paataal || Tisu vichi dharatee thaapi rakhee dharam saal || Tisu vichi jeea jugati ke rangg || Tin ke naam anek anantt || Karamee karamee hoi veechaaru || Sachaa aapi sachaa darabaaru || Tithai sohani pancch paravaa(nn)u || Nadaree karami pavai neesaa(nn)u || Kach pakaaee othai paai || Naanak gaiaa jaapai jaai ||34||
//            Dharam khandd kaa eho dharamu || Giaan khandd kaa aakhahu karamu || Kete pava(nn) paa(nn)ee vaisanttar kete kaan mahes || Kete barame ghaa(rr)ati gha(rr)eeahi roop rangg ke ves || Keteeaa karam bhoomee mer kete kete dhoo upades || Kete iandd chandd soor kete kete manddal des || Kete sidh budh naath kete kete devee ves || Kete dev daanav muni kete kete ratan samundd || Keteeaa khaa(nn)ee keteeaa baa(nn)ee kete paat narindd || Keteeaa suratee sevak kete naanak anttu na anttu ||35||
//            Giaan khandd mahi giaanu parachanddu || Tithai naad binod kod ananddu || Saram khandd kee baa(nn)ee roopu || Tithai ghaa(rr)ati gha(rr)eeai bahutu anoopu || Taa keeaa galaa katheeaa naa jaahi || Je ko kahai pichhai pachhutaai || Tithai gha(rr)eeai surati mati mani budhi || Tithai gha(rr)eeai suraa sidhaa kee sudhi ||36||
//            Karam khandd kee baa(nn)ee joru || Tithai horu na koee horu || Tithai jodh mahaabal soor || Tin mahi raamu rahiaa bharapoor || Tithai seeto seetaa mahimaa maahi || Taa ke roop na kathane jaahi || Naa ohi marahi na thaage jaahi || Jin kai raamu vasai man maahi || Tithai bhagat vasahi ke loa || Karahi ananddu sachaa mani soi || Sach khanddi vasai nirankkaaru || Kari kari vekhai nadari nihaal || Tithai khandd manddal varabhandd || Je ko kathai ta antt na antt || Tithai loa loa aakaar || Jiv jiv hukamu tivai tiv kaar || Vekhai vigasai kari veechaaru || Naanak kathanaa kara(rr)aa saaru ||37||
//            Jatu paahaaraa dheeraju suniaaru || Ahara(nn)i mati vedu hatheeaaru || Bhau khalaa agani tap taau || Bhaandaa bhaau ammmritu titu dhaali || Gha(rr)eeai sabadu sachee takasaal || Jin kau nadari karamu tin kaar || Naanak nadaree nadari nihaal ||38||
//            Saloku ||
//            Pava(nn)u guroo paa(nn)ee pitaa maataa dharati mahatu || Divasu raati dui daaee daaiaa khelai sagal jagatu || Changgiaaeeaa buriaaeeaa vaachai dharamu hadoori || Karamee aapo aapa(nn)ee ke ne(rr)ai ke doori || Jinee naamu dhiaaiaa gae masakati ghaali || Naanak te mukh ujale ketee chhutee naali ||1||",
            ,english: "One Universal Creator God, TheName Is Truth Creative Being Personified No Fear No Hatred Image Of The Undying, Beyond Birth, Self-Existent. By Guru's Grace~"
//            Chant And Meditate:
//            True In The Primal Beginning. True Throughout The Ages.
//            True Here And Now. O Nanak, Forever And Ever True. ||1||
//            By thinking, He cannot be reduced to thought, even by thinking hundreds of thousands of times.
//            By remaining silent, inner silence is not obtained, even by remaining lovingly absorbed deep within.
//            The hunger of the hungry is not appeased, even by piling up loads of worldly goods.
//            Hundreds of thousands of clever tricks, but not even one of them will go along with you in the end.
//            So how can you become truthful? And how can the veil of illusion be torn away?
//            O Nanak, it is written that you shall obey the Hukam of His Command, and walk in the Way of His Will. ||1||
//            By His Command, bodies are created; His Command cannot be described.
//            By His Command, souls come into being; by His Command, glory and greatness are obtained.
//            By His Command, some are high and some are low; by His Written Command, pain and pleasure are obtained.
//            Some, by His Command, are blessed and forgiven; others, by His Command, wander aimlessly forever.
//            Everyone is subject to His Command; no one is beyond His Command.
//            O Nanak, one who understands His Command, does not speak in ego. ||2||
//            Some sing of His Power-who has that Power?
//            Some sing of His Gifts, and know His Sign and Insignia.
//            Some sing of His Glorious Virtues, Greatness and Beauty.
//            Some sing of knowledge obtained of Him, through difficult philosophical studies.
//            Some sing that He fashions the body, and then again reduces it to dust.
//            Some sing that He takes life away, and then again restores it.
//            Some sing that He seems so very far away.
//            Some sing that He watches over us, face to face, ever-present.
//            There is no shortage of those who preach and teach.
//            Millions upon millions offer millions of sermons and stories.
//            The Great Giver keeps on giving, while those who receive grow weary of receiving.
//            Throughout the ages, consumers consume.
//            The Commander, by His Command, leads us to walk on the Path.
//            O Nanak, He blossoms forth, Carefree and Untroubled. ||3||
//            True is the Master, True is His Name-speak it with infinite love.
//            People beg and pray, ""Give to us, give to us"", and the Great Giver gives His Gifts.
//            So what offering can we place before Him, by which we might see the Darbaar of His Court?
//            What words can we speak to evoke His Love?
//            In the Amrit Vaylaa, the ambrosial hours before dawn, chant the True Name, and contemplate His Glorious Greatness.
//            By the karma of past actions, the robe of this physical body is obtained. By His Grace, the Gate of Liberation is found.
//            O Nanak, know this well: the True One Himself is All. ||4||
//            He cannot be established, He cannot be created.
//            He Himself is Immaculate and Pure.
//            Those who serve Him are honored.
//            O Nanak, sing of the Lord, the Treasure of Excellence.
//            Sing, and listen, and let your mind be filled with love.
//            Your pain shall be sent far away, and peace shall come to your home.
//            The Guru's Word is the Sound-current of the Naad; the Guru's Word is the Wisdom of the Vedas; the Guru's Word is all-pervading.
//            The Guru is Shiva, the Guru is Vishnu and Brahma; the Guru is Paarvati and Lakhshmi.
//            Even knowing God, I cannot describe Him; He cannot be described in words.
//            The Guru has given me this one understanding:
//            There is only the One, the Giver of all souls. May I never forget Him! ||5||
//            If I am pleasing to Him, then that is my pilgrimage and cleansing bath. Without pleasing Him, what good are ritual cleansings?
//            I gaze upon all the created beings: without the karma of good actions, what are they given to receive?
//            Within the mind are gems, jewels and rubies, if you listen to the Guru's Teachings, even once.
//            The Guru has given me this one understanding:
//            There is only the One, the Giver of all souls. May I never forget Him! ||6||
//            Even if you could live throughout the four ages, or even ten times more,
//            And even if you were known throughout the nine continents and followed by all,
//            With a good name and reputation, with praise and fame throughout the world-
//            Still, if the Lord does not bless you with His Glance of Grace, then who cares? What is the use?
//            Among worms, you would be considered a lowly worm, and even contemptible sinners would hold you in contempt.
//            O Nanak, God blesses the unworthy with virtue, and bestows virtue on the virtuous.
//            No one can even imagine anyone who can bestow virtue upon Him. ||7||
//            Listening-the Siddhas, the spiritual teachers, the heroic warriors, the yogic masters.
//            Listening-the earth, its support and the Akaashic ethers.
//            Listening-the oceans, the lands of the world and the nether regions of the underworld.
//            Listening-Death cannot even touch you.
//            O Nanak, the devotees are forever in bliss.
//            Listening-pain and sin are erased. ||8||
//            Listening-Shiva, Brahma and Indra.
//            Listening-even foul-mouthed people praise Him.
//            Listening-the technology of Yoga and the secrets of the body.
//            Listening-the Shaastras, the Simritees and the Vedas.
//            O Nanak, the devotees are forever in bliss.
//            Listening-pain and sin are erased. ||9||
//            Listening-truth, contentment and spiritual wisdom.
//            Listening-take your cleansing bath at the sixty-eight places of pilgrimage.
//            Listening-reading and reciting, honor is obtained.
//            Listening-intuitively grasp the essence of meditation.
//            O Nanak, the devotees are forever in bliss.
//            Listening-pain and sin are erased. ||10||
//            Listening-dive deep into the ocean of virtue.
//            Listening-the Shaykhs, religious scholars, spiritual teachers and emperors.
//            Listening-even the blind find the Path.
//            Listening-the Unreachable comes within your grasp.
//            O Nanak, the devotees are forever in bliss.
//            Listening-pain and sin are erased. ||11||
//            The state of the faithful cannot be described.
//            One who tries to describe this shall regret the attempt.
//            No paper, no pen, no scribe
//            Can record the state of the faithful.
//            Such is the Name of the Immaculate Lord.
//            Only one who has faith comes to know such a state of mind. ||12||
//            The faithful have intuitive awareness and intelligence.
//            The faithful know about all worlds and realms.
//            The faithful shall never be struck across the face.
//            The faithful do not have to go with the Messenger of Death.
//            Such is the Name of the Immaculate Lord.
//            Only one who has faith comes to know such a state of mind. ||13||
//            The path of the faithful shall never be blocked.
//            The faithful shall depart with honor and fame.
//            The faithful do not follow empty religious rituals.
//            The faithful are firmly bound to the Dharma.
//            Such is the Name of the Immaculate Lord.
//            Only one who has faith comes to know such a state of mind. ||14||
//            The faithful find the Door of Liberation.
//            The faithful uplift and redeem their family and relations.
//            The faithful are saved, and carried across with the Sikhs of the Guru.
//            The faithful, O Nanak, do not wander around begging.
//            Such is the Name of the Immaculate Lord.
//            Only one who has faith comes to know such a state of mind. ||15||
//            The chosen ones, the self-elect, are accepted and approved.
//            The chosen ones are honored in the Court of the Lord.
//            The chosen ones look beautiful in the courts of kings.
//            The chosen ones meditate single-mindedly on the Guru.
//            No matter how much anyone tries to explain and describe them,
//            The actions of the Creator cannot be counted.
//            The mythical bull is Dharma, the son of compassion;
//            This is what patiently holds the earth in its place.
//            One who understands this becomes truthful.
//            What a great load there is on the bull!
//            So many worlds beyond this world-so very many!
//            What power holds them, and supports their weight?
//            The names and the colors of the assorted species of beings
//            Were all inscribed by the Ever-flowing Pen of God.
//            Who knows how to write this account?
//            Just imagine what a huge scroll it would take!
//            What power! What fascinating beauty!
//            And what gifts! Who can know their extent?
//            You created the vast expanse of the Universe with One Word!
//            Hundreds of thousands of rivers began to flow.
//            How can Your Creative Potency be described?
//            I cannot even once be a sacrifice to You.
//            Whatever pleases You is the only good done,
//            You, Eternal and Formless One! ||16||
//            Countless meditations, countless loves.
//            Countless worship services, countless austere disciplines.
//            Countless scriptures, and ritual recitations of the Vedas.
//            Countless Yogis, whose minds remain detached from the world.
//            Countless devotees contemplate the Wisdom and Virtues of the Lord.
//            Countless the holy, countless the givers.
//            Countless heroic spiritual warriors, who bear the brunt of the attack in battle (who with their mouths eat steel).
//            Countless silent sages, vibrating the String of His Love.
//            How can Your Creative Potency be described?
//            I cannot even once be a sacrifice to You.
//            Whatever pleases You is the only good done,
//            You, Eternal and Formless One. ||17||
//            Countless fools, blinded by ignorance.
//            Countless thieves and embezzlers.
//            Countless impose their will by force.
//            Countless cut-throats and ruthless killers.
//            Countless sinners who keep on sinning.
//            Countless liars, wandering lost in their lies.
//            Countless wretches, eating filth as their ration.
//            Countless slanderers, carrying the weight of their stupid mistakes on their heads.
//            Nanak describes the state of the lowly.
//            I cannot even once be a sacrifice to You.
//            Whatever pleases You is the only good done,
//            You, Eternal and Formless One. ||18||
//            Countless names, countless places.
//            Inaccessible, unapproachable, countless celestial realms.
//            Even to call them countless is to carry the weight on your head.
//            From the Word, comes the Naam; from the Word, comes Your Praise.
//            From the Word, comes spiritual wisdom, singing the Songs of Your Glory.
//            From the Word, come the written and spoken words and hymns.
//            From the Word, comes destiny, written on one's forehead.
//            But the One who wrote these Words of Destiny-no words are written on His Forehead.
//            As He ordains, so do we receive.
//            The created universe is the manifestation of Your Name.
//            Without Your Name, there is no place at all.
//            How can I describe Your Creative Power?
//            I cannot even once be a sacrifice to You.
//            Whatever pleases You is the only good done,
//            You, Eternal and Formless One. ||19||
//            When the hands and the feet and the body are dirty,
//            Water can wash away the dirt.
//            When the clothes are soiled and stained by urine,
//            Soap can wash them clean.
//            But when the intellect is stained and polluted by sin,
//            It can only be cleansed by the Love of the Name.
//            Virtue and vice do not come by mere words;
//            Actions repeated, over and over again, are engraved on the soul.
//            You shall harvest what you plant.
//            O Nanak, by the Hukam of God's Command, we come and go in reincarnation. ||20||
//            Pilgrimages, austere discipline, compassion and charity
//            These, by themselves, bring only an iota of merit.
//            Listening and believing with love and humility in your mind,
//            Cleanse yourself with the Name, at the sacred shrine deep within.
//            All virtues are Yours, Lord, I have none at all.
//            Without virtue, there is no devotional worship.
//            I bow to the Lord of the World, to His Word, to Brahma the Creator.
//            He is Beautiful, True and Eternally Joyful.
//            What was that time, and what was that moment? What was that day, and what was that date?
//            What was that season, and what was that month, when the Universe was created?
//            The Pandits, the religious scholars, cannot find that time, even if it is written in the Puraanas.
//            That time is not known to the Qazis, who study the Koran.
//            The day and the date are not known to the Yogis, nor is the month or the season.
//            The Creator who created this creation-only He Himself knows.
//            How can we speak of Him? How can we praise Him? How can we describe Him? How can we know Him?
//            O Nanak, everyone speaks of Him, each one wiser than the rest.
//            Great is the Master, Great is His Name. Whatever happens is according to His Will.
//            O Nanak, one who claims to know everything shall not be decorated in the world hereafter. ||21||
//            There are nether worlds beneath nether worlds, and hundreds of thousands of heavenly worlds above.
//            The Vedas say that you can search and search for them all, until you grow weary.
//            The scriptures say that there are 18,000 worlds, but in reality, there is only One Universe.
//            If you try to write an account of this, you will surely finish yourself before you finish writing it.
//            O Nanak, call Him Great! He Himself knows Himself. ||22||
//            The praisers praise the Lord, but they do not obtain intuitive understanding
//            The streams and rivers flowing into the ocean do not know its vastness.
//            Even kings and emperors, with mountains of property and oceans of wealth
//            -these are not even equal to an ant, who does not forget God. ||23||
//            Endless are His Praises, endless are those who speak them.
//            Endless are His Actions, endless are His Gifts.
//            Endless is His Vision, endless is His Hearing.
//            His limits cannot be perceived. What is the Mystery of His Mind?
//            The limits of the created universe cannot be perceived.
//            Its limits here and beyond cannot be perceived.
//            Many struggle to know His limits,
//            But His limits cannot be found.
//            No one can know these limits.
//            The more you say about them, the more there still remains to be said.
//            Great is the Master, High is His Heavenly Home.
//            Highest of the High, above all is His Name.
//            Only one as Great and as High as God
//            Can know His Lofty and Exalted State.
//            Only He Himself is that Great. He Himself knows Himself.
//            O Nanak, by His Glance of Grace, He bestows His Blessings. ||24||
//            His Blessings are so abundant that there can be no written account of them.
//            The Great Giver does not hold back anything.
//            There are so many great, heroic warriors begging at the Door of the Infinite Lord.
//            So many contemplate and dwell upon Him, that they cannot be counted.
//            So many waste away to death engaged in corruption.
//            So many take and take again, and then deny receiving.
//            So many foolish consumers keep on consuming.
//            So many endure distress, deprivation and constant abuse.
//            Even these are Your Gifts, O Great Giver!
//            Liberation from bondage comes only by Your Will.
//            No one else has any say in this.
//            If some fool should presume to say that he does,
//            He shall learn, and feel the effects of his folly.
//            He Himself knows, He Himself gives.
//            Few, very few are those who acknowledge this.
//            One who is blessed to sing the Praises of the Lord,
//            O Nanak, is the king of kings. ||25||
//            Priceless are His Virtues, Priceless are His Dealings.
//            Priceless are His Dealers, Priceless are His Treasures.
//            Priceless are those who come to Him, Priceless are those who buy from Him.
//            Priceless is Love for Him, Priceless is absorption into Him.
//            Priceless is the Divine Law of Dharma, Priceless is the Divine Court of Justice.
//            Priceless are the scales, priceless are the weights.
//            Priceless are His Blessings, Priceless is His Banner and Insignia.
//            Priceless is His Mercy, Priceless is His Royal Command.
//            Priceless, O Priceless beyond expression!
//            Speak of Him continually, and remain absorbed in His Love.
//            The Vedas and the Puraanas speak.
//            The scholars speak and lecture.
//            Brahma speaks, Indra speaks.
//            The Gopis and Krishna speak.
//            Shiva speaks, the Siddhas speak.
//            The many created Buddhas speak.
//            The demons speak, the demi-gods speak.
//            The spiritual warriors, the heavenly beings, the silent sages, the humble and serviceful speak.
//            Many speak and try to describe Him.
//            Many have spoken of Him over and over again, and have then arisen and departed.
//            If He were to create as many again as there already are,
//            Even then, they could not describe Him.
//            He is as Great as He wishes to be.
//            O Nanak, the True Lord knows.
//            If anyone presumes to describe God,
//            He shall be known as the greatest fool of fools! ||26||
//            Where is that Gate, and where is that Dwelling, in which You sit and take care of all?
//            The Sound-current of the Naad vibrates there, and countless musicians play on all sorts of instruments there.
//            So many Ragas, so many musicians singing there.
//            The praanic wind, water and fire sing; the Righteous Judge of Dharma sings at Your Door.
//            Chitr and Gupt, the angels of the conscious and the subconscious who record actions, and the Righteous Judge of Dharma who judges this record sing.
//            Shiva, Brahma and the Goddess of Beauty, ever adorned, sing.
//            Indra, seated upon His Throne, sings with the deities at Your Door.
//            The Siddhas in Samaadhi sing; the Saadhus sing in contemplation.
//            The celibates, the fanatics, the peacefully accepting and the fearless warriors sing.
//            The Pandits, the religious scholars who recite the Vedas, with the supreme sages of all the ages, sing.
//            The Mohinis, the enchanting heavenly beauties who entice hearts in this world, in paradise, and in the underworld of the subconscious sing.
//            The celestial jewels created by You, and the sixty-eight holy places of pilgrimage sing.
//            The brave and mighty warriors sing; the spiritual heroes and the four sources of creation sing.
//            The planets, solar systems and galaxies, created and arranged by Your Hand, sing.
//            They alone sing, who are pleasing to Your Will. Your devotees are imbued with the Nectar of Your Essence.
//            So many others sing, they do not come to mind. O Nanak, how can I consider them all?
//            That True Lord is True, Forever True, and True is His Name.
//            He is, and shall always be. He shall not depart, even when this Universe which He has created departs.
//            He created the world, with its various colors, species of beings, and the variety of Maya.
//            Having created the creation, He watches over it Himself, by His Greatness.
//            He does whatever He pleases. No order can be issued to Him.
//            He is the King, the King of kings, the Supreme Lord and Master of kings. Nanak remains subject to His Will. ||27||
//            Make contentment your ear-rings, humility your begging bowl, and meditation the ashes you apply to your body.
//            Let the remembrance of death be the patched coat you wear, let the purity of virginity be your way in the world, and let faith in the Lord be your walking stick.
//            See the brotherhood of all mankind as the highest order of Yogis; conquer your own mind, and conquer the world.
//            I bow to Him, I humbly bow.
//            The Primal One, the Pure Light, without beginning, without end. Throughout all the ages, He is One and the Same. ||28||
//            Let spiritual wisdom be your food, and compassion your attendant. The Sound-current of the Naad vibrates in each and every heart.
//            He Himself is the Supreme Master of all; wealth and miraculous spiritual powers, and all other external tastes and pleasures, are all like beads on a string.
//            Union with Him, and separation from Him, come by His Will. We come to receive what is written in our destiny.
//            I bow to Him, I humbly bow.
//            The Primal One, the Pure Light, without beginning, without end. Throughout all the ages, He is One and the Same. ||29||
//            The One Divine Mother conceived and gave birth to the three deities.
//            One, the Creator of the World; One, the Sustainer; and One, the Destroyer.
//            He makes things happen according to the Pleasure of His Will. Such is His Celestial Order.
//            He watches over all, but none see Him. How wonderful this is!
//            I bow to Him, I humbly bow.
//            The Primal One, the Pure Light, without beginning, without end. Throughout all the ages, He is One and the Same. ||30||
//            On world after world are His Seats of Authority and His Storehouses.
//            Whatever was put into them, was put there once and for all.
//            Having created the creation, the Creator Lord watches over it.
//            O Nanak, True is the Creation of the True Lord.
//            I bow to Him, I humbly bow.
//            The Primal One, the Pure Light, without beginning, without end. Throughout all the ages, He is One and the Same. ||31||
//            If I had 100,000 tongues, and these were then multiplied twenty times more, with each tongue,
//            I would repeat, hundreds of thousands of times, the Name of the One, the Lord of the Universe.
//            Along this path to our Husband Lord, we climb the steps of the ladder, and come to merge with Him.
//            Hearing of the etheric realms, even worms long to come back home.
//            O Nanak, by His Grace He is obtained. False are the boastings of the false. ||32||
//            No power to speak, no power to keep silent.
//            No power to beg, no power to give.
//            No power to live, no power to die.
//            No power to rule, with wealth and occult mental powers.
//            No power to gain intuitive understanding, spiritual wisdom and meditation.
//            No power to find the way to escape from the world.
//            He alone has the Power in His Hands. He watches over all.
//            O Nanak, no one is high or low. ||33||
//            Nights, days, weeks and seasons;
//            Wind, water, fire and the nether regions
//            In the midst of these, He established the earth as a home for Dharma.
//            Upon it, He placed the various species of beings.
//            Their names are uncounted and endless.
//            By their deeds and their actions, they shall be judged.
//            God Himself is True, and True is His Court.
//            There, in perfect grace and ease, sit the self-elect, the self-realized Saints.
//            They receive the Mark of Grace from the Merciful Lord.
//            The ripe and the unripe, the good and the bad, shall there be judged.
//            O Nanak, when you go home, you will see this. ||34||
//            This is righteous living in the realm of Dharma.
//            And now we speak of the realm of spiritual wisdom.
//            So many winds, waters and fires; so many Krishnas and Shivas.
//            So many Brahmas, fashioning forms of great beauty, adorned and dressed in many colors.
//            So many worlds and lands for working out karma. So very many lessons to be learned!
//            So many Indras, so many moons and suns, so many worlds and lands.
//            So many Siddhas and Buddhas, so many Yogic masters. So many goddesses of various kinds.
//            So many demi-gods and demons, so many silent sages. So many oceans of jewels.
//            So many ways of life, so many languages. So many dynasties of rulers.
//            So many intuitive people, so many selfless servants. O Nanak, His limit has no limit! ||35||
//            In the realm of wisdom, spiritual wisdom reigns supreme.
//            The Sound-current of the Naad vibrates there, amidst the sounds and the sights of bliss.
//            In the realm of humility, the Word is Beauty.
//            Forms of incomparable beauty are fashioned there.
//            These things cannot be described.
//            One who tries to speak of these shall regret the attempt.
//            The intuitive consciousness, intellect and understanding of the mind are shaped there.
//            The consciousness of the spiritual warriors and the Siddhas, the beings of spiritual perfection, are shaped there. ||36||
//            In the realm of karma, the Word is Power.
//            No one else dwells there,
//            Except the warriors of great power, the spiritual heroes.
//            They are totally fulfilled, imbued with the Lord's Essence.
//            Myriads of Sitas are there, cool and calm in their majestic glory.
//            Their beauty cannot be described.
//            Neither death nor deception comes to those,
//            Within whose minds the Lord abides.
//            The devotees of many worlds dwell there.
//            They celebrate; their minds are imbued with the True Lord.
//            In the realm of Truth, the Formless Lord abides.
//            Having created the creation, He watches over it. By His Glance of Grace, He bestows happiness.
//            There are planets, solar systems and galaxies.
//            If one speaks of them, there is no limit, no end.
//            There are worlds upon worlds of His Creation.
//            As He commands, so they exist.
//            He watches over all, and contemplating the creation, He rejoices.
//            O Nanak, to describe this is as hard as steel! ||37||
//            Let self-control be the furnace, and patience the goldsmith.
//            Let understanding be the anvil, and spiritual wisdom the tools.
//            With the Fear of God as the bellows, fan the flames of tapa, the body's inner heat.
//            In the crucible of love, melt the Nectar of the Name,
//            And mint the True Coin of the Shabad, the Word of God.
//            Such is the karma of those upon whom He has cast His Glance of Grace.
//            O Nanak, the Merciful Lord, by His Grace, uplifts and exalts them. ||38||
//            Shalok:
//            Air is the Guru, Water is the Father, and Earth is the Great Mother of all.
//            Day and night are the two nurses, in whose lap all the world is at play.
//            Good deeds and bad deeds-the record is read out in the Presence of the Lord of Dharma.
//            According to their own actions, some are drawn closer, and some are driven farther away.
//            Those who have meditated on the Naam, the Name of the Lord, and departed after having worked by the sweat of their brows
//            -O Nanak, their faces are radiant in the Court of the Lord, and many are saved along with them! ||1||"
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
