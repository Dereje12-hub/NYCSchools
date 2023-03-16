//
//  SchoolListViewModel.swift
//  NYCSchools
//
//  Created by Dereje Gudeta on 3/16/23.
//

import SwiftUI

class SchoolListViewModel: ObservableObject {
    
    struct SATResults: Hashable {
        static func == (lhs: SATResults, rhs: SATResults) -> Bool {
            lhs.school.dbn == rhs.school.dbn
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(school.dbn)
        }
        
        let school: NYCSchool
        let sat: NYCSAT
        
    }
    
    @Published var navigationPath = NavigationPath()
    
    @Published var isDownloadingSchools = false
    @Published var didFailToDownloadSchools = false
    @Published var schools = [NYCSchool]()
    
    @Published var isDownloadingSATs = false
    @Published var didFailToDownloadSATs = false
    
    var downloadSchoolsTask: Task<Void, Never>?
    var downloadSATsTask: Task<Void, Never>?
    
    
    let application: ApplicationController
    init(application: ApplicationController) {
        self.application = application
        downloadSchools()
    }
    
    func downloadSchools() {
        downloadSchoolsTask?.cancel()
        downloadSchoolsTask = Task {
            await MainActor.run {
                self.isDownloadingSchools = true
                self.didFailToDownloadSchools = false
            }
            do {
                let schools = try await application.network.downloadSchools()
                await MainActor.run {
                    self.schools = schools
                    self.isDownloadingSchools = false
                    self.didFailToDownloadSchools = false
                }
            } catch _ {
                await MainActor.run {
                    self.schools = []
                    self.isDownloadingSchools = false
                    self.didFailToDownloadSchools = true
                }
            }
        }
    }
    
    func selectSchoolIntent(school: NYCSchool) {
        downloadSATsTask?.cancel()
        downloadSATsTask = Task {
            await MainActor.run {
                self.isDownloadingSATs = true
                self.didFailToDownloadSATs = false
            }
            do {
                let satList = try await application.network.downloadSATs(dbn: school.dbn)
                
                guard let sat = satList.first else {
                    await MainActor.run {
                        self.isDownloadingSATs = false
                        self.didFailToDownloadSATs = true
                    }
                    return
                }
                
                let result = SATResults(school: school,
                                        sat: sat)
                await MainActor.run {
                    self.isDownloadingSATs = false
                    self.didFailToDownloadSATs = false
                    self.navigationPath.append(result)
                }
            } catch {
                await MainActor.run {
                    self.isDownloadingSATs = false
                    self.didFailToDownloadSATs = true
                }
            }
        }
    }
    
    
    func schoolName(school: NYCSchool) -> String {
        return school.school_name
    }
    
    func schoolOverviewParagraph(school: NYCSchool) -> String? {
        return school.overview_paragraph
    }
    
    func schoolPhoneNumber(school: NYCSchool) -> String? {
        return school.phone_number
    }
    
    func schoolAddressLine1(school: NYCSchool) -> String? {
        return school.primary_address_line_1
    }
    
    func schoolAddressLine2(school: NYCSchool) -> String? {
        if let city = school.city {
            if let state = school.state_code, let zip = school.zip {
                return "\(city), \(state), \(zip)"
            }
            return "\(city)"
        } else if let state = school.state_code {
            return "\(state)"
        } else if let zip = school.zip {
            return "\(zip)"
        }
        return nil
    }
    
    
    func satMathScore(sat: NYCSAT) -> String? {
        return sat.sat_math_avg_score
    }
    
    func satCriticalReadingScore(sat: NYCSAT) -> String? {
        return sat.sat_critical_reading_avg_score
    }
    
    func satWritingScore(sat: NYCSAT) -> String? {
        return sat.sat_writing_avg_score
    }
    
    
    
}
