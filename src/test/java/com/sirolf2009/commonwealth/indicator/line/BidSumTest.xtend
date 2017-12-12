package com.sirolf2009.commonwealth.indicator.line

import org.junit.Assert
import org.junit.Test

import static com.sirolf2009.commonwealth.indicator.line.IndicatorTestExtensions.*

class BidSumTest {
	
	@Test
	def void test() {
		Assert.assertEquals(60d, BidSum.bidSum(orderbook(#[order(1, 10), order(2, 20), order(3, 30)], #[])), 0.001d)
	}
	
}
