//
//  CountryModel.swift
//  Countries
//
//  Created by Büşra Güneş on 11.10.2022.
//

import Foundation

struct CountryResponseModel: Codable {
    var data: [Country]?
}

struct Country: Codable {
    var code: String?
    var currencyCodes: [String]?
    var name: String?
    var wikiDataId: String?
}

/*{
 "data": [
 {
 "code": "VA",
 "currencyCodes": [
 "EUR"
 ],
 "name": "Vatican City",
 "wikiDataId": "Q237"
 },
 {
 "code": "ET",
 "currencyCodes": [
 "ETB"
 ],
 "name": "Ethiopia",
 "wikiDataId": "Q115"
 },
 {
 "code": "ME",
 "currencyCodes": [
 "EUR"
 ],
 "name": "Montenegro",
 "wikiDataId": "Q236"
 },
 {
 "code": "NA",
 "currencyCodes": [
 "NAD",
 "ZAR"
 ],
 "name": "Namibia",
 "wikiDataId": "Q1030"
 },
 {
 "code": "GH",
 "currencyCodes": [
 "GHS"
 ],
 "name": "Ghana",
 "wikiDataId": "Q117"
 },
 {
 "code": "SM",
 "currencyCodes": [
 "EUR"
 ],
 "name": "San Marino",
 "wikiDataId": "Q238"
 },
 {
 "code": "NE",
 "currencyCodes": [
 "XOF"
 ],
 "name": "Niger",
 "wikiDataId": "Q1032"
 },
 {
 "code": "MT",
 "currencyCodes": [
 "EUR"
 ],
 "name": "Malta",
 "wikiDataId": "Q233"
 },
 {
 "code": "KZ",
 "currencyCodes": [
 "KZT"
 ],
 "name": "Kazakhstan",
 "wikiDataId": "Q232"
 },
 {
 "code": "KE",
 "currencyCodes": [
 "KES"
 ],
 "name": "Kenya",
 "wikiDataId": "Q114"
 }
 ],
 "links": [
 {
 "rel": "first",
 "href": "/v1/geo/countries?offset=0&limit=10"
 },
 {
 "rel": "next",
 "href": "/v1/geo/countries?offset=10&limit=10"
 },
 {
 "rel": "last",
 "href": "/v1/geo/countries?offset=190&limit=10"
 }
 ],
 "metadata": {
 "currentOffset": 0,
 "totalCount": 199
 }
 }*/
