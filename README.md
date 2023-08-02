# README

### Login Credential

Admin:
   - email: admin@email.com
   - pass: adminpass

User:
   - email: user@email.com
   - pass: userpass

###########################################################

The Job Board will be used by your Users (Job Seekers) to perform the following tasks:

    List Job Posts
    Apply to Jobs

Every User (Job Seeker) will have their own job applications that have statuses that can be checked (seen, not seen). Job Posts are managed by other Users (Admin).

The Job Board app will be used by your Admin User to perform the following tasks:

    Manage A Job Post
    List Job Applications
    List Job Posts

Resource Permission

    Job Seekers are not authorized to manage the Job
    Admin Users are not authorized to destroy job applications and users.
    You can use either the cancancan or pundit gems to do this

Data Storage

    All data should be stored in a relational database, use Sqlite

Users

    Registrations should be done with email and password (Job Seekers)
    There is one Admin account, which will manage Job Posts

    User Registration (Job Seekers only)
    User Login

Job Post data

    Job Post must have: title, description
    Create a new Job Post (Admin)
    Update or delete existing Job Post (Admin)
    List all Job Applications (Admin & Job Seeker)

Job Applications

    Job seekers apply to any job by creating a Job Application that will have a status of (Not Seen) by default
    When an Admin User views a Job Application this will change their status to (Seen)
