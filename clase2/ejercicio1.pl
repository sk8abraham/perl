#!/usr/bin/perl
$lel=0;
while ($lel ne 1)
{
    $link = 'https://openphish.com/feed.txt';
    $resp = `curl $link > urls.txt`;
    system('sleep 300');
    $lel=1;
}
