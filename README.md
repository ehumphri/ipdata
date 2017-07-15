ipdata

Just a quick tool to parse through a list of targets for a pentest and perform some basic sanity checks and generate various lists such as hostnames, ips, etc.

Example:

```
shell$ ./ipdata.pl example-networks.txt 
Checking 192.168.2.1
Checking 192.168.7.23
Checking 192.168.7.24
Checking 172.16.3.23
Checking 10.255.255.29/29
Checking 4.2.2.2
Checking 8.8.8.8
Checking www.example.com
Likely hostname
Checking 4.2.0.0/24
Checking 2606:2800:220:1:248:1893:25c8:1946
writing targets.csv
writing hostnames.txt
writing Errors.log
Done!
shell$
```

Example targets.csv:

![Alt text](/images/target-output.png?raw=true "Example output")

Limitations:

Subnets in CIDR notations that do not designate the correct network address will throw an error.

Tested on:
- OSX 10.10.5
- MacOS 10.12.5
