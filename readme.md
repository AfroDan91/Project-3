# Spring App - Pet Clinic 

## Contents
* [Introduction](#introduction)
* [In the Beginning](#in-the-beginning)
  * [Project Planning](#project-planning)
  * [Conventions/Protocols](#conventions/protocols)
* [The Work](#the-work)
  * [App](#App)
  * [Pipeline](#pipeline)
    * [Jenkins](#jenkins)
      * [Setup](#1.-setup)
      * [Test](#2.-test)
      * [Building and Pushing](#3.-building-and-pushing)
      * [Terraform and Kubernetes](#4.-terraform-and-kubernetes)
      * [Deploy](#5.-deploy)

# **Introduction**
Design specification:
As a team, design and implement a solution for automating the development workflows and deployments of an unfamiliar application in a restricted timeframe.<br/>
<br/>
The application we were given was a vet clinic web app with separate front and backend infrastructure. This application was written in a mix of Java and TypeScript, two languages that my team and I have little to no experience with. <br/>
<br/>
Our goal was to create a pipeline for continuous development and automated deployment. Utilising the tools, systems and principals we have learned up until now and do it all within a self managed team. <br/>
All of these steps are to recreate a realistic scenario we might face on deployment. <br/>
<br/>
Through this presentation we hope to demonstrate;
- A working knowledge of tools including terraform and kubernetes
- The ability to work effectively on the Azure cloud platform
- The use of Agile and DevOps principles
- The ability to work as a self-managed autonomous team
- An understanding of the importance and use of conventions<br/>
<br/>
<br/>

# **In the Beginning**
As we were given full autonomy on how we approached this task we first took to a teams call to begin planning our approach. <br/>

## **Project Planning** <br/>
We selected Azure DevOps as our project planning tool of choice as it has good integration with other Azure products. We also felt that using Azures project management offering would help provide us with more experience working within the Azure cloud environment. <br/>
<br/>
With a start made and sticking to the Agile ways of working we "elected" a scrum master to lead and manage the organisation of the project tracking side of things. <br/>
Our Kanban board near the end looked like this;<br/>
<br/>
![kanban](https://i.imgur.com/UV9EEef.png)
<br/>
<br/>
Using our board we created 4 columns to categorize our work.<br/>
- Backlog - For things that we decided were not going to be achieved this sprint.
- ToDo - For things needing done, ordered by priority top-bottom.
- Doing -  For things currently being worked on, to avoid multiple people accidently working on the same thing. 
- Done - For completed items, promoting high morale as we can see how far we have come. <br/>

<br/>
This board was our map through the sprint and enabled us to work quickly and efficiently throughout.<br/>
We moved items from column to column as we worked our way through them, putting them back in the ToDo list if encountered an unanticipated blocker and moving on to something else.<br/>
Using this board mean we never had a time where someone had nothing to do or a time where everyone was working on the same thing in error. 
<br/>
<br/>

## Conventions/Protocols <br/>
To more accurately simulate a working environment we established several conventions and protocols to follow.<br/>
Pre-agreed conventions are extremely important when working as part of a group as many people following their own conventions can quickly make a repo or Azure subscription extremely hard to navigate.<br/>
Protocols play their part in keeping the project secure. In an effort to work as close to real life as possible we set up user access rights and restrictions on our accounts to enable safe collusion while still being able to provision resources on each others subscriptions. 
<br/>
<details>
  <summary>Some of the conventions/protocols we used are located here</summary>
  

**Feature Branch Model** <br/>
Some of the advantages of using this model are:
- readability
- traceability 
- accountability

These qualities are were very useful in our project enabling us to all work from the same codebase and repo without adversely affecting one another's work and when things went wrong it was easy to trace them back to the owner for resolution.<br/>
<br/>

**Pull/Merge Restrictions**<br/>
Similar to the feature branch model, this convention helped avoid broken code being merged into working code. <br/>
When ever we  merged something into dev/main it was streamed on teams to the group so we could very quickly resolve any merge conflicts that might break code someone else was working on. <br/>
<br/>

**Git Branch Naming** <br/>
For branch naming we used; <br/>
feature-branchName<br/>
![featurebranchmodel](https://i.imgur.com/uOhNKJB.png)<br/>
Which enabled at a glance recognition of what was/ has been worked on while also not impeding the used of tabbing to auto complete lines for speed.<br/>
<br/>

**Git Commit Message** <br/>
For adding commits to branches we used; <br/>
 "usersInitials: commit message"<br/>
![commit](https://i.imgur.com/5R4gGgk.png)<br/>
Letting us quickly identify to who created the commit. This allows us to get the person responsible to look into it quickly should an issue arise.

</details>
<br/>
<br/>
<br/>

## Spreading The Load
Once we had our scope and decided on how we wanted to do things it was time to divvy up the work. We split ourselves into 2 sub teams. One focusing on getting the application running and the other focusing on the pipeline.<br/>
From there we each selected a task from the board and in scrum fashion quickly discussed what we selected, why and any blockers we anticipate coming up against.<br/>
We did this part as a group to maximise our resources on resolving blockers, as we each have our own prior knowledge and expertise.<br/>
In our sub teams we then used a mixture of individual and peer programming to divide up and make the work easier. Sometimes calling in some of the members of the other group when a blocker was particularly challenging.
<br/>
<br/>
<br/>

# **The Work**
Having the team split in two allowed us to work on both halves of the project simultaneously.<br/>
The two teams consisted of <br/>
Pipeline = Daniel and Ivaylo <br/>
App = Earl and Marius <br/>
We split the teams up in this way to make use of some of the strengths identified in the previous 2 projects and prior knowledge.
<br/>
<br/>

## **App** <br/>


## **Pipeline** <br/>
Work on the pipeline began with drawing up a a CI/CD pipeline diagram. This would serve as a blueprint for the pipeline and allow us to visualise the steps we need to implement.  <br/>
Our Pipeline looked like this; <br/>
<br/>
![pipe](https://imgur.com/kG9eXl5.png)
<br/>
<br/>
With the development section of the board being mainly in the app team's remit The pipeline team first focused on the CI server.
Sticking to the "Don't repeat yourself" DevOps principle We were able to utilise a lot of the frameworks we had used in our previous projects to speed up development of the pipeline significantly. 

## **Jenkins**
The first stage of designing the pipeline to avoid repetition and starting from scratch was to migrate another project which utilises Jenkins and includes fully functional pipeline with GCP. The scripts are designed in a way that easily allows you to adapt another web application which saved us time when planning out what stages the pipeline needs to go through.
When migrating the pipeline form GCP to Azure allowed us to understand how Azure access privelages work and provide access to Jenkins automatically manage things such as Kubernetes Cluster and setting up new VM through Ansible.
So when new content gets pushed on the set .feature-{name} branch, Github will send a notification to Jenkins through a webhook which tells it to run the following pipeline:
### **1. Setup**
Jenkins installs all the dependecies needed to run the development environment on the VM it uses. This means dependecies such as docker, ansible, terraform and ensures all packages are up to date on the VM.
### **2. Test**
The test script will run maven tests to perform all the neccessary test. A coverage report is produced which can be viewed in the console output or .xml files which are used display the results with the help of Cobertura, JUnit and Jacoco plugins in Jenkins.
### **3. Building and Pushing**
Jenkins credential system is used to store login details for the Docker Hub and Databse. These credentials are used to login in DockerHub and with the help of docker-compose new images get built and pushed to the docker repository.
### **4. Terraform and Kubernetes**
Terraform is used to handle several things:
   * Login into Azure to allow access.
   * Create the relavent resource group.
   * Create the kubernetes cluster.
   * Create the virtual machine scaleset, network and subnet.
   * Kubernetes will set the cluster as working space by getting the credentials.
#### **5. Deploy**
Jenkins simply uses Kubernetes to create front-end and back-end services with designed yaml.
<br>
-- maybe include pipeline