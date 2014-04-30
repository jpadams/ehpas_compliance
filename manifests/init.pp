class compliance {
  #include compliance::banner
  include compliance::ssh
  include compliance::cron
  include compliance::files
  include compliance::uid0
}
