package com.sirolf2009.commonwealth.indicator.line

import org.junit.Test
import java.time.Duration
import org.junit.Assert

import static com.sirolf2009.commonwealth.indicator.line.IndicatorTestExtensions.*

class BuyVolumeTest {
	
	@Test
	def void testSecond() {
		val buyVolume = new BuyVolume(Duration.ofSeconds(1).toMillis())
		val trades = #[
			trade(0, 100, 10), //out of range, should not be counted
			trade(10, 100, -10),
			trade(15, 100, -10),
			trade(20, 100, -10),
			trade(25, 100, -10),
			trade(999, 100, 10),
			trade(1000, 100, 10),
			trade(1001, 100, -10)
		]
		Assert.assertEquals(20, buyVolume.apply(tick(trades)).y.intValue)
	}
	
	@Test
	def void testHour() {
		val buyVolume = new BuyVolume(Duration.ofHours(1).toMillis())
		val trades = #[
			trade(0, 100, 10), //in range, should be counted
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