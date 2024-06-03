# Splunk Demo Lab  
The following screenshots and descriptions are my experience completeting the [Build a Basic Home Lab](https://www.youtube.com/watch?v=-8X7Ay4YCoA) series by dfir on youtube.
He has been a great resource that I have utilized to learn concepts and tools of cybersecurity *before my formal education* at San Diego State University on various related topics begins in Fall 2024 and through Spring 2025 
- **Fall 2024** (CS470 Unix System Admin, CS480 Operating Systems, CS 579 Wireless Networks, CS576 Networks and Distributed Systems)
- **Spring 2025** (CS 576 Computer Security, CS596 Repeaatable advanced topics (Permanent name and number pending))

##Summary and Purpose: The following information details the creation of a toy reverse shell malware using Metasploit to infect a local virtual machine via a malicous download link. The irregular traffic is then logged by Sysmon and parsed in splunk using an add-on. Using filters and a table, the data is further organized into intelligence that can be understood and acted upon by other members of a security team to find and fix security threats on a network.

The first step from the attacking machine is to find a vulnerbility in a system. Using Nmap, a common network mapping tool, I discovered that port 3389 has been left open. This is the remote desktop port used by windows and in actuality could be concievably exploited in the field against a network with naive security protocols.
![Nmap](https://github.com/KellenMurphy60/PersonalRepo/assets/126136167/65e581e0-a1b6-4fa1-8180-284bede8192e)
