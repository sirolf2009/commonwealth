package com.sirolf2009.commonwealth.indicator.line

import com.sirolf2009.commonwealth.ITick
import java.util.LinkedList
import org.junit.Test

import static com.sirolf2009.commonwealth.indicator.line.IndicatorTestExtensions.*
import org.junit.Assert

class EMATest {
	
	@Test 
	def void test() {
		val ema = new EMA(10, new TestIndicator())
		(0 ..< 9).forEach[
			Assert.assertEquals(Double.NaN, ema.apply(tick(#[trade(System.currentTimeMillis, 100)])).y.doubleValue, 0d)
		]
		Assert.assertEquals(22.22, ema.apply(tick(#[trade(System.currentTimeMillis, 100)])).y.doubleValue, 0.005d)
		Assert.assertEquals(22.21, ema.apply(tick(#[trade(System.currentTimeMillis, 100)])).y.doubleValue, 0.005d)
		Assert.assertEquals(22.24, ema.apply(tick(#[trade(System.currentTimeMillis, 100)])).y.doubleValue, 0.005d)
		Assert.assertEquals(22.27, ema.apply(tick(#[trade(System.currentTimeMillis, 100)])).y.doubleValue, 0.005d)
		Assert.assertEquals(22.33, ema.apply(tick(#[trade(System.currentTimeMillis, 100)])).y.doubleValue, 0.005d)
		Assert.assertEquals(22.52, ema.apply(tick(#[trade(System.currentTimeMillis, 100)])).y.doubleValue, 0.005d)
	}
	
	static class TestIndicator extends LineIndicator {
		
		val buffer = new LinkedList(#[
			22.27,
			22.19,
			22.08,
			22.17,
			22.18,
			22.13,
			22.23,
			22.43,
			22.24,
			22.29,
			22.15,
			22.39,
			22.38,
			22.61,
			23.36
		])
		
		override get(ITick tick) {
			return buffer.poll()
		}
		
		override copy() {
			throw new UnsupportedOperationException("TODO: auto-generated method stub")
		}
		
	}
	
}