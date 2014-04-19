#!/usr/local/bin/perl -w
# use strict;
use warnings;
require HTTP::Request;
require LWP::UserAgent;

while(1){
	my $request = HTTP::Request->new(GET=>'server');
	$request->content('hdskhdfjkgdf');
	my $ua = LWP::UserAgent->new;
	my $response = $ua->request($request);
	print $response->status_line;
	sleep 10;	
}