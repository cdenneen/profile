class profile {
  class { 'dynatrace::role::agents_package':
    installer_file_url => 'http://downloads.dynatracesaas.com/6.3/dynatrace-agent-unix.jar'
  }

  class { 'dynatrace::role::java_agent':
    env_var_name      => 'CATALINA_OPTS',
    env_var_file_name => '/opt/apache-tomcat/bin/catalina.sh',
    agent_name        => 'apache-tomcat-agent',
    require           => Class['dynatrace::role::agents_package']
  }
}
