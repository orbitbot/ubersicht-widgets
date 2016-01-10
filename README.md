# ubersicht-widgets
My personal Übersicht widget collection
<br>

#### Widgets

- calendar.widget (customized version of [felixhageloh/ubersicht-widgets/calendar](https://github.com/felixhageloh/uebersicht-widgets/tree/master/calendar))
- cpu-bar.widget (customized version of [ubersicht-cpu-bar](https://github.com/PerishableDave/ubersicht-cpu-bar))
- memory-bar.widget (customized version of [ubersicht-memory-bar](https://github.com/cobyism/ubersicht-memory-bar))
- network-info.widget (customized version of [NetworkInfo](https://github.com/felixhageloh/uebersicht-widgets/tree/master/NetworkInfo))
- network-throughput.widget (customized version of [network-throughput](https://github.com/felixhageloh/uebersicht-widgets/tree/master/network-throughput))


http://askubuntu.com/questions/245707/not-able-to-get-the-reverse-dns-working


http://mygeekdaddy.net/2014/08/10/migrating-from-geektool-to-ubersicht/

ps aux | sort -nrk 3 | head -n 2 | awk '{print $1, $2, $11}'


processes | sort by cpu use | if higher than limit, print output
ps aux | sort -nrk 3 | awk '{ if ( $3 >= 3 ) print $1, $2, $11}'


https://bjango.com/mac/istatmini/

top -l 2 -n 0 -F | egrep -o ' \d*\.\d+% idle' | tail -1 | awk -F% -v prefix="$prefix" '{ printf "%s%.1f%%\n", prefix, 100 - $1 }'

df -Hl | grep 'disk1' | awk '{print $4"/"$2" free ("$5" used)"}'


http://pc-freak.net/blog/monitoring-cpu-load-memory-usage-mac-os-command-line-terminal/