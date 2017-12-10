package com.sirolf2009.commonwealth.timeseries.indicators

import org.junit.Assert
import org.junit.Test

import static com.sirolf2009.commonwealth.timeseries.indicators.IndicatorTestExtensions.*

class SMATest {
	
	val series = timeseries(98d, 99d, 100d, 99d, 98d, 99d, 100d, 101d, 100d, 99d, 98d, 200d)
	
	@Test
	def void test() {
		val sma = new SMA(4)
		Assert.assertEquals(98d, sma.sma(series, 0).orElseThrow[new RuntimeException("No value present")], 0.01d)
		Assert.assertEquals((98d+99d)/2, sma.sma(series, 1).orElseThrow[new RuntimeException("No value present")], 0.01d)
		Assert.assertEquals((98d+99d+100d)/3, sma.sma(series, 2).orElseThrow[new RuntimeException("No value present")], 0.01d)
		Assert.assertEquals((98d+99d+100d+99d)/4, sma.sma(series, 3).orElseThrow[new RuntimeException("No value present")], 0.01d)
		Assert.assertEquals((99d+100d+99d+98d)/4, sma.sma(series, 4).orElseThrow[new RuntimeException("No value present")], 0.01d)
		
		Assert.assertEquals(#[98.0, 98.5, 99.0, 99.0, 99.0, 99.0, 99.0, 99.5, 100.0, 100.0, 99.5, (200d+98d+99d+100d)/4].toList(), (sma.apply(series).map[y.doubleValue()].toList()))
	}
	
}