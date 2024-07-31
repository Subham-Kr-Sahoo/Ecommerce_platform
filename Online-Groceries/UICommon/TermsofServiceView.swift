//
//  TermsofServiceView.swift
//  Online-Groceries
//
//  Created by Subham  on 31/07/24.
//

import SwiftUI

struct TermsofServiceView: View {
    @Environment (\.presentationMode) var mode : Binding<PresentationMode>
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Text("Terms of Service")
                        .font(.customfont(.bold, fontSize:36))
                        .padding(.top,40)
                    
                    HStack(spacing:0){
                        Text("Last updated in ")
                            .font(.customfont(.medium, fontSize:15))
                        MonthYearView()
                    }
                    
                    SectionView(title:"More Important", content: "This term and condition page from now onwards is copied from blinkit and i did it only for testing purpose i donot want to harm their any things or take credit from their team", bulletPoints: ["Thank you for seeing the page 🫶🏻"],number:1 )
                    
                    SectionView(title: "Acceptance of terms",
                                content: "Welcome to Necter ('we,' 'our,' or 'us').The terms ‘visitor(s)’, ‘user(s)’, ‘you’, ‘your’, ‘customer(s)’ hereunder refer to the person visiting, accessing, viewing, browsing through and/or using the Necter Platform at any point in time.",
                                bulletPoints: ["These Terms are intended to make you aware of your legal rights and responsibilities with respect to your access to and use of the Necter's mobile or software applications including but not limited to the services offered by Necter via the Blinkit Platform."])
                    
                    SectionView(title: "Services overview",
                                content:"Necter provides a platform for users to order groceries and related products from local stores, with delivery options available. Users can browse a wide range of products, select items for purchase, and choose a delivery time slot. Our aim is to offer a convenient, efficient, and reliable grocery shopping experience.",
                                bulletPoints: ["Blinkit Platform is a platform for consumers to transact with third party sellers, who offering products/services for sale through the Blinkit Platform. For abundant clarity, Blinkit does not provide any services to users other than providing the Blinkit Platform as a platform to transact at their own cost and risk, and other services as may be specifically notified in writing. Services on the Blinkit Platform are available to only select geographies in India.","Blinkit is not and cannot be a party to any transaction between you and the third party sellers, or have any control, involvement or influence over the products purchased/services availed by you from such third party sellers (including the prices of such products/services charged by such third-party sellers). Blinkit therefore disclaims all warranties and liabilities associated with any products/services offered on the Blinkit Platform."])
                    
                    SectionView(title: "Eligibility",
                                content:"You must be at least 18 years old to use our Services. By using our Services, you represent and warrant that you are at least 18 years old and have the legal capacity to enter into these Terms.",
                                bulletPoints: ["Persons who are “incompetent to contract” within the meaning of the Indian Contract Act, 1872 including minors, undischarged insolvent etc. are not eligible to use/access the Blinkit Platform. However, if you are a minor, i.e. under the age of 18 years, you may use/access the Blinkit Platform under the supervision of an adult parent or legal guardian “competent to contract” who agrees to be bound by these Terms. You are however prohibited (even under supervision) from purchasing any product(s) which is for adult consumption or the sale of which to minors is prohibited, including any tobacco products.","Blinkit Platform is intended to be a platform for end-consumers desirous of purchasing product(s)/availing services for domestic self-consumption. If you are a retailer, institution, wholesaler or any other business user, you are not eligible to use the Blinkit Platform.","In order to determine compliance with eligibility criteria, Blinkit uses inter alia algorithms and/or pre-determined criteria-based technology and accordingly, from time to time, your usage may be restricted or blocked on account of overlap with such algorithms/pre-determined criteria. In such cases, if you are a genuine user of the Blinkit Platform, please contact us for assistance."])
                    
