package com.sirolf2009.commonwealth.timeseries.trends

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.ITimeseries
import java.util.ArrayList
import java.util.Optional
import java.util.concurrent.atomic.AtomicReference
import org.eclipse.xtend.lib.annotations.FinalFieldsConstructor

@FinalFieldsConstructor class PeakTroughFinderPercentage implements IPeakTroughFinder {
	
	val double threshold

	override apply(ITimeseries series) {
		val firstPeak = detectPeak(series, 0)
		val firstTrough = detectTrough(series, 0)
		val extremes = new ArrayList()
		if(!firstPeak.isPresent() && !firstTrough.isPresent()) {
			return extremes
		} else if(firstPeak.isPresent() && !firstTrough.isPresent()) {
			return #[new Extreme(firstPeak.get(), ExtremeType.PEAK)]
		} else if(firstTrough.isPresent() && !firstPeak.isPresent()) {
			return #[new Extreme(firstTrough.get(), ExtremeType.TROUGH)]
		} else if(firstPeak.get() == firstTrough.get()) {
			return extremes
		} else if(firstTrough.get() < firstPeak.get()) {
			extremes.add(new Extreme(firstTrough.get(), ExtremeType.TROUGH))
			extremes.add(new Extreme(firstPeak.get(), ExtremeType.PEAK))
			var lastPeak = firstPeak
			while(true) {
				val trough = detectTrough(series, series.toList().indexOf(lastPeak.get())+1)
				if(!trough.isPresent()) {
					return extremes
				}
				extremes.add(new Extreme(trough.get(), ExtremeType.TROUGH))
				if(trough.get() == series.size()-1) {
					return extremes
				}
				val peak = detectPeak(series, series.toList().indexOf(trough.get())+1)
				if(!peak.isPresent()) {
					return extremes
				}
				extremes.add(new Extreme(peak.get(), ExtremeType.PEAK))
				if(peak.get() == series.size()-1) {
					return extremes
				}
				lastPeak = peak
			}
		} else {
			extremes.add(new Extreme(firstPeak.get(), ExtremeType.PEAK))
			extremes.add(new Extreme(firstTrough.get(), ExtremeType.TROUGH))
			var lastTrough = firstTrough
			while(true) {
				val peak = detectPeak(series, series.toList().indexOf(lastTrough.get())+1)
				if(!peak.isPresent()) {
					return extremes
				}
				extremes.add(new Extreme(peak.get(), ExtremeType.PEAK))
				if(peak.get() == series.size()-1) {
					return extremes
				}
				val trough = detectTrough(series, series.toList().indexOf(peak.get())+1)
				if(!trough.isPresent()) {
					return extremes
				}
				extremes.add(new Extreme(trough.get(), ExtremeType.TROUGH))
				if(trough.get() == series.size()-1) {
					return extremes
				}
				lastTrough = trough
			}
		}
	}

	def detectPeak(ITimeseries series, int since) {
		val max = new AtomicReference(series.get(since))
		val peakIndex = (since ..< series.size()).findFirst [
			val point = series.get(it)
			if(point > max.get()) {
				max.set(point)
				return false
			} else {
				val drop = 1 - point / max.get()
				return drop >= threshold
			}
		]
		if(peakIndex !== null) {
			return Optional.of(max.get())
		} else {
			return Optional.empty()
		}
	}

	def detectTrough(ITimeseries series, int since) {
		val min = new AtomicReference(series.get(since))
		val troughIndex = (since ..< series.size()).findFirst [
			val point = series.get(it)
			if(point < min.get()) {
				min.set(point)
				return false
			} else {
				val rise = 1 - min.get() / point
				return rise >= threshold
			}
		]
		if(troughIndex !== null) {
			return Optional.of(min.get())
		} else {
			return Optional.empty()
		}
	}
	
	def private static >(IPoint a, IPoint b) {
		return a.y.doubleValue() > b.y.doubleValue()
	} 
	
	def private static <(IPoint a, IPoint b) {
		return a.y.doubleValue() < b.y.doubleValue()
	} 
	
	def private static /(IPoint a, IPoint b) {
		return a.y.doubleValue() / b.y.doubleValue()
	} 
	
}