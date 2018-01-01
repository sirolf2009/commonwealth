package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.ITimeseries
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import java.util.ArrayList
import java.util.stream.Collectors
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

@FinalFieldsConstructor class TrendFinderAngleStdDev implements ITrendFinder {
	
	val double threshold
	
	override apply(ITimeseries timeseries) {
		val trends = new ArrayList<ITrend>()
		var from = 0
		while(from != timeseries.size()-1) {
			val end = timeseries.getTrendEnd(from)
			trends += new Trend(timeseries.get(from), timeseries.get(end))
			from = end
		}
		return trends
	}
	
	def getTrendEnd(ITimeseries timeseries, int from) {
		val thresholdBreached = (from ..< timeseries.size()).findFirst[
			timeseries.getStandardDeviation(from, it) > threshold
		]
		if(thresholdBreached === null) {
			return timeseries.size()-1
		}
		val end = (from+1 ..< thresholdBreached).toList().reverse().findFirst[
			timeseries.getStandardDeviation(from, it-1) > timeseries.getStandardDeviation(from, it)
		]
		if(end === null) {
			return thresholdBreached
		} else {
			return end-1
		}
	}
	
	def getStandardDeviation(ITimeseries timeseries, int from, int to) {
		return timeseries.getStandardDeviation(timeseries.getAngleLine(from, to), from, to)
	}
	
	def getStandardDeviation(ITimeseries timeseries, ITimeseries angleLine, int from, int to) {
		return Math.sqrt((from ..< to).toList.stream.mapToDouble[
			val angleValue = angleLine.get(it-from).y.doubleValue
			Math.pow(timeseries.get(it).y.doubleValue-angleValue, 2)
		].sum()/(to-from))
	}
	
	def getAngleLine(ITimeseries timeseries, int from, int to) {
		return getAngleLine(timeseries, getAngle(timeseries, from, to), from, to)
	}
	
	def getAngleLine(ITimeseries timeseries, double angle, int from, int to) {
		val startValue = timeseries.get(from).y.doubleValue()
		val endValue = timeseries.get(to).y.doubleValue()
		val diff = endValue-startValue
		val stepSize = diff/(to-from)
		return new Timeseries((from ..< to).toList.stream.map[
			val point = timeseries.get(it)
			return new Point(point.x, startValue+(stepSize*-(from-it))) as IPoint
		].collect(Collectors.toList))
	}
	
	def getAngle(ITimeseries timeseries, int from, int to) {
		return timeseries.get(from).getAngle(timeseries.get(to))
	}
	
	def getAngle(IPoint a, IPoint b) {
		return Math.atan2(b.y.doubleValue() - a.y.doubleValue(), b.x.doubleValue() - a.x.doubleValue())
	}
	
}