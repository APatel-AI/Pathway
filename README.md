# Pathway
Pathway is a user-friendly web application designed to empower your immigration journey.  From feeling overwhelmed to becoming organized, Pathway helps you manage immigration documents for yourself and your family.  Unravel complex regulations with clear and concise summaries.  Stay ahead of deadlines with a integrated calendar and reminder system.  Navigate the immigration process with confidence - Pathway is your one-stop shop for a smooth and organized journey.

## Table of Contents
- [Core Features](#core-features)
- [Limitations](#limitations)
- [Technologies & Services Used](#technologies--services-used)
- [Configuration](#configuration)
- [Installation](#installation)
- [Contribution Guidelines](#contribution-guidelines)
- [FAQ](#faq)


## Core Features
#### USCIS Forms Directory
Access a comprehensive directory of all USCIS forms with a user-friendly interface that simplifies searching and navigating through the forms.

#### Family Member Profiles
Create and manage individual profiles for your family members. Each profile allows you to store and organize essential information related to their immigration process.

#### Profile Notes
Add and keep detailed notes within each family member's profile to track important information, updates, or reminders.

#### Reminder System
Set reminders for critical dates or actions, and receive email notifications at specified times to ensure you never miss an important deadline.

## Installation Guide

### Steps to Setup
1. **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/pathway.git
    cd pathway
    ```

2. **Install Gems**:
    ```bash
    bundle install
    ```

3. **Set Up the Database**:
    - Create and migrate the database:
    ```bash
    rails db:create
    rails db:migrate
    ```
4. **Run the Server**:
    ```bash
    rails server
    ```

5. **Access the Application**:
    - Visit `http://localhost:3000` in your web browser.
## Configuration

### To configure the application to use AWS S3 services, follow these detailed steps:
## **1. Generate a Master Key If you do not already have a master.key file**
- **Generate the `master.key`**:
  - If your project requires encrypted credentials, Rails generates a `master.key` file during the initial setup. This file is essential for decrypting your `config/credentials.yml.enc` file, which contains sensitive information.
  - If you don't have a `master.key`, you can generate one with:
    ```bash
    EDITOR="code --wait" rails credentials:edit
    ```
    This command will create both the `master.key` and `config/credentials.yml.enc` if they don't exist.
  
- **Store the `master.key` Securely**:
  - Ensure it's listed in your `.gitignore` file to prevent accidental commits.
  - You can add the following line to your `.gitignore`:
    ```
    /config/master.key
    ```

## **2. AWS S3 Configuration**
- **Setting Up AWS Credentials**:
  - Ensure you have your AWS credentials stored securely. These credentials are needed to access your S3 bucket where image are stored.
  - Add the following AWS-related environment variables to your `.env` file (you might need to create this file if it doesn’t exist):
    ```bash
    AWS_ACCESS_KEY_ID=your_access_key_id
    AWS_SECRET_ACCESS_KEY=your_secret_access_key
    AWS_REGION=your_region
    S3_BUCKET_NAME=your_bucket_name
    ```
  
- **Updating `storage.yml`**:
  - Ensure your `config/storage.yml` file is correctly configured for AWS S3:
    ```yaml
    amazon:
      service: S3
      access_key_id: <%= ENV['AWS_ACCESS_KEY_ID'] %>
      secret_access_key: <%= ENV['AWS_SECRET_ACCESS_KEY'] %>
      region: <%= ENV['AWS_REGION'] %>
      bucket: <%= ENV['S3_BUCKET_NAME'] %>
    ```
    

### **3. Environment Variables**
- **Setting Up `.env` File**:
  - To keep your environment variables organized and secure, create a `.env` file in the root directory of your project:
    ```bash
    touch .env
    ```
    Ensure this file is added to your `.gitignore`:
    ```
    .env
    ```

- **Essential Environment Variables**:
  - Ensure the following variables are set in your `.env` file:
    ```bash
    SECRET_KEY_BASE=your_secret_key_base
    DEVISE_SECRET_KEY=your_devise_secret_key
    AWS_ACCESS_KEY_ID=your_access_key_id
    AWS_SECRET_ACCESS_KEY=your_secret_access_key
    AWS_REGION=your_region
    S3_BUCKET_NAME=your_bucket_name
    DATABASE_USERNAME=your_db_username
    DATABASE_PASSWORD=your_db_password
    ```

- **Generating `SECRET_KEY_BASE` and `DEVISE_SECRET_KEY`**:
  - If you don't have a `SECRET_KEY_BASE` or `DEVISE_SECRET_KEY`, you can generate them using:
    ```bash
    rails secret
    ```
    Use the output as the value for these keys in your `.env` file.


## 5. Entity Relationship Diagram
![ERD DOMAIN MODEL](https://i.imghippo.com/files/c90Pp1723301409.png)

## 6. Troubleshooting

- **Database Connection Issues**:
  - Ensure that PostgreSQL is running and the database configurations in `database.yml` are correct.
  
- **AWS S3 Issues**:
  - Double-check your AWS credentials and ensure that your S3 bucket is correctly configured.
  
- **Missing Migrations**:
  - Run `rails db:migrate` if you encounter any database-related errors.
  
- **JavaScript/CSS Not Loading**:
  - Make sure assets are compiled by running:
    ```bash
    rails assets:precompile
    ```

- **Port Already in Use**:
  - If you encounter an error related to the port being in use, either stop the running process using the port or change the port by running:
    ```bash
    rails server -p 3001
    ```