                    SectionView(title: "Advertising",
                                content:"As part of the advertising/ marketing/ visibility campaigns, brands/ advertisers / sponsors may run banner contests/ sampling schemes/ contests/ other such promotional campaigns on/ via the Blinkit Platform. Notwithstanding anything to the contrary, You agree that to the fullest extent permitted under law, Blinkit shall not have any liability in relation to such campaigns (including contests/ contest rewards), which shall be a bipartite arrangement between you and the brands/ advertisers / sponsors, including with respect to fulfilment of obligations as specified thereunder. Participation in such campaigns and/ or availing services pursuant to such campaigns shall be at your own risk and additionally, be governed by the terms and conditions of the campaigns and of the relevant brands/ advertisers / sponsors. Blinkit makes no representation or warranty of any kind, either express or implied, with respect to the campaigns (including contest / contest rewards). The brand/ advertiser/ sponsor shall be solely responsible for fulfilment thereto.",
                                bulletPoints: ["For any information related to a charitable campaign ('Charitable Campaign') sent to customers and/or displayed on the Blinkit Platform where customers have an option to donate money by way of (a) payment on a third party website; or (b) depositing funds to a third party bank account, Blinkit is not involved in any manner in the collection or utilisation of funds collected pursuant to the Charitable Campaign. Blinkit does not accept any responsibility or liability for the accuracy, completeness, legality or reliability of any information related to the Charitable Campaign. Information related to the Charitable Campaign is displayed for informational purposes only and the customers are advised to do an independent verification before taking any action in this regard.",
                                "Part of the website may contain advertising information or promotional material or other material submitted to Blinkit by third parties/ brands or customers. Responsibility for ensuring that material submitted for inclusion on the Blinkit Platform complies with applicable international and national law is exclusively on the party providing the information/material. Your correspondence or business dealings with, or participation in promotions of, advertisers (other than Blinkit) found on or through the Blinkit Platform, including payment and delivery of related goods or services, and any other terms, conditions, warranties or representations associated with such dealings, shall be solely between you and such advertiser. Blinkit will not be responsible or liable for any error or omission, inaccuracy in advertising material or any loss or damage of any sort incurred as a result of any such dealings or as a result of the presence of such other advertiser(s) on the Blinkit Platform."])
                    
                    SectionView(title: "Disclaimers",
                                content:"You acknowledge and undertake that you are accessing the Services on the Blinkit Platform and transacting at your own risk and are using your best and prudent judgement before entering into any transactions. Blinkit makes best efforts to display available products, including in respect of their colour, size, shape and appearance, as accurately as possible. However, as the same are representative, the actual color, size, shape and appearance may have variations from the depiction on your mobile/computer/ display screen.",
                                bulletPoints: ["Blinkit does not make any representation or warranties in respect of the products available on the Blinkit Platform nor does Blinkit implicitly or explicitly support or endorse the sale or purchase of any products on the Blinkit Platform. Blinkit accepts no liability for any error, inaccuracy or omission of third parties or for information/inputs received from third parties and provided to you through the Blinkit Platform or otherwise.",
                                "You acknowledge and agree that Blinkit shall not, at any time, have any ownership, control, and/or title to any product(s), which is subject to a bipartite sale and purchase contract between you and the relevant third party seller. Blinkit does not have any control over the quality, failure to provide or any other aspect whatsoever of the product(s) and is not responsible for damages or delays on account of products which are out of stock or unavailable."])
                    
                    SectionView(title: "Delivery Partners",
                                content:"We strive to deliver your groceries within the selected delivery window. However, delivery times are estimates and are not guaranteed. We are not responsible for any delays caused by factors beyond our control, such as weather conditions, traffic delays, or unforeseen operational issues.",
                                bulletPoints: ["We facilitate delivery of orders placed on the Blinkit Platform through independent contractors, i.e. delivery partners, on a principal-to-principal basis. For abundant clarity, the delivery partners are neither employees nor agents of Blinkit, and they are purely associated with Blinkit as independent service providers on a principal-to-principal basis and are not exclusively bound by Blinkit to provide delivery services at any given point. To clarify, there exists no principal – agent relation between Blinkit and the delivery partner, and as such, Blinkit, in no case whatsoever, can be held liable for the act(s)/ omission(s) of the delivery partner.",
                                "You are expected to respect the dignity and diversity of delivery partners and also enable provision of a secure and fearless gig/ platform work environment for the delivery partners including prevention and deterrence of harassment (including sexual harassment) towards delivery partners. We reserve the right to withhold your access to the Blinkit Platform and otherwise limit your access to the Blinkit Platform at our absolute discretion if you behave with a delivery partner in a manner which is discourteous, disrespectful, or abusive, or which otherwise may be deemed to be inappropriate or unlawful. You are expected to treat all delivery partners with courtesy and respect. The consequences of any such inappropriate action of yours, including claims made/ compensation claimed by any delivery partner, shall be to your account entirely."])
                    
