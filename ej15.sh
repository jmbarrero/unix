cat /var/apache/access.log | grep GET | cut -d'?' -f1 | cut -d' ' -f3 | grep -c | to
