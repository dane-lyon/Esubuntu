// Fichier configuration firefox
pref("network.proxy.type", 1);
pref("network.proxy.http", "127.0.0.1");
pref("network.proxy.http_port", 3128);

pref("network.proxy.https", "127.0.0.1");
pref("network.proxy.https_port", 3128);

pref("network.proxy.ftp", "127.0.0.1");
pref("network.proxy.ftp_port", 3128);

pref("network.proxy.ssl", "127.0.0.1");
pref("network.proxy.ssl_port", 3128);

pref("network.proxy.socks", "127.0.0.1");
pref("network.proxy.socks_port", 3128);

//pref("network.proxy.share_proxy_settings", true);
pref("network.proxy.no_proxies_on", "127.0.0.1, localhost , ubuntu.com , 172.18.40.2,10.210.9.10,pronote.antoineroussin.ac-reunion.fr,delta-expert.com,valeursenligne.fr");
pref("browser.startup.homepage", "http://metice.ac-reunion.fr|http://infometice.ac-reunion.fr");

// disable default browser check
pref("browser.shell.checkDefaultBrowser", false);

// disable application updates
pref("app.update.enabled", false)

// disables the 'know your rights' button from displaying on first run 
pref("browser.rights.3.shown", true);

// disables the request to send performance data from displaying
pref("toolkit.telemetry.prompted", 2);
pref("toolkit.telemetry.rejected", true);

// Download
lockPref("browser.download.manager.closeWhenDone", true);
lockPref("browser.download.manager.retention", 0);
lockPref("browser.download.useDownloadDir", false);

// authenticate to intranet sites
//pref("network.automatic-ntlm-auth.allow-proxies", false);

//pref("network.negotiate-auth.trusted-uris", "ac-reunion.fr" );
//pref("network.negotiate-auth.delegation-uris", "ac-reunion.fr");
//pref("network.automatic-ntlm-auth.trusted-uris", "ac-reunion.fr");


//pref("network.negotiate-auth.allow-insecure-ntlm-v1", false);
//pref("network.negotiate-auth.allow-insecure-ntlm-v1-https", false);
