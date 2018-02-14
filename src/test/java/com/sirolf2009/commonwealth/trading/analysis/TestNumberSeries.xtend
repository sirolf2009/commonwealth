package com.sirolf2009.commonwealth.trading.analysis

import org.junit.Assert
import org.junit.Test

class TestNumberSeries {
	
	@Test
	/** http://www.mathsisfun.com/data/standard-deviation.html */
	def void testStdDev() {
		assertEquals(147, Math.round(new NumberSeries(#[600, 470, 170, 430, 300]).getStdDev().getAsDouble()))
	}
	
	@Test
	/** http://www.mathsisfun.com/data/standard-deviation.html */
	def void testVariance() {
		assertEquals(21_704, new NumberSeries(#[600, 470, 170, 430, 300]).getVariance().getAsDouble())
	}
	
	@Test
	def void testMode() {
		assertEquals(3, new NumberSeries(#[1, 2, 2, 3, 3, 3]).getMode().get().getKey())
	}
	
	@Test
	def void testMedian() {
		assertEquals(2, new NumberSeries(#[1, 2, 3]).getMedian().getAsDouble())
		assertEquals(2, new NumberSeries(#[2, 1, 30]).getMedian().getAsDouble())
		assertEquals(2.5, new NumberSeries(#[1, 2, 3, 4]).getMedian().getAsDouble())
	}
	
	@Test
	def void testMean() {
		assertEquals(2.5, new NumberSeries(#[1, 2, 3, 4]).getMean().getAsDouble())
	}
	
	@Test
	def void testMax() {
		assertEquals(3, new NumberSeries(#[1, 2, 3]).getMax().getAsDouble())
	}
	
	@Test
	def void testMin() {
		assertEquals(1, new NumberSeries(#[1, 2, 3]).getMin().getAsDouble())
	}
	
	@Test
	def void testSum() {
		assertEquals(6, new NumberSeries(#[1, 2, 3]).sum())
	}
	
	def assertEquals(double expected, double actual) {
		Assert.assertEquals(expected, actual, 0.0001)
	}
	
}