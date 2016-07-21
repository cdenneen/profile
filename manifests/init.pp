class profile {
  class { '::java':
    distribution => 'jre',
    version      => '1.8',
  }
  class { '::dynatrace::role::collector':
    installer_file_url => 'http://downloads.dynatracesaas.com/6.3/dynatrace-collector-linux-x86.jar',
    dynatrace_owner    => 'dynatrace',
    dynatrace_group    => 'dynatrace',
    require            => Class['java']
  }
  class { '::dynatrace::role::memory_analysis_server':
    installer_file_url => 'http://downloads.dynatracesaas.com/6.3/dynatrace-analysisserver-linux-x86.jar',
    dynatrace_owner    => 'dynatrace',
    dynatrace_group    => 'dynatrace',
    require            => Class['java']
  }
  class { '::dynatrace::role::server':
    installer_file_url => 'http://downloads.dynatracesaas.com/6.3/dynatrace-server-linux-x86.jar',
    dynatrace_owner    => 'dynatrace',
    dynatrace_group    => 'dynatrace',
    require            => Class['java']
  }
}
