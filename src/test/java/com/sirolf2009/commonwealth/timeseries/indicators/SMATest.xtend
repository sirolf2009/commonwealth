package com.sirolf2009.commonwealth.timeseries.indicators

import com.sirolf2009.commonwealth.timeseries.IPoint
import com.sirolf2009.commonwealth.timeseries.Point
import com.sirolf2009.commonwealth.timeseries.Timeseries
import org.junit.Test
import org.junit.Assert

class SMATest {
	
	val points = #[
		new Point(0, 98d),
		new Point(1, 99d),
		new Point(2, 100d),
		new Point(3, 99d),
		new Point(4, 98d),
		new Point(5, 99d),
		new Point(6, 100d),
		new Point(7, 101d),
		new Point(8, 100d),
		new Point(9, 99d),
		new Point(10, 98d),
		new Point(11, 200d)
	].map[it as IPoint].toList()
	val series = new Timeseries(points)
	
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