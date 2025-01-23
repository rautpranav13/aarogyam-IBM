# Aarogyam IBM Project - README

## Project Overview

## **HealthCompanion AI** is a comprehensive AI-powered solution designed to assist individuals in managing their health and medical information. Using IBM [Watsonx.ai](http://Watsonx.ai) Studio, Watsonx.assistant, and other advanced IBM Cloud technologies, the solution provides personalized health insights, medication reminders, first-aid guidance, and medical report understanding. Delivered via a mobile application built on Flutter, HealthCompanion AI empowers users to take control of their health with tailored recommendations.

## Features

- **Conversational Intelligence**: Leverage IBM Watsonx Assistant for real-time, AI-driven conversations to help users with medical queries.
- **Medication Reminders**: Stay on track with medication schedules using intelligent reminders and notifications.
- **Medical Report Understanding**: AI tools help users understand complex medical reports, ensuring better clarity on health conditions.
- **Personalized Health Insights**: Recommendations powered by AI/ML models, such as Pixtral-12B and IBM-Granite-12B, based on user data.
- **First-Aid Guidance**: Quick access to first-aid procedures through voice and text-based guidance.

----

## Tech Stack

- **IBM Cloud Services**: Core platform for hosting AI models, databases, and integration services.
- **Flutter**: Cross-platform mobile application development for iOS and Android.
- **AI/ML Models**:
   - **Pixtral-12B**: For advanced natural language processing tasks.
   - **IBM-Granite-12B**: For in-depth healthcare recommendations and insights.
- [**Watsonx.ai**](http://Watsonx.ai) **Studio**: For building and training the AI models and creating conversational experiences.
- **Watsonx Assistant**: For AI-powered chat-based interaction with users.
- **Cloudant Database**: NoSQL database for efficient and scalable data storage.
- **DB2**: Relational database for structured health data management.
- **AutoAI**: Automates the process of building machine learning models for personalized health recommendations.
- **IBM Text-to-Speech**: For converting text-based content into natural speech.
- **IBM Speech-to-Text**: For converting voice inputs into text for easy user interaction.

----

## Setup Instructions

### Prerequisites

1. **IBM Cloud Account**: Create an IBM Cloud account [here](https://cloud.ibm.com).
2. **Flutter SDK**: Ensure you have Flutter SDK installed. Follow the installation guide here.
3. **IBM Cloud CLI**: Install the IBM Cloud CLI from here.
4. **Database Setup**:
   - Create a Cloudant Database and DB2 instance on IBM Cloud.
   - Configure database access credentials for the app.

----

### Installation

1. **Clone the Repository**:

`git clone` [`https://github.com/rautpranav13/aarogyam-IBM.git`](https://github.com/yourusername/HealthCompanionAI.git)

`cd aarogyam-IBM`

2. **Install Flutter Dependencies**:

`flutter pub get`

3. **IBM Cloud Service Configuration**:
   - Deploy [Watsonx.ai](http://Watsonx.ai) Studio and Watsonx Assistant on IBM Cloud.
   - Set up AutoAI models for personalized health insights.
   - Ensure Watson services (Speech-to-Text, Text-to-Speech, etc.) are enabled on IBM Cloud and integrated into the app.
4. **Configure Environment Variables**:
   - Set up your API keys and service credentials (for Watsonx, Cloudant, DB2, etc.) in a `.env` file or your Flutter app’s configuration.
   - Example:

`IBM_WATSONX_API_KEY=your_api_key_here`

`IBM_CLOUDANT_URL=your_cloudant_url_here`

`IBM_DB2_URL=your_db2_url_here``

5. **Run the Application**:

`flutter run`

----

## API Integration

The mobile app interacts with various IBM Cloud services via REST APIs. Here’s an overview of key endpoints:

- **/api/assistant** (POST): Use Watsonx Assistant to handle medical queries.
- **/api/medications** (GET, POST): Get, set, and update medication reminders.
- **/api/reports** (GET): Fetch and parse medical reports using Watson's NLP capabilities.
- **/api/recommendations** (GET): Get personalized health insights powered by AutoAI and Pixtral-12B.

----

## Key Functionalities

### 1. **Medical Query Handling**:

The app leverages Watsonx Assistant to respond to medical questions, provide information on symptoms, and assist with understanding health-related queries.

### 2. **Medication Management**:

Users can set reminders for medication schedules. The app will send notifications and keep a record of the user’s medications.

### 3. **First-Aid Guidance**:

Using IBM Text-to-Speech, users can get instant verbal guidance on how to perform first-aid measures in emergency situations.

### 4. **Health Insights and Recommendations**:

The app uses AutoAI to analyze user health data and provide personalized health recommendations. It can adapt to a user’s medical history and preferences to offer targeted advice.

### 5. **Medical Report Understanding**:

## Users can upload medical reports, and the app will process them using IBM Watson’s natural language processing tools, helping users better understand complex medical terminology and results.

## Deployment

1. **Mobile App Deployment**:
   - Build the app using Flutter for iOS or Android.
   - Ensure the app is connected to the IBM Cloud services for real-time interaction with Watsonx Assistant, AutoAI, etc.
2. **Cloud Deployment**:
   - Deploy AI models, databases, and Watson services to IBM Cloud.
   - Ensure all endpoints are secured with API keys.

----

## Contributing

Feel free to fork this repository and submit pull requests. Please ensure that your code adheres to the following guidelines:

- Follow standard Flutter code conventions.
- Keep your commits well-documented and focused on one feature or bug fix.
- Add unit and integration tests for any new features or changes.

----

## Acknowledgments

- **IBM Cloud** for providing the cloud infrastructure and Watson services.
- **Flutter** for enabling cross-platform mobile app development.
- **Pixtral-12B** and **IBM-Granite-12B** for cutting-edge AI/ML-powered health insights.

