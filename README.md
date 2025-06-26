# The Exploit Database Git Repository

This is an official repository of [The Exploit Database](https://www.exploit-db.com/), a [project](https://www.offensive-security.com/community-projects/) sponsored by [Offensive Security](https://www.offensive-security.com/).
Our repositories are:

  - Exploits & Shellcodes: [gitlab.com/exploit-database/exploitdb](https://gitlab.com/exploit-database/exploitdb)
  - Binary Exploits: [gitlab.com/exploit-database/exploitdb-bin-sploits](https://gitlab.com/exploit-database/exploitdb-bin-sploits)
  - Papers: [gitlab.com/exploit-database/exploitdb-papers](https://gitlab.com/exploit-database/exploitdb-papers)

The Exploit Database is an archive of public exploits and corresponding vulnerable software, developed for use by penetration testers and vulnerability researchers. Its aim is to serve as the most comprehensive collection of [exploits](https://www.exploit-db.com/), [shellcode](https://www.exploit-db.com/shellcodes) and [papers](https://www.exploit-db.com/papers) gathered through direct submissions, mailing lists, and other public sources, and present them in a freely-available and easy-to-navigate database. The Exploit Database is a repository for exploits and Proof-of-Concepts rather than advisories, making it a valuable resource for those who need actionable data right away.
You can learn more about the project [here (Top Right -> About Exploit-DB)](https://www.exploit-db.com/) and [here (History)](https://www.exploit-db.com/history).

This repository is updated daily with the most recently added submissions. Any additional resources can be found in our [binary exploits repository](https://gitlab.com/exploit-database/exploitdb-bin-sploits).

Exploits are located in the [`/exploits/`](https://gitlab.com/exploit-database/exploitdb/tree/main/exploits) directory, shellcodes can be found in the [`/shellcodes/`](https://gitlab.com/exploit-database/exploitdb/tree/main/shellcodes) directory.

- - -

## License

This project (and SearchSploit) is released under "[GNU General Public License v2.0](https://gitlab.com/exploit-database/exploitdb/-/blob/main/LICENSE.md)".

- - -

# SearchSploit

Included with this repository is the **SearchSploit** utility, which will allow you to search through exploits, shellcodes and papers _(if installed)_ using one or more terms.
For more information, please see the **[SearchSploit manual](https://www.exploit-db.com/searchsploit)**.

## Usage/Example

```
kali@kali:~$ searchsploit -h
  Usage: searchsploit [options] term1 [term2] ... [termN]

==========
 Examples
==========
  searchsploit afd windows local
  searchsploit -t oracle windows
  searchsploit -p 39446
  searchsploit linux kernel 3.2 --exclude="(PoC)|/dos/"
  searchsploit -s Apache Struts 2.0.0
  searchsploit linux reverse password
  searchsploit -j 55555 | jq
  searchsploit --cve 2021-44228

  For more examples, see the manual: https://www.exploit-db.com/searchsploit

=========
 Options
=========
## Search Terms
   -c, --case     [term]      Perform a case-sensitive search (Default is inSEnsITiVe)
   -e, --exact    [term]      Perform an EXACT & order match on exploit title (Default is an AND match on each term) [Implies "-t"]
                                e.g. "WordPress 4.1" would not be detect "WordPress Core 4.1")
   -s, --strict               Perform a strict search, so input values must exist, disabling fuzzy search for version range
                                e.g. "1.1" would not be detected in "1.0 < 1.3")
   -t, --title    [term]      Search JUST the exploit title (Default is title AND the file's path)
       --exclude="term"       Remove values from results. By using "|" to separate, you can chain multiple values
                                e.g. --exclude="term1|term2|term3"
       --cve      [CVE]       Search for Common Vulnerabilities and Exposures (CVE) value

## Output
   -j, --json     [term]      Show result in JSON format
   -o, --overflow [term]      Exploit titles are allowed to overflow their columns
   -p, --path     [EDB-ID]    Show the full path to an exploit (and also copies the path to the clipboard if possible)
   -v, --verbose              Display more information in output
   -w, --www      [term]      Show URLs to Exploit-DB.com rather than the local path
       --id                   Display the EDB-ID value rather than local path
       --disable-colour       Disable colour highlighting in search results

## Non-Searching
   -m, --mirror   [EDB-ID]    Mirror (aka copies) an exploit to the current working directory
   -x, --examine  [EDB-ID]    Examine (aka opens) the exploit using $PAGER

## Non-Searching
   -h, --help                 Show this help screen
   -u, --update               Check for and install any exploitdb package updates (brew, deb & git)

## Automation
       --nmap     [file.xml]  Checks all results in Nmap's XML output with service version
                                e.g.: nmap [host] -sV -oX file.xml

=======
 Notes
=======
 * You can use any number of search terms
 * By default, search terms are not case-sensitive, ordering is irrelevant, and will search between version ranges
   * Use '-c' if you wish to reduce results by case-sensitive searching
   * And/Or '-e' if you wish to filter results by using an exact match
   * And/Or '-s' if you wish to look for an exact version match
 * Use '-t' to exclude the file's path to filter the search results
   * Remove false positives (especially when searching using numbers - i.e. versions)
 * When using '--nmap', adding '-v' (verbose), it will search for even more combinations
 * When updating or displaying help, search terms will be ignored

kali@kali:~$
kali@kali:~$ searchsploit afd windows local
---------------------------------------------------------------------------------------- -----------------------------------
 Exploit Title                                                                          |  Path
---------------------------------------------------------------------------------------- -----------------------------------
Microsoft Windows (x86) - 'afd.sys' Local Privilege Escalation (MS11-046)               | windows_x86/local/40564.c
Microsoft Windows - 'afd.sys' Local Kernel (PoC) (MS11-046)                             | windows/dos/18755.c
Microsoft Windows - 'AfdJoinLeaf' Local Privilege Escalation (MS11-080) (Metasploit)    | windows/local/21844.rb
Microsoft Windows 7 (x64) - 'afd.sys' Dangling Pointer Privilege Escalation (MS14-040)  | windows_x86-64/local/39525.py
Microsoft Windows 7 (x86) - 'afd.sys' Dangling Pointer Privilege Escalation (MS14-040)  | windows_x86/local/39446.py
Microsoft Windows XP - 'afd.sys' Local Kernel Denial of Service                         | windows/dos/17133.c
Microsoft Windows XP/2003 - 'afd.sys' Local Privilege Escalation (K-plugin) (MS08-066)  | windows/local/6757.txt
Microsoft Windows XP/2003 - 'afd.sys' Local Privilege Escalation (MS11-080)             | windows/local/18176.py
---------------------------------------------------------------------------------------- -----------------------------------
Shellcodes: No Result
kali@kali:~$
kali@kali:~$ searchsploit -p 39446
  Exploit: Microsoft Windows 7 (x86) - 'afd.sys' Dangling Pointer Privilege Escalation (MS14-040)
      URL: https://www.exploit-db.com/exploits/39446
     Path: /Users/b/Projects/git/forks/exploitdb/exploits/windows_x86/local/39446.py
    Codes: N/A
 Verified: False
File Type: Python script text executable, ASCII text

Copied EDB-ID #39446's path to the clipboard
kali@kali:~$
```
### Keyword Fallback Search

When a multi-term search returns no results, SearchSploit will now automatically retry each individual term.

**Usage:**
```bash
Exploits: No Results
Shellcodes: No Results

[i] No exact results for: Samba smbd 3.0.20

Showing related results per keyword:

--- [Samba] ---
------------------------------------------------------------------------------------- ---------------------------------
 Exploit Title                                                                       |  Path
------------------------------------------------------------------------------------- ---------------------------------
GoSamba 1.0.1 - 'INCLUDE_PATH' Multiple Remote File Inclusions                       | php/webapps/4575.txt
Microsoft Windows XP/2003 - Samba Share Resource Exhaustion (Denial of Service)      | windows/dos/148.sh
Samba 1.9.19 - 'Password' Remote Buffer Overflow                                     | linux/remote/20308.c
Samba 2.0.7 - SWAT Logfile Permissions                                               | linux/local/20341.sh
Samba 2.0.7 - SWAT Logging Failure                                                   | unix/remote/20340.c
SWAT Samba Web Administration Tool - Cross-Site Request Forgery                      | cgi/webapps/17577.txt
------------------------------------------------------------------------------------- ---------------------------------
Shellcodes: No Results

--- [smbd] ---
------------------------------------------------------------------------------------- ---------------------------------
 Exploit Title                                                                       |  Path
------------------------------------------------------------------------------------- ---------------------------------
smbftpd 0.96 - SMBDirList-function Remote Format String                              | linux/remote/4478.c
------------------------------------------------------------------------------------- ---------------------------------
Shellcodes: No Results

--- [3.0.20] ---
------------------------------------------------------------------------------------- ---------------------------------
 Exploit Title                                                                       |  Path
------------------------------------------------------------------------------------- ---------------------------------
CubeCart 3.0.20 - '/admin/login.php?goto' Arbitrary Site Redirect                    | php/webapps/36686.txt
CubeCart 3.0.20 - 'switch.php?r' Arbitrary Site Redirect                             | php/webapps/36687.txt
CubeCart 3.0.20 - Multiple Script 'redir' Arbitrary Site Redirects                   | php/webapps/36685.txt
Maxthon Browser 3.0.20.1000 - ref / replace Denial of Service                        | windows/dos/16084.html
Samba 3.0.20 < 3.0.25rc3 - 'Username' map script' Command Execution (Metasploit)     | unix/remote/16320.rb
Samba < 3.0.20 - Remote Heap Overflow                                                | linux/remote/7701.txt
Spy Emergency 23.0.205 - Unquoted Service Path Privilege Escalation                  | windows/local/40550.txt
------------------------------------------------------------------------------------- ---------------------------------
Shellcodes: No Results
```

- - -

## Install

SearchSploit requires either "CoreUtils" or "utilities" (e.g. `bash`, `sed`, `grep`, `awk`, etc.) for the core features to work.
The self updating function will require `git`, and for the Nmap XML option to work, will require `xmllint` (found in the `libxml2-utils` package in Debian-based systems).

You can find a **more in-depth guide in the [SearchSploit manual](https://www.exploit-db.com/searchsploit)**.

**Kali Linux**

Exploit-DB/SearchSploit is already packaged inside of Kali-Linux. A method of installation is:

```
kali@kali:~$ sudo apt -y install exploitdb
```

_NOTE, Optional is to install the additional packages:_

```
kali@kali:~$ sudo apt -y install exploitdb-bin-sploits exploitdb-papers
```

**Git**

In short, clone the repository, add the binary into `$PATH`, and edit the config file to reflect the git path:

```
$ sudo git clone https://gitlab.com/exploit-database/exploitdb.git /opt/exploitdb
$ sudo ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit
```

**Homebrew**

If you have [homebrew](http://brew.sh/) ([package](https://github.com/Homebrew/homebrew-core/blob/master/Formula/exploitdb.rb), [formula](https://formulae.brew.sh/formula/exploitdb)) installed, running the following will get you set up:

```
user@MacBook:~$ brew update && brew install exploitdb
```

- - -

## Credit

The following people made this possible:

- [Offensive Security](https://www.offensive-security.com/)
- [@Unix-Ninja](https://github.com/unix-ninja)
- [@g0tmi1k](https://blog.g0tmi1k.com/)
