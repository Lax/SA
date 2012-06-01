#! /usr/bin/env ruby

dns = Hash.new
dns['dx1'] = "202.102.199.68"
dns['dx'] = "219.141.148.42"
dns['wt'] = "202.106.0.20"
dns['jy'] = "202.38.64.1"
dns['hw'] = "8.8.8.8"
dns['yd'] = "211.98.4.1"
dns['ydj'] = "211.141.90.68"
dns['local'] = ""

url = ARGV[0] || "http://www.google.com/services/"
nets = ARGV[1] ? ARGV[1].split(",") : dns.keys

puts url
puts

nets.each do |net|
#nets.split(',').each do |net|
	if url =~ /http[s]*:\/\/([^\/]+).*/
		domain = $1

		host_ret = `host #{domain} #{dns[net]}`
	
		hosts = host_ret.scan(/has address (\d+\.\d+\.\d+\.\d+)|A\s+(\d+\.\d+\.\d+\.\d+)/).flatten.compact

		puts "#{net}: #{hosts.join("\t")}\n\n"
		puts "host\t\tsize\tcode\t\dns\tconnect\tpre\tstart\ttotal\n\n"

		hosts.each do |host|
			tmpurl = url.sub(/http[s]*:\/\/(#{domain})/, "http://#{host}") 
			5.times do
				print "#{host}\t"
				puts `curl -b 'vip=1' -e http://www.renren.com/ -o /dev/null -s -w"%{size_download}\t%{http_code}\t%{time_namelookup}\t%{time_connect}\t%{time_pretransfer}\t%{time_starttransfer}\t%{time_total}\n" -H "Host: #{domain}" #{tmpurl}`
				sleep 0.1
			end
			puts
		end
	end
end
