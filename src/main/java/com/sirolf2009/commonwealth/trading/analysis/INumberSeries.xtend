package com.sirolf2009.commonwealth.trading.analysis

import java.util.Collection
import java.util.stream.Collectors
import java.util.OptionalDouble
import java.util.function.Function

interface INumberSeries extends Collection<Number> {
	
	def getStdDev() {
		return getVariance().map[Math.sqrt(it)]
	}
	
	def getVariance() {
		return getMean().map[mean |
			streamAsDoubles().map[Math.pow(it-mean, 2)].sum() / size()
		]
	}
	
	def getMode() {
		return streamAsDoubles().boxed().collect(Collectors.groupingBy(Function.identity(), Collectors.counting())).entrySet().stream().max[a,b| a.value.compareTo(b.value)]
	}
	
	def getMedian() {
		if(size() == 0) {
			return OptionalDouble.empty()
		}
		val values = streamAsDoubles().sorted().boxed().collect(Collectors.toList())
		val middle = size()/2
		if(size() %2 == 1) {
			return OptionalDouble.of(values.get(middle))
		} else {
			return OptionalDouble.of((values.get(middle-1)+values.get(middle))/2)
		}
	}
	
	def getMean() {
		return streamAsDoubles().average()
	}
	
	def getMax() {
		return streamAsDoubles().max()
	}
	
	def getMin() {
		return streamAsDoubles().min()
	}
	
	def sum() {
		return streamAsDoubles().sum()
	}
	
	def streamAsDoubles() {
		return stream().mapToDouble[doubleValue()]
	}
	
	def static map(OptionalDouble optional, Function<Double, Double> mapper) {
		if(optional.isPresent()) {
			return OptionalDouble.of(mapper.apply(optional.getAsDouble()))
		} else {
			return OptionalDouble.empty()
		}
	}
	
}