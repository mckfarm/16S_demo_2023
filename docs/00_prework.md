# 00 Pre work
Review this info prior to starting any scripting or job execution!  

Objectives:
- Determine how microbiome analysis fits into your research questions
- Review exmaples of microbiome analysis
- Prepare to start using Quest

## Microbiome analysis as part of a research project
Prior to starting this pipeline, think through your research questions and how microbiome analysis will fit into your work. This will help you design your sampling approach, recognize limitations of your data or other existing datasets, and recognize what types of end results you are interested in producing. At a minimum, think through the following questions:  

- What kind of microbes (bacteria, archaea, fungi) am I interested in analyzing in my study system? 
- What variables would affect the microbial population? Can I measure or record these variables over time?
- What sampling time scale do I need to satisfy my research objectives? How quickly do I expect the microbial community to change over time?
- What kind of plots or summary data do I want to generate? What kinds of statistical tests make sense to draw conclusions about my hypotheses or research objectives?
- How will I store the raw data and analyzed data in the short and long term? 

You may not know the answers to all of these questions on your own, which is totally normal! After thinking this through, reach out to other group members and George to talk through any muddy points. Your priorities will also change as the project takes shape, so don't feel like you have to stay with a certain approach if it doesn't end up making sense.  

Answering these questions isn't critical to doing this demo, but I cannot emphasize to you enough that you should be thinking through these questions instead of just collecting sequencing data and hoping for the best. 


## What do microbiome analyses look like?
We won't get into much too much depth on analysis approaches in this tutorial. However, you should have a rough idea in mind of what kind of questions you can answer with microbiome data. The easiest way to do this is pay close attention to microbiome analysis results that you see in papers. Whether a figure or result is compelling in answering a research question, or simply visually appealing, having a reference to look back on later is helpful as you start your own work. It is also helpful to make note of what doesn't work and why you think certain results are more or less comprehensible.

I recommend looking at the following papers to get an idea of what you could do with microbiome data (and what is achievable in one research project):  

1. [Seib et al., 2016](https://doi.org/10.1016/j.biortech.2016.05.098). This is a relatively straightforward study that uses 16S sequencing to determine how influent wastewater characteristics impact a bioreactor microbial community. Their data processing techniques are mostly in line with what we will be doing in this demo. 

2. [Zheng et al., 2020](https://pubs.acs.org/doi/10.1021/acs.est.0c04192). This study uses different molecular microbiology techniques to answer questions about a specific functional group (nitrite oxidizing bacteria). I love the simplicity and overall construction of these figures. 

3. [Dueholm et al., 2022](https://www.nature.com/articles/s41467-022-29438-7). This work is impressive and completely unique from a typical study in terms of labor, complexity, and scale. We will not be doing anything to remotely this scale in this demo (or in the lab in general lol), but this is a key paper for anyone working on biological wastewater treatment microbiomes. You don't need to understand most of whats going on at this point, but pay attention to how figures are constructed and how they discuss their findings. 

## Preparing to use pipeline
### Join allocations
Before we get started working with real data, you will need access to Quest. You will not be able to participate in the exercises unless you join the following allocations:

- b1052 (Wells Lab allocation) - join using [this link](https://app.smartsheet.com/b/form/797775d810274db5889b5199c4260328). George is the allocation manager and PI. 

- b1042 (Genomics compute cluster) - join using [this link](https://app.smartsheet.com/b/form/f6e96bd561114be8a33dc778bc00b919). 

### Set up your own project allocation
In addition to the group allocations mentioned above, you may want to work out of your own allocation to keep your files organized how you want and to provide access to people that may not be in our group. You can apply for a Research Allocation I, which provides 1 TB of storage space and plenty of compute time. You can learn more about the allocation type [here](https://www.it.northwestern.edu/departments/it-services-support/research/computing/quest/general-access-allocation-types.html) and apply for the allocation [here]
(https://app.smartsheet.com/b/form/86d88375bd7345439bd391d8184b6ea0). You will need to write a short 1 paragraph summary of how the allocation will be used. 


### Get set up with Quest
Once you get access to at least one allocation, you will need to get familiar with logging into Quest. I would reocmmend doing this through a program on your local computer.

If you are using a PC, I would highly recommend installing the [PuTTY](https://www.putty.org/) ssh client, then set up a session like this: 

![puttysetup](/docs/images/putty.png)

When you open the session, simply type your NetID and password when prompted. 

![puttylogin](/docs/images/puttylogin.png). 

If you are using a Mac, you can simply log into Quest in a terminal window. Search for Terminal, then open the program and sign on using `ssh -X NETID@quest.it.northwestern.edu`.  

You should also download a file managaement system to interface with the Quest file system using a GUI. For Windows, I would recommend [WinSCP](https://winscp.net/eng/index.php). For Mac, I would recommend [FileZilla](https://filezilla-project.org).


### Introduction to Quest video
Once you have your Quest log in situation set up, please watch the [Introduction to Quest video](https://www.youtube.com/watch?v=rIFbHt_2g4s). This video goes over what Quest is, how computing resources are assigned to jobs, and how you do basic navigation and job submissions in the system. *I will assume you watched the video to completion for our first session together.* 



