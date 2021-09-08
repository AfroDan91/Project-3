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
![kanban]()
<br/>
<br/>
Using our board we created 4 columns to categorize our work.<br/>
- Backlog - For things that we decided were not going to be achieved this sprint.
- ToDo - For things needing done, ordered by priority top-bottom.
- Doing -  For things currently being worked on, to avoid multiple people accidently working on the same thing. 
- Done - For completed items, promoting high morale as we can see how far we have come. <br/>

<br/>
This board was our map through the sprint and enabled us to work quickly and efficiently throughout.<br/>
<br/>

## **Conventions** <br/>

To more accurately simulate a working environment we established several conventions to follow.<br/>
Conventions are extremely important when working as part of a group as many people following their own conventions can quickly make a repo or Azure subscription extremely hard to navigate.<br/>
<br/>
<details>
  <summary>Some of the conventions we used are located here</summary>
  

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
![featurebranchmodel]()<br/>
Which enabled at a glance recognition of what was/ has been worked on while also not impeding the used of tabbing to auto complete lines for speed.<br/>
<br/>

**Git Commit Message** <br/>
For adding commits to branches we used; <br/>
 "usersInitials: commit message"<br/>
![commit]()<br/>
Letting us quickly identify to who created the commit. This allows us to get the person responsible to look into it quickly should an issue arise.

</details>
<br/>
<br/>
<br/>

## **Spreading The Load**
Once we had our scope and decided on how we wanted to do things it was time to divvy up the work. We split ourselves into 2 sub teams. One focusing on getting the application running and the other focusing on the pipeline.<br/>
From there we each selected a task from the board and in scrum fashion quickly discussed what we selected, why and any blockers we anticipate coming up against. <br/>
We did this part as a group to maximise our resources on resolving blockers, as we each have our own prior knowledge and expertise.