import 'package:flutter/material.dart';

  List<String> advices = [
    "Know who your audience is.",
    "Create a story that people connect with.",
    "Use social media to make your brand known.",
    "Share helpful content that people want.",
    "Partner with influencers to reach more people.",
    "Make your website easy to use.",
    "Make things look good to match your brand.",
    "Offer limited-time deals to make people act fast.",
    "Show that others like what you offer.",
    "Talk to customers like you know them.",
    "Look at data to see what works.",
    "Use videos to show what your stuff does.",
    "Make buying online easy and safe.",
    "Send emails to keep people interested.",
    "Keep getting better than your competition.",
    "Team up with other brands for promotion.",
    "Get customers involved in what you do.",
    "Fix problems that bother customers.",
    "Make customers happy to keep them coming back.",
    "Change as people's interests change.",
    "Use chatbots for quick help.",
    "Get customers to bring more customers.",
    "Test different ways to advertise.",
    "Offer a guarantee so customers feel safe.",
    "Tell stories in ads to touch emotions.",
    "Work with smaller influencers for niche groups.",
    "Give a peek before launching something new.",
    "Share useful things to get people's emails.",
    "Ask questions to learn what people like.",
    "Make your website appear in Google searches.",
    "Show ads to people who almost bought.",
    "Try fun stuff like quizzes or polls.",
    "Give discounts to people who follow you.",
    "Keep the same style in all your messages.",
    "Go to events to meet more people.",
    "Share things people can download.",
    "Tell people why your product is special.",
    "Team up with others to do promotions together.",
    "Use good words to show how great your stuff is.",
    "Use timers to show when deals end.",
    "Watch data to know which ads are best.",
    "Reward people who buy from you often.",
    "Teach something new in online classes.",
    "Get people to share their own creations.",
    "Offer more things when people buy.",
    "Use feelings to connect with people.",
    "Talk about how your product helps.",
    "Use limited supply to encourage buying.",
    "Make a plan to share regularly.",
    "Talk with people who like your stuff.",
    "Make headlines that stand out.",
    "Try different web pages to see what works.",
    "Make your website work with voice searches.",
    "Give special deals based on what people like.",
    "Let people try before they buy.",
    "Listen to what people say online.",
    "Make people want what you offer now.",
    "Post often to keep people interested.",
    "Use timers to make offers urgent.",
    "Define your brand's unique voice and message.",
    "Use high-quality images for a professional look.",
    "Connect with industry influencers for wider reach.",
    "Create valuable, shareable blog content.",
    "Run engaging contests and giveaways.",
    "Host interactive Q&A sessions.",
    "Optimize your website for mobile users.",
    "Share behind-the-scenes glimpses of your process.",
    "Send personalized thank-you notes to customers.",
    "Utilize relevant hashtags on social media.",
    "Offer informative ebooks or guides.",
    "Run targeted Facebook ads.",
    "Cross-promote with complementary brands.",
    "Repurpose content for different platforms.",
    "Collaborate with micro-influencers for authenticity.",
    "Provide exceptional customer support.",
    "Create captivating product packaging.",
    "Regularly update your social media profiles.",
    "Use storytelling to connect emotionally.",
    "Offer DIY tutorials related to your products.",
    "Run limited-time flash sales.",
    "Use humor to engage your audience.",
    "Offer free resources like templates or tools.",
    "Highlight user-generated content on your website.",
    "Collaborate with local events for exposure.",
    "Create visually appealing video tutorials.",
    "Optimize product descriptions with SEO.",
    "Conduct customer surveys for feedback.",
    "Use interactive polls to involve customers.",
    "Leverage user-generated reviews and testimonials.",
    "Share user stories and experiences.",
    "Send personalized birthday discounts to customers.",
    "Create a branded hashtag for user-generated content.",
    "Invest in high-quality product photography.",
    "Create product bundles for added value.",
    "Feature customer spotlights on social media.",
    "Run loyalty reward programs for returning customers.",
    "Offer exclusive discounts to email subscribers.",
    "Use bold and consistent branding across channels.",
    "Share product evolution and improvement stories.",
    "Collaborate with local influencers or bloggers.",
    "Showcase customer before-and-after experiences.",
    "Implement a referral program for growth.",
    "Create shareable graphics for social media.",
    "Use explainer videos for complex products.",
    "Regularly post helpful industry tips.",
    "Utilize chatbots for quick customer assistance.",
    "Experiment with interactive quizzes or polls.",
    "Run seasonal promotions and campaigns.",
    "Offer downloadable templates or resources.",
    "Showcase real-life product applications.",
    "Host virtual events like webinars or workshops.",
    "Create a series of behind-the-scenes videos.",
    "Use creative packaging for unboxing experiences.",
    "Run partnerships with relevant charities.",
    "Showcase the making process of your products.",
    "Highlight product versatility through tutorials.",
    "Offer exclusive pre-order opportunities.",
    "Use unique product names and descriptions.",
    "Share fun and relatable team stories.",
    "Use short videos to catch attention.",
    "Use computers to answer customer questions.",
    "Use data to guide each person's journey.",
    "Talk about saving time and effort.",
    "Work with experts in your field.",
    "Make things better from what customers say.",
    "Offer different prices for different needs.",
    "Show how your product solves problems.",
    "Use memories to make people care.",
    "Test where ads work best.",
    "Craft a memorable brand slogan.",
    "Use vibrant visuals for product showcases.",
    "Run Instagram live sessions to connect.",
    "Offer free downloadable product guides.",
    "Collaborate with micro-influencers for authenticity.",
    "Create engaging 'how-to' videos.",
    "Showcase real customer testimonials.",
    "Host online giveaway contests.",
    "Implement a 360-degree product view.",
    "Personalize product recommendations.",
    "Create themed product bundles.",
    "Use playful GIFs in social posts.",
    "Offer limited-time flash sales.",
    "Run polls for product preference.",
    "Highlight user-generated content.",
    "Utilize storytelling in product descriptions.",
    "Host virtual product launch parties.",
    "Share behind-the-scenes product creation.",
    "Run 'Guess the Price' contests.",
    "Create interactive quizzes about your products.",
    "Offer exclusive email subscriber discounts.",
    "Collaborate with local artists for unique designs.",
    "Provide value through informative blog posts.",
    "Use humor in social media captions.",
    "Offer early access to new products.",
    "Implement a refer-a-friend program.",
    "Share fun and relatable customer stories.",
    "Host online workshops related to your products.",
    "Run 'Name Our New Product' campaigns.",
    "Create 'Limited Edition' product lines.",
    "Engage with customers using video replies.",
    "Offer personalized engraving or customization.",
    "Collaborate with eco-friendly influencers.",
    "Use countdown timers for urgency.",
    "Provide virtual product demonstrations.",
    "Highlight surprising product benefits.",
    "Use bold and colorful branding.",
    "Create memorable unboxing experiences.",
    "Share customer 'Before and After' experiences.",
    "Offer exclusive discounts to social media followers.",
    "Host 'Ask Me Anything' sessions.",
    "Utilize creative packaging designs.",
    "Run 'Share Your Setup' photo contests.",
    "Showcase products in everyday life scenarios.",
    "Implement a hassle-free return policy.",
    "Use catchy rhymes or slogans.",
    "Offer free sample products with purchases.",
    "Collaborate with local businesses for cross-promotion.",
    "Use interactive storytelling on your website.",
    "Run 'Caption This' photo contests.",
    "Optimize product images for clarity.",
    "Offer a seamless mobile shopping experience.",
    "Use customer reviews to build trust.",
    "Provide clear product dimensions and specifications.",
    "Implement a user-friendly search feature.",
    "Optimize product pages for fast loading.",
    "Highlight product benefits in bullet points.",
    "Use high-quality videos for product demos.",
    "Offer multiple payment options.",
    "Create a user-friendly checkout process.",
    "Use social proof icons (e.g., 'Best Seller').",
    "Provide real-time customer support.",
    "Offer free shipping for larger orders.",
    "Use scarcity tactics for limited stock items.",
    "Implement a user-friendly navigation menu.",
    "Offer personalized product recommendations.",
    "Use color psychology for product images.",
    "Provide size guides for apparel.",
    "Showcase product versatility through images.",
    "Implement a 'Wishlist' feature.",
    "Use persuasive call-to-action buttons.",
    "Create a visually appealing FAQ section.",
    "Offer easy order tracking for customers.",
    "Implement a responsive design for mobile devices.",
    "Use geo-targeted ads for local customers.",
    "Provide hassle-free returns and exchanges.",
    "Offer bundle discounts for related products.",
    "Implement a loyalty rewards program.",
    "Use exit-intent pop-ups for special offers.",
    "Offer a free gift with certain purchases."
  ];
List<String> imagesList = [
  'assets/brandingimages/1.png',
  'assets/brandingimages/2.png',
  'assets/brandingimages/3.png',
  'assets/brandingimages/4.png',
  'assets/brandingimages/5.png',
  'assets/brandingimages/6.png',
  'assets/brandingimages/7.png',
  'assets/brandingimages/8.png',
  'assets/brandingimages/9.png',
  'assets/brandingimages/10.png',
  'assets/brandingimages/11.png',
  'assets/brandingimages/12.png',
  'assets/brandingimages/13.png',
  'assets/brandingimages/14.png',
  'assets/brandingimages/15.png',
  'assets/brandingimages/16.png',
];
