#!/usr/bin/env ruby

/=================================================
         Stat script for a set of values.
        by Liu Lantao (liulantao@gmail.com)
=================================================/

require 'descriptive_statistics'

class Hash ; def oneline; r = []; self.sort.each do |k,v|; r << "#{k}:#{v}"; end; r.join("|"); end; alias to_s_std to_s; alias to_s oneline; end

if __FILE__ == $0
	A = []
	while line = gets
		A << line.to_i
	end

	puts A.percentile(10)
	puts A.descriptive_statistics
end
