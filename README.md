# searchsploit
A dockerfile for SearchSploit container based on https://hub.docker.com/r/fugitivus/searchsploit

I added an Entrypoint in order to use the container more easily.

I need it to schedule some check.

## What is SearchSploit

searchsploit is a command line search tool for Exploit-DB that also allows you to take a copy of Exploit Database with you, everywhere you go.

**This version only only allow to search exploit**, so you will **NOT** have _the power to perform detailed off-line searches through your locally checked-out copy of the repository_.

## Dockerfile

You can check the build at https://hub.docker.com/r/reedcrif/searchploit

## How to use this image

`sudo docker run --rm reedcrif/searchploit [OPTIONS]`

 
 ### Case 1
 
 ```
 :~$ sudo docker run -it --rm reedcrif/searchploit docker
[i] Found (#1): /exploit-database/files_exploits.csv
[i] To remove this message, please edit "/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#1): /exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

------------------------------------------ -------------------------------------
 Exploit Title                            |  Path
                                          | (/exploit-database/)
------------------------------------------ -------------------------------------
DC/OS Marathon UI - Docker (Metasploit)   | exploits/python/remote/42134.rb
Docker - Container Escape                 | exploits/linux/local/47147.txt
Docker 0.11 - VMM-Container Breakout      | exploits/linux/local/33808.c
Docker Daemon - Local Privilege Escalatio | exploits/linux/local/40394.rb
Docker Daemon - Unprotected TCP Socket    | exploits/linux/local/42356.txt
Docker Daemon - Unprotected TCP Socket (M | exploits/python/remote/42650.rb
Rancher Server - Docker Daemon Code Execu | exploits/linux_x86-64/remote/42964.r
runc < 1.0-rc6 (Docker < 18.09.2) - Conta | exploits/linux/local/46359.md
runc < 1.0-rc6 (Docker < 18.09.2) - Conta | exploits/linux/local/46369.md
------------------------------------------ -------------------------------------
Shellcodes: No Result
 ```
 
 ### Case 2, with URL & overflow

```
~$ sudo docker run -it --rm reedcrif/searchploit docker -w -o
[i] Found (#1): /exploit-database/files_exploits.csv
[i] To remove this message, please edit "/exploit-database/.searchsploit_rc" for "files_exploits.csv" (package_array: exploitdb)

[i] Found (#1): /exploit-database/files_shellcodes.csv
[i] To remove this message, please edit "/exploit-database/.searchsploit_rc" for "files_shellcodes.csv" (package_array: exploitdb)

----------------------------------- --------------------------------------------
 Exploit Title                     |  URL
----------------------------------- --------------------------------------------
DC/OS Marathon UI - Docker (Metasploit) | https://www.exploit-db.com/exploits/42134
Docker - Container Escape          | https://www.exploit-db.com/exploits/47147
Docker 0.11 - VMM-Container Breakout | https://www.exploit-db.com/exploits/33808
Docker Daemon - Local Privilege Escalation (Metasploit) | https://www.exploit-db.com/exploits/40394
Docker Daemon - Unprotected TCP Socket (Metasploit) | https://www.exploit-db.com/exploits/42650
Docker Daemon - Unprotected TCP Socket | https://www.exploit-db.com/exploits/42356
Rancher Server - Docker Daemon Code Execution (Metasploit) | https://www.exploit-db.com/exploits/42964
runc < 1.0-rc6 (Docker < 18.09.2) - Container Breakout (1) | https://www.exploit-db.com/exploits/46359
runc < 1.0-rc6 (Docker < 18.09.2) - Container Breakout (2) | https://www.exploit-db.com/exploits/46369
----------------------------------- --------------------------------------------
Shellcodes: No Result
```

### Help
 
 ```
:~$ sudo docker run --rm reedcrif/searchploit --help
  Usage: searchsploit [options] term1 [term2] ... [termN]

==========
 Examples
==========
  searchsploit afd windows local
  searchsploit -t oracle windows
  searchsploit -p 39446
  searchsploit linux kernel 3.2 --exclude="(PoC)|/dos/"
  searchsploit linux reverse password

  For more examples, see the manual: https://www.exploit-db.com/searchsploit

=========
 Options
=========
   -c, --case     [Term]      Perform a case-sensitive search (Default is inSEnsITiVe).
   -e, --exact    [Term]      Perform an EXACT match on exploit title (Default is AND) [Implies "-t"].
   -h, --help                 Show this help screen.
   -j, --json     [Term]      Show result in JSON format.
   -m, --mirror   [EDB-ID]    Mirror (aka copies) an exploit to the current working directory.
   -o, --overflow [Term]      Exploit titles are allowed to overflow their columns.
   -p, --path     [EDB-ID]    Show the full path to an exploit (and also copies the path to the clipboard if possible).
   -t, --title    [Term]      Search JUST the exploit title (Default is title AND the file's path).
   -u, --update               Check for and install any exploitdb package updates (deb or git).
   -w, --www      [Term]      Show URLs to Exploit-DB.com rather than the local path.
   -x, --examine  [EDB-ID]    Examine (aka opens) the exploit using $PAGER.
       --colour               Disable colour highlighting in search results.
       --id                   Display the EDB-ID value rather than local path.
       --nmap     [file.xml]  Checks all results in Nmap's XML output with service version (e.g.: nmap -sV -oX file.xml).
                                Use "-v" (verbose) to try even more combinations
       --exclude="term"       Remove values from results. By using "|" to separate, you can chain multiple values.
                                e.g. --exclude="term1|term2|term3".

=======
 Notes
=======
 * You can use any number of search terms.
 * Search terms are not case-sensitive (by default), and ordering is irrelevant.
   * Use '-c' if you wish to reduce results by case-sensitive searching.
   * And/Or '-e' if you wish to filter results by using an exact match.
 * Use '-t' to exclude the file's path to filter the search results.
   * Remove false positives (especially when searching using numbers - i.e. versions).
 * When updating or displaying help, search terms will be ignored.
 
 ```
