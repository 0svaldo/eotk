#!/usr/bin/perl
# eotk (c) 2017 Alec Muffett

my %known =
    (
     # demo fakes
     'NEW_ONION' => 1,
     'NEW_HARD_ONION' => 1,
     'NEW_SOFT_ONION' => 1,
     'SCRIPT_PAUSE' => 1,
     '' => 1, # an empty escape character

     # rest
     'BLOCK_ERR' => 1,
     'BLOCK_HOST' => 1,
     'BLOCK_HOST_RE' => 1,
     'BLOCK_LOCATION' => 1,
     'BLOCK_LOCATION_RE' => 1,
     'BLOCK_ORIGIN' => 1,
     'BLOCK_ORIGIN_RE' => 1,
     'BLOCK_PARAM' => 1,
     'BLOCK_PARAM_RE' => 1,
     'BLOCK_PATH' => 1,
     'BLOCK_PATH_RE' => 1,
     'BLOCK_REFERER' => 1,
     'BLOCK_REFERER_RE' => 1,
     'BLOCK_USER_AGENT' => 1,
     'BLOCK_USER_AGENT_RE' => 1,
     'CERT_PREFIX' => 1,
     'COOKIE_LOCK' => 1,
     'DEBUG_TRAP' => 1,
     'DNS_DOMAIN' => 1, # site being mapped
     'DNS_DOMAIN_RE' => 1, # ...with dots escaped
     'DNS_DOMAIN_RE2' => 1, # ...with dots double-escaped
     'DNS_DOMAIN_RERE' => 1, # ...with dots escaped
     'DNS_DOMAIN_RERE2' => 1, # ...with dots double-escaped
     'EOTK_HOME' => 1,
     'EXTRA_PROCESSING_CSV' => 1,
     'EXTRA_SUBS_FILTER_TYPES' => 1,
     'FORCE_HTTPS' => 1,
     'FOREIGNMAP_CSV' => 1,
     'HARDCODED_ENDPOINT_CSV' => 1,
     'HARD_MODE' => 1,
     'HOST_BLACKLIST' => 1,
     'HOST_BLACKLIST_RE' => 1,
     'HOST_WHITELIST' => 1,
     'HOST_WHITELIST_RE' => 1,
     'IS_SOFTMAP' => 1,
     'LOG_DIR' => 1, # where logs for the current project live
     'NGINX_ACTION_ABORT' => 1,
     'NGINX_BLOCK_BUSY_SIZE' => 1,
     'NGINX_BLOCK_COUNT' => 1,
     'NGINX_BLOCK_SIZE' => 1,
     'NGINX_CACHE_MIN_USES' => 1,
     'NGINX_CACHE_SECONDS' => 1,
     'NGINX_CACHE_SIZE' => 1,
     'NGINX_HASH_BUCKET_SIZE' => 1,
     'NGINX_HELLO_ONION' => 1,
     'NGINX_RESOLVER' => 1,
     'NGINX_RLIM' => 1,
     'NGINX_SYSLOG' => 1,
     'NGINX_TEMPLATE' => 1,
     'NGINX_TIMEOUT' => 1,
     'NGINX_TMPFILE_SIZE' => 1,
     'NGINX_WORKERS' => 1,
     'NONCE128_1' => 1,
     'NONCE128_2' => 1,
     'NONCE128_3' => 1,
     'NONCE128_4' => 1,
     'NONCE128_5' => 1,
     'NONCE256_1' => 1,
     'NONCE256_2' => 1,
     'NONCE256_3' => 1,
     'NONCE256_4' => 1,
     'NONCE256_5' => 1,
     'NO_CACHE_CONTENT_TYPE' => 1,
     'NO_CACHE_HOST' => 1,
     'ONION_ADDRESS' => 1, # onion being mapped-to
     'ONION_ADDRESS_RE' => 1, # with dots escaped
     'ONION_ADDRESS_RE2' => 1, # with dots double-escaped
     'ONION_ADDRESS_RERE' => 1, # with dots escaped
     'ONION_ADDRESS_RERE2' => 1, # with dots double-escaped
     'ORIGIN_BLACKLIST' => 1,
     'ORIGIN_BLACKLIST_RE' => 1,
     'ORIGIN_WHITELIST' => 1,
     'ORIGIN_WHITELIST_RE' => 1,
     'PARAM_BLACKLIST' => 1,
     'PARAM_BLACKLIST_RE' => 1,
     'PARAM_WHITELIST' => 1,
     'PARAM_WHITELIST_RE' => 1,
     'PATH_BLACKLIST' => 1,
     'PATH_BLACKLIST_RE' => 1,
     'PATH_WHITELIST' => 1,
     'PATH_WHITELIST_RE' => 1,
     'PRESERVE_AFTER' => 1,
     'PRESERVE_BEFORE' => 1,
     'PRESERVE_CSV' => 1,
     'PROJECT' => 1, # what the current project is called
     'PROJECTS_HOME' => 1, # where the projects live
     'PROJECT_DIR' => 1, # where the current project is being installed
     'REDIRECT_HOST' => 1,
     'REDIRECT_HOST_CSV' => 1,
     'REDIRECT_LOCATION_CSV' => 1,
     'REDIRECT_PATH' => 1,
     'REDIRECT_PATH_CSV' => 1,
     'REFERER_BLACKLIST' => 1,
     'REFERER_BLACKLIST_RE' => 1,
     'REFERER_WHITELIST' => 1,
     'REFERER_WHITELIST_RE' => 1,
     'SOFTMAP_NGINX_WORKERS' => 1,
     'SOFTMAP_TOR_WORKERS' => 1,
     'SSL_DIR' => 1, # where ssl certs for the current project live
     'SSL_TOOL' => 1,
     'SUPPRESS_HEADER_CSP' => 1,
     'SUPPRESS_HEADER_HPKP' => 1,
     'SUPPRESS_HEADER_HSTS' => 1,
     'SUPPRESS_METHODS_EXCEPT_GET' => 1,
     'SUPPRESS_TOR2WEB' => 1,
     'TEMPLATE_TOOL' => 1,
     'TOR_DIR' => 1, # where the current onion is being installed; subtle
     'TOR_INTROS_PER_DAEMON' => 1,
     'TOR_SINGLE_ONION' => 1,
     'TOR_SYSLOG' => 1,
     'TOR_TEMPLATE' => 1,
     'TOR_WORKER_PREFIX' => 1,
     'USER_AGENT_BLACKLIST' => 1,
     'USER_AGENT_BLACKLIST_RE' => 1,
     'USER_AGENT_WHITELIST' => 1,
     'USER_AGENT_WHITELIST_RE' => 1,
     'X_FROM_ONION_VALUE' => 1,
    );

my %syms = ();

while (<>) { s/%(\w*)%/$syms{$1}++, '-'/ge; }

foreach $var (sort keys %syms) {
    print "$syms{$var} $var";
    print " <- *unknown*" unless ($known{$var});
    print "\n";
}

exit 0;
