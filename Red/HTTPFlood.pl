#!/usr/local/bin/perl -w
use strict;
use warnings;
require HTTP::Request;
use IO::Socket;
require LWP::UserAgent;


my $ua = LWP::UserAgent->new;


while(1){
	my $request = HTTP::Request->new(POST=>'http://www.google.com');
	$request->header('content-type'=>'application/json');
    $request->header('x-auth-token'=>'sjdklfjklg389js89fsj');
    
	my $postData = '{"jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf",
                    "jdskljskdlfsd":"jskdlfjskldfsdf"
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",
    "jdskljskdlfsd":"jskdlfjskldfsdf",}';
	$request->content($postData);

	my $response = $ua->request($request);
    if($response->is_success){
        print $response->decoded_content;
    }else{
    }
    
	print $response->status_line;
#	sleep 10;
}