                    SectionView(title: "Reviews, Feedback, Submissions",
                                content:"All reviews, comments, feedback, suggestions, ideas, and other submissions disclosed, submitted or offered on the Blinkit Platform or otherwise disclosed, published, submitted or offered in connection with use of the Blinkit Platform/Services (collectively, the “Comments”) shall be and remain the property of Blinkit. In consideration of availing the Services on the Blinkit Platform and by submitting your Comments, you hereby irrevocably grant Blinkit and its group companies/ affiliates a perpetual, irrevocable, world-wide, non-exclusive, fully paid and royalty-free, assignable, sub-licensable and transferable license and right to use your Comments and all intellectual property rights therein for any purpose including advertisements and marketing. ",
                                bulletPoints: ["Blinkit will be entitled to use, reproduce, disclose, modify, adapt, create derivative works from any Comments, and publish, display and distribute any Comments submitted for any purpose whatsoever without restriction. Blinkit is and shall be under no obligation to: (a) maintain any Comments in confidence; or (b) pay compensation for any Comments or use of any Comments; or (c) respond to any Comments. You agree that any Comments submitted by you on the Blinkit Platform will not violate the Terms or any right of any third party, including copyright, trademark, privacy or other personal or proprietary right(s), and will not cause injury to any person or entity. You further agree that no Comments submitted by you on the Blinkit Platform will be or contain libellous or otherwise unlawful, threatening, abusive or obscene material, or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mails or any form of ‘spam’. Blinkit does reserve the right (but assumes no obligation) to monitor, edit and/or remove any Comments submitted on the Blinkit Platform. You hereby grant Blinkit the right to use names that you submit in connection with any Comments. You agree not to use a false email address, impersonate any person or entity, or otherwise mislead as to the origin of any Comments you submit. You are, and shall remain, responsible for the content of any Comments you make and you agree to indemnify the Blinkit, its group companies, affiliates, and their respective directors, employees, officers, agents and representatives (“Blinkit Parties”) against all claims, loss and liabilities resulting from any Comments you submit.",
                                "Further, any reliance placed on the Comments available on the Blinkit Platform from a third party/ other users shall be at your sole risk and expense."])
                    
                    SectionView(title: "Intellectual Property",
                                content:"Blinkit and/ brand/seller partners (as the case may be) expressly reserve all intellectual property rights in all text, programs, products, processes, technology, images, content and other materials which appear on the Blinkit Platform. Access to or use of the Blinkit Platform does not confer and should not be considered as conferring upon anyone any license, sub-license to any intellectual property rights. All rights, including copyright, in and to the Blinkit Platform are owned by or licensed to Blinkit. Any use of the Blinkit Platform or its contents, including copying or storing it or them in whole or part is prohibited without the express prior written consent of Blinkit.",
                                bulletPoints: ["Blinkit is not responsible for the content of any third-party sites and does not make any representations regarding the content or accuracy of material on such sites. If you decide to access a link of any third-party website and/ or avail any service pursuant to the same, you do so entirely at your own risk and expense.",
                                "Blinkit  respects the intellectual property(ies) of other entities. If you believe that your intellectual property rights have been violated/used in any manner which results in infringement, then please inform us at grievance.officer@blinkit.com","We will evaluate the contents of your notice and will respond within a reasonable period of time. We may take such action as we deem appropriate in keeping with applicable law and our policies, we may also reach out to you for additional details. It may be noted that reporting inaccurate, false or misleading information to Blinkit may result in civil and/or criminal liability."])
                    
