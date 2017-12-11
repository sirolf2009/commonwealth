package com.sirolf2009.commonwealth.timeseries.indicators

import static extension com.sirolf2009.commonwealth.timeseries.indicators.IndicatorTestExtensions.*
import org.junit.Test
import org.junit.Assert

class BidSumTest {
	
	@Test
	def void test() {
		Assert.assertEquals(60d, BidSum.bidSum(orderbook(#[order(1, 10), order(2, 20), order(3, 30)], #[])), 0.001d)
	}
	
}