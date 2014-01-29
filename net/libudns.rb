#!/usr/bin/env ruby
require 'resolv'

class UDNS
  def self.get_cname_list(name, nameservers = nil)
    if nameservers
      dns = Resolv::DNS.new :nameserver => nameservers, :ndots => 1
    else
      dns = Resolv::DNS.new :ndots => 1
    end
    cname_list = []
    begin
      while name = dns.getresource(name, Resolv::DNS::Resource::IN::CNAME).name
        cname_list << name
      end
    rescue Resolv::ResolvError => e
      cname_list << dns.getaddresses(name)
    end
    cname_list
  end
end

if __FILE__ == $0
	if ARGV.size == 1
		puts UDNS.get_cname_list(ARGV[0])
	elsif ARGV.size == 2
		puts UDNS.get_cname_list(ARGV[0], ARGV[1])
	else
		puts UDNS.get_cname_list('www.renren.com')
		puts UDNS.get_cname_list('www.renren.com', ['8.8.8.8'])
	end
end
