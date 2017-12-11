package com.sirolf2009.commonwealth.timeseries.indicators

import static extension com.sirolf2009.commonwealth.timeseries.indicators.IndicatorTestExtensions.*
import org.junit.Test
import org.junit.Assert

class BidAvgDiffTest {
	
	@Test
	def void test() {
		Assert.assertEquals(10d, BidAvgDiff.bidAvgDiff(orderbook(#[order(80), order(90), order(100)], #[])).getAsDouble(), 0.001d)
	}
	
}