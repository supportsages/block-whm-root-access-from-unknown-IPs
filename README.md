# block-whm-root-access-from-unknown-IPs
Bash script to restrict the root level WHM access after cross checking it with the known IPs list.

Download the files to /root/scripts/ location

- Start/Stop the Script
Change script_name with the script depending on if iptables  or csf is being used:
# sh /root/scripts/script_name &
The & will send the process into background.
- To stop the backgrounded script:
# sh /root/scripts/script_name kill

Known Bugs & Limitations
- Need to restart the script to reload IP whitelist modifications.
- Need to Stop then Start to restart the script.
- The script may try multiple times to block a single IP. This may create duplicate entries in IPTABLES.
- Commenting not allowed in whitelist
- No Email alerts for IP block instance.
- CIDR notation is not supported in whitelist

Detailed step by step configuratuion guide can be found here: https://www.supportsages.com/blog/2016/07/script-to-block-whm-root-access-from-unknown-ips/
