#!/usr/bin/env ruby

/=================================================
         Stat script for a set of values.
        by Liu Lantao (liulantao@gmail.com)
=================================================/


class Hash ; def oneline; r = []; self.sort.each do |k,v|; r << "#{k}:#{v}"; end; r.join("|"); end; alias to_s_std to_s; alias to_s oneline; end

class Pstat
	def self.stat(array, pers = [100,95,80,50,20,0])
		ar = array.sort
		hr = Hash.new 0
		pers.each do |per|
			pos = ((ar.size)*per/100.0).to_i - 1
			pos = 0 if pos < 0
			hr[per] = ar[pos]
		end
		hr
	end
end

if __FILE__ == $0
	A = []
	while line = gets
		A << line.to_i
	end
	puts Pstat.stat(A)  # pretty print result Hash
	puts Pstat.stat(A, [100,10,0])  # pretty print result Hash
end
