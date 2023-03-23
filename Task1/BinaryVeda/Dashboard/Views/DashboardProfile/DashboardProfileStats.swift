//
//  DashboardStats.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import SwiftUI

struct DashboardStats: View {
    var userProfile: UserProfileEntity
    
    var followers: String {
        userProfile.followersCount.abbreviateNumber()
    }
    var artowrks: String {
        userProfile.artowrkCount.abbreviateNumber()
    }
    var exhibitions: String {
        userProfile.exhibitionCount.abbreviateNumber()
    }
    var likes: String {
        (
            userProfile.socialInfo?.likesCount ?? 0
        ).abbreviateNumber()
    }
    var views: String {
        (
            userProfile.socialInfo?.viewedCount ?? 0
        ).abbreviateNumber()
    }
    
    var shares: String {
        (
            userProfile.socialInfo?.shareCount ?? 0
        ).abbreviateNumber()
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color(hex: "D8D8D8"))
                .frame(height: 1)
            
            HStack {
                Spacer()
                DashboardStatsItem(data: followers, type: "Followers")
                Spacer()
                DashboardStatsItem(data: artowrks, type: "Artwork")
                Spacer()
                DashboardStatsItem(data: exhibitions, type: "Exibtion")
                Spacer()
            }
//            .padding(.vertical, 10)
            
            Rectangle()
                .fill(Color(hex: "D8D8D8"))
                .frame(height: 1)
            
            HStack(spacing: 20){
                DashboardSocialItem(type: .like, text: likes)
                DashboardSocialItem(type: .view, text: views)
                DashboardSocialItem(type: .share, text: shares)
            }
            .padding(.vertical, 10)
        }
        .padding(.horizontal, .appMargin)
    }
}

struct DashboardStats_Previews: PreviewProvider {
    static var previews: some View {
        DashboardStats(userProfile: .mockUser)
    }
}