                    SectionView(title: "Information Disclosure",
                                content: "To protect against the loss, misuse and alteration of the information under its control, Blinkit has in place appropriate physical, electronic and managerial procedures. For example, Blinkit servers are accessible only to authorized personnel and your information is shared with employees and authorized personnel on a need to know basis to complete the transaction and to provide the services requested by you. Although Blinkit endeavours to safeguard the confidentiality of your personally identifiable information, transmissions made by means of the internet cannot be made fully secure. By using the Blinkit Platform, you agree that Blinkit will have no liability for disclosure of your information due to errors in transmission and/or unauthorized acts of third parties.",
                                bulletPoints: ["Call Recording: All calls between you and us (including between you and the delivery partners) (directly or indirectly through a third party) may be recorded by us or the third party engaged by us. All such calls are recorded including for internal training and quality purposes by us and/or any third party appointed by us. You explicitly agree and permit Blinkit and the third party engaged by Blinkit, to record all the calls/ information provided by you during your telecon and to share it with our authorized personnel / delivery partners.","You also explicitly agree and permit Blinkit to share any data (including call recordings) related to you with its group companies/ affiliates and/or the governmental/ regulatory authorities, if required under any law."])
                    
                    SectionView(title: "Misrepresentation",
                                content: "Blinkit shall assume no responsibility for any communication not authorised by Blinkit with respect to any offers, promotions, housefull sale, etc. This includes, but is not limited to, any fraud or misrepresentation caused by any third-party administrators resulting in loss or injury to the user. Users are cautioned that Blinkit does not run any call centre, and does not make available for communication any landline/mobile number/email ID/social media channel/any other electronic means to its users, except as specifically set out in these Terms and to that end, you are cautioned against unauthorised persons/ fraudsters and imposters claiming to be calling/ answering on Blinkit’s behalf. In case any user wishes to communicate, the user may communicate at the following/email apart from the faster In app Chat option: Email: info@blinkit.com; grievance.officer@blinkit.com Attention: Mr. Dhananjay Shashidharan.",
                                bulletPoints: ["Please note: Blinkit does not solicit confidential information such as OTP/CVV/PIN NUMBER/Card number either through call or mail or any other means, neither will Blinkit ask you to share any sensitive data or information via email or telephone. If you receive any such request by email or telephone, please do not respond/divulge any sensitive data or information. Please do not reveal these details to fraudsters and imposters claiming to be calling on Blinkit’s beh","Please report suspicious activities to info@blinkit.com."])
                    
                    SectionView(title: "Taxes on your Order",
                                content: "In respect of the order placed by you, Blinkit shall issue documents like order summary, tax invoices, etc. as mandated per the applicable law and common business practices. Your order may have following components and corresponding documents:",
                                bulletPoints: ["Supply of goods by third party sellers listed on Blinkit Platform- Tax Invoice cum Bill of Supply issued on behalf of the third party seller;","Supply of services by Blinkit or third party service provider - Tax Invoice issued by Blinkit or third party service provider;"])
                    
                    SectionView(title: "Order Cancellation",
                                content: "You acknowledge that (a) your cancellation, or attempted or purported cancellation of an order or (b) cancellation due to reasons not attributable to Blinkit, shall amount to your breach of the Terms and any such request shall be permitted subject to acceptance of the same by Blinkit. For any permitted cancellations, we will initiate a refund, if any, against the relevant product/ order, which may be in the form of promotional codes/ coupons which shall be available for use against a subsequent invoice for transactions on the Blinkit Platform, in accordance with the specified terms, if any, such as validity period.",
                                bulletPoints: ["Orders may be cancelled by Blinkit in any of the following cases: (a) if it is suspected that a customer has undertaken a fraudulent transaction, or (b) if it is suspected that a customer has undertaken a transaction which does not conform to or violates these Terms, or (c) in case of unavailability of product(s), or (d) for any reason outside the control of Blinkit, including causes for delivery-related logistical difficulties. For such cancellations, Blinkit will initiate a refund, if any, against the relevant product/ order, within approximately 72 hours.  ","Further, Blinkit aims to ensure that specifications and prices of all products / services offered for sale are true and correct. While precautions are taken to ensure accuracy thereof, at times, the specifications / prices may not be current or may be inaccurate on account of technical issues, typographical errors or incorrect product/service information provided to Blinkit by third-party sellers and in such an event, you shall be notified as soon as such error comes to the notice of Blinkit. In each such case, notwithstanding anything to the contrary, Blinkit reserves the right to cancel the order and initiate a refund, if any, against the relevant order/product in the form of credit/ cashback/ coupon/ promotional codes for the value of the relevant product/ order which shall be available for use against a subsequent invoice for transactions on the Blinkit Platform, in accordance with the specified terms, if any, such as validity period.","We reserve the right to deny access to non-complying users / users that appear to be involved in fraudulent transactions at any time or cancel any orders placed by them in future."])
                    
