# Pathway
Pathway is a user-friendly web application designed to empower your immigration journey.  From feeling overwhelmed to becoming organized, Pathway helps you manage immigration documents for yourself and your family.  Unravel complex regulations with clear and concise summaries.  Stay ahead of deadlines with a integrated calendar and reminder system.  Navigate the immigration process with confidence - Pathway is your one-stop shop for a smooth and organized journey.

## Table of Contents
- [Main Features](#main-features)
- [Technologies & Services Used](#technologies--services-used)
- [Configuration](#configuration)
- [Installation](#installation)
- [Contribution Guidelines](#contribution-guidelines)
- [FAQ](#faq)


## Main Features
#### **USCIS Forms Directory**
Access a minimal directory of all USCIS forms with a user-friendly interface that simplifies searching and navigating through the forms.

https://github.com/user-attachments/assets/90144c48-7c99-46f4-996b-7e681d52d523


#### **Family Member Profiles**
Create and manage individual profiles for your family members. Each profile allows you to store and organize essential information related to their immigration process.

https://github.com/user-attachments/assets/75ec088f-6092-49fd-abc1-e6d666c717cd


#### **Profile Notes and Upload Documents**
Add and keep detailed notes within each family member's profile to track important information, updates, or reminders.


https://github.com/user-attachments/assets/5eef8303-d812-441d-b321-1837a4c7d122


#### **Reminder System**
Set reminders for critical dates or actions, and receive email notifications at specified times to ensure you never miss an important deadline.


https://github.com/user-attachments/assets/74097596-38aa-49ed-b2d7-871bb296723b



## Technologies & Services Used
- Rails 7
- Bootstrap 5
- Simple Calendar Gem
- AWS S3

## Configuration
To configure your application to use AWS S3 and OpenAI API services, follow these detailed steps:

1. Generate a Master Key If you do not already have a master.key file, you can generate one by running:

``` 
EDITOR="code --wait" rails credentials:edit
```

This command will open the credentials file in Visual Studio Code (replace "code --wait" with your preferred editor), and a new master.key file will be generated automatically if it does not exist.

2. Add Service API Tokens Inside the opened credentials file, add your API tokens and other sensitive configuration variables in a structured format. For example:
```
aws:
  access_key_id: YOUR_AWS_ACCESS_KEY_ID
  secret_access_key: YOUR_AWS_SECRET_ACCESS_KEY
```
  
Save and close the file. The changes will be encrypted and saved securely, accessible only via the master.key.

3. Ensure the Security of the Master Key Never commit your master.key or the credentials file to version control. Add the master.key to your .gitignore file to prevent it from being accidentally pushed to your repository:

```
echo 'config/master.key' >> .gitignore
```

## Installation

### Current Main Branch:
- bundle install
- rails db:migratet
- rake sample_data
- bin/dev

After running the above commands, sign in with: 
- Email: hiro@example.com
- Password: password


## Entity Relationship Diagram
![ERD DOMAIN MODEL](https://i.imghippo.com/files/c90Pp1723301409.png)


## Contribution Guidelines
### Introduction
Thank you for your interest in contributing to Pathway. This document provides guidelines and instructions on how to contribute to the project.

### How to Contribute
1. Setup your environment: Follow the installation instructions above.
2. Find an issue to work on: In the Projects tab, check out our issues.
   
### Coding Conventions
We adhere to the Ruby community style guide, and we expect all contributors to follow suit. Here are key conventions specific to our project:

- Code Style: Follow the [Ruby Style Guide](https://rubystyle.guide/), which provides detailed guidelines on the coding style preferred by the Ruby community.

- Naming Conventions:
    - Use `snake_case` for variables, methods, and file names.
    - Use `PascalCase` for class and module names.
    - Reflect domain concepts accurately in naming.

- Design Principles: Focus on Domain-Driven Design (DDD):

    - Organize code to reflect the domain model clearly.
    - Use service objects, decorators, and other design patterns that help isolate domain logic from application logic.
- Testing Conventions:
    - Write tests for all new features and bug fixes.
    - Use RSpec for testing, adhering to the RSpec Style Guide.
    - Ensure test names clearly describe their purpose, reflecting domain-specific terminology.

## Comments and Documentation
- Comment your code where necessary to explain "why" something is done, not "what" is done—source code should be self-explanatory regarding the "what".
- Document methods and classes thoroughly, focusing on their roles within the domain model, especially for public APIs.
## Version Control Practices
Commit messages should be clear and follow best practices, such as those outlined in How to Write a Git Commit Message.
Keep commits focused on a single issue to simplify future maintenance and troubleshooting.
## Branch Naming Conventions
Please use the following naming conventions for your branches:
- <issue#-description> (i.e 31-added-ransack-search)
## Pull Request Process
1. Creating a Pull Request: Provide a detailed PR description, referencing the issue it addresses.
2. Review Process: PRs require review from at least one maintainer.

## Community and Communication
Join our [Discord] to communicate with other contributors and maintainers.

## Acknowledgment of Contributors
Thank you for contributing to Pathway!


## FAQ

### AWS S3 Bucket Setup
  - To setup your AWS S3 bucket, sign up for an account by clicking the link below:
      - [Sign Up for AWS](https://aws.amazon.com/)
- Set up guide:
    - [AWS S3 Bucket & IAM User Setup Guide](https://medium.com/@emmanuelnwright/create-iam-users-and-s3-buckets-in-aws-264e78281f7f)
 
### Master Key Errors
- Be sure to follow the [Configuration](#configuration) Instructions if you encounter an issue when setting up the project.

### Ruby Version Errors
- The project is written using Ruby 3.2.1, if you encounter issues upon cloning, make sure you have Ruby version 3.2.1 in your environment.
  

