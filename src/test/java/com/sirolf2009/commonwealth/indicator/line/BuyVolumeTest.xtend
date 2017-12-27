package com.sirolf2009.commonwealth.indicator.line

import org.junit.Assert
import org.junit.Test

import static com.sirolf2009.commonwealth.indicator.line.IndicatorTestExtensions.*

class BuyVolumeTest {
	
	@Test
	def void test() {
		val buyVolume = new BuyVolume()
		val trades = #[
			trade(0, 100, 10),
			trade(10, 100, -10),
			trade(15, 100, -10),
			trade(20, 100, -10),
			trade(25, 100, -10),
			trade(999, 100, 10),
			trade(1000, 100, 10),
			trade(1001, 100, -10)
		]
		Assert.assertEquals(30, buyVolume.apply(tick(trades)).y.intValue)
	}
	
}