                    SectionView(title: "Returns & Refunds",
                                content: "Products once delivered are non-returnable/ non-replaceable/ non-exchangeable, save and except: (a) if the product is damaged, defective, expired at the time of delivery or incorrectly delivered, and (b) if the return/ exchange policy listed with respect to the relevant product expressly and specifically permits the same – if so, the return/ exchange requests shall be processed in accordance with the terms of the relevant policy, including the specified timelines and conditions. You are requested to read the return policy of each product as available on the Blinkit Platform before raising any request for return/ exchange or refund.",
                                bulletPoints: ["For digital goods, no return/ refund shall apply, and you are required to connect with the relevant seller in case of any issues.","All refunds for permitted returns and permitted cancellations will be processed within 7 working days from the date of return/ cancellation approval of the product subject to satisfactory checks.","Unless otherwise stated and/or as mutually agreed between Blinkit and the Customer, for payments made through electronic means such as debit card, credit card, net banking, UPI, etc., refunds shall be processed in the same manner as they are received or provided in the form of credit/ cashback/ coupon/ promotional code which shall be available for use against a subsequent invoice for transactions on the Blinkit Platform, in accordance with the specified terms, if any, such as validity period. Refund amount in the form of credits will reflect in Your account based on respective banks policies. Provided that, refunds, if any, for products purchased on cash on delivery basis shall be refunded by way of promotional codes only which shall expire after 30 days from the date of issuance. Users can opt-in for a promotional code refund for online payments as well.  Refunds cannot be transferred back to any other payment method once the credit/ cashback/ coupon/ promotional code is initiated. All other promotional codes issued shall expire within 7 days from the date of its issuance.","All refunds shall be made in Indian Rupees only."])
                    
                    SectionView(title: "Printing,Gifting and third party services",
                                content: "The following terms shall be in addition to and not in substitution of or derogation to the other terms governing the use/access of Blinkit Platform.",
                                bulletPoints: ["You agree not to upload any Documents that fall within the parameters of Prohibited Conduct. ",
                                   "You may have to make payment in advance for availing printing services.",
                                   "We reserve the right to change such fees/charges at any time.",
                                   "We reserve the right to share the Document(s) uploaded by the customer for availing printing services with our affiliated/ franchisee stores for printing and delivery purposes.","You may place an order for products to be delivered to someone else as a gift. You agree that the gifting services are available only for certain products as listed on the Blinkit Platform (“Eligible Product(s))”.","You may send a message with the gift order which we will endeavour to deliver, however sometimes, the message can’t be sent. Please refer to the terms on Prohibited Conduct in relation to the quality of such messages.","You acknowledge that Blinkit does not provide any guarantee or warranty and makes no representation whatsoever regarding the third party service provider’s services and the reliability, quality, or suitability thereof."])
                    
                    SectionView(title: "Governing Law & Jurisdiction", content: "These Terms and any dispute or claim arising out of or in connection with them shall be governed by and construed in accordance with the laws of [Your Country/State], without giving effect to any choice or conflict of law provision.", bulletPoints: ["These Terms shall be governed by and construed in accordance with the laws of India, without giving effect to the principles of conflict of laws thereunder.","Courts at New Delhi shall have exclusive jurisdiction over any proceedings arising in respect of these Terms (including Privacy Policy)."])
                    
                    
                    Spacer()
                }
            }
            //MARK: back button
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

struct SectionView: View {
    let title: String
    let content: String
    let bulletPoints: [String]
    var number : Int = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Divider()
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundStyle(number == 1 ? .red : .black)
            
            Text(content)
                .font(.customfont(.medium, fontSize: 14))
                .lineSpacing(4)
                .padding(.horizontal,2)
            
            ForEach(bulletPoints, id: \.self) { point in
                HStack(alignment:.top) {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width:12,height:12)
                    Text(point)
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color.primaryText)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2.5)
                }
            }
        }
        .padding(.horizontal,8)
        .padding(.top,12)
    }
}
#Preview {
    TermsofServiceView()
}
