//
//  PrivacyPolicyView.swift
//  Online-Groceries
//
//  Created by Subham  on 31/07/24.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    var body: some View {
        ZStack{
            //MARK: back button
            ScrollView{
                VStack{
                    Text("Privacy Policy")
                        .font(.customfont(.bold, fontSize:36))
                        .padding(.top,40)
                    
                    HStack(spacing:0){
                        Text("Last updated in ")
                            .font(.customfont(.medium, fontSize:15))
                        MonthYearView()
                    }
                    
                    SectionView(title:"More Important", content: "This Privacy Policy page also from , now onwards is copied from blinkit and i did it only for testing purpose i donot want to harm their any things or take credit from their team", bulletPoints: ["Thank you for seeing the page 🫶🏻"],number:1)
                    
                    SectionView(title: "Applicability and Scope", content: "This policy applies only to the information Blinkit collects through its Services, in email, text and other electronic communications sent through or in connection with the Services. This policy does not apply to information that you provide to, or that is collected by, any third-party that you use in connection with its Services. Blinkit encourages you to consult directly with such third-parties about their privacy practices.Please read this policy carefully to understand Blinkit's policies and practices regarding your information and how Blinkit will treat it. By accessing or using its Services and/or registering for an account with Blinkit, you agree to this privacy policy and you are consenting to Blinkit's collection, use, disclosure, retention, and protection of your personal information as described here. If you do not provide the information Blinkit requires, Blinkit may not be able to provide all of its Services to you.", bulletPoints: ["the types of information that Blinkit may collect from you directly or through automated means when you access or use its website, application and other online services (collectively, referred as 'Services'); and","its practices for collecting, using, maintaining, protecting and disclosing that information."])
                    
                    SectionView(title: "The information we collect and how we use it", content: "We collect this information directly from you when you provide it to us; indirectly from third-parties (such as social media websites authorised by you); and/or automatically as you navigate through our Services (such as usage details, IP addresses, cookies, web beacons and other tracking technologies).", bulletPoints: [" Information You Provide to Us"," Information We Collect Through Automatic Data Collection Technologies","Information We Collect From Third Parties"])
                    
                    SectionView(title: "How we use the information we collect", content: "We primarily collect your data to provide you the Services that you opt for. Our Services are backed by a wide array of supporting services that directly or indirectly improve the Services offered to you. We use the information we collect from and about you for a variety of purposes, including to:    ", bulletPoints: ["Administer our Services by sharing information with third parties that are used to facilitate the Services, such as delivery partners, service providers and vendors.","Process and respond to your queries and complaints.","Understand our users (what they do on our Services, what features they like, how they use them, etc.), improve the content and features of our Services (such as by personalizing content to your interests), process and complete your transactions, and offer customised deals and other services tailored on the basis of your preferences.","Diagnose technical problems, platform issues and other such diagnostic measures as may be required to offer the Services in a stable and functional manner.","Send you communications that you have requested or that we determine to be of interest to you by way of emails, courier, registered post, telephone calls, SMS, WhatsApp messages or any other mode of communication. This includes customer support and grievance redressal.","Enable us to show you ads that are relevant to you."])
                    
                    SectionView(title: "How we share the information we collect", content: "We use personal information to provide you with the services that you have opted to receive through the use of our platform and services. For facilitation of this, we may disclose personal information that we collect, or you provide, as described in this privacy policy, in the following ways:", bulletPoints: ["To our subsidiaries and affiliates, which are entities under common ownership or control of our ultimate parent company Zomato Limited.","To contractors, sellers, suppliers, advertisers/service providers who are typically bound by contractual obligations to keep personal information confidential and use it only for the purposes for which we disclose it to them.","To an actual or potential buyer or other successor in the event of a merger, divestiture, restructuring, reorganization, dissolution or other sale or transfer of some or all of Blinkit's assets, whether as a going concern or as part of bankruptcy, liquidation or similar proceeding, in which personal information held by Blinkit about the users of our Services are among the assets transferred.","To third-parties, including suppliers, to market their products or services to you if you have consented to receive the promotional updates. We contractually require these third-parties to keep personal information confidential and use it only for the purposes for which we disclose it to them."])
                    
                    SectionView(title: "Contact Us", content: "If you have any queries relating to the processing/ usage of information provided by you or Blinkit's Privacy Policy, you may email the Data Protection Officer (DPO) at privacy@blinkit.com.", bulletPoints:[] )
                }
            }
            VStack{
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width:20,height:20)
                    }
                    .padding(.leading,20+10)
                   Spacer()
                }
                Spacer()
            }
        }.navigationTitle("")
         .navigationBarBackButtonHidden(true)
         .navigationBarHidden(true)
    }
}

#Preview {
    PrivacyPolicyView()
